<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Post;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class ProcessScheduledPosts extends Command
{
    protected $signature = 'posts:process-scheduled';
    protected $description = 'Process and publish scheduled posts';

    public function handle()
    {
        // Get the posts that are scheduled and due
        $duePosts = Post::where('status', 'scheduled')
            ->where('scheduled_time', '<=', Carbon::now())
            ->get();

        if ($duePosts->isEmpty()) {
            $this->info('No scheduled posts to process.');
            return 0;
        }

        foreach ($duePosts as $post) {
            $postValidForAllPlatforms = true;

            foreach ($post->platforms as $platform) {
                $platformName = strtolower($platform->name);  // Assuming the platform name is stored in 'name'

                // Validation rules per platform
                $contentLength = strlen($post->content);
                $isValid = true;

                if ($platformName === 'twitter' && $contentLength > 5) {
                    $isValid = false;
                } elseif ($platformName === 'linkedin' && $contentLength > 5) {
                    $isValid = false;
                }
                // Instagram has no length limit in this example

                if ($isValid) {
                    // Update the platform_status
                    $post->platforms()->updateExistingPivot($platform->id, ['platform_status' => 'published']);
                    Log::info("Post ID {$post->id} has been published to platform {$platform->name}.");
                } else {
                    // Mark platform status as failed due to validation
                    $post->platforms()->updateExistingPivot($platform->id, ['platform_status' => 'failed']);
                    Log::warning("Post ID {$post->id} failed to publish to {$platformName} due to content length.");
                    $postValidForAllPlatforms = false;
                }
            }

            if ($postValidForAllPlatforms) {
                $post->update(['status' => 'published']);
                Log::info("Post ID {$post->id} has been fully published.");
            } else {
                $post->update(['status' => 'scheduled']); // Keep it scheduled if not valid for all platforms
                Log::warning("Post ID {$post->id} was only scheduled.");
            }
        }

        $this->info('Processed ' . $duePosts->count() . ' scheduled posts.');
        return 0;
    }
}
