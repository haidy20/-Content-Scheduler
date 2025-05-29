<?php

namespace App\Observers;

use App\Models\Post;
use App\Models\ActivityLog;  
use Illuminate\Support\Facades\Auth;

class PostObserver
{
    public function created(Post $post)
    {
        $this->logActivity($post, 'created');
    }

    public function updated(Post $post)
    {
        $changes = $post->getChanges(); 
        $original = $post->getOriginal();

        $diff = [];
        foreach ($changes as $key => $value) {
            if ($key !== 'updated_at') {
                $diff[$key] = [
                    'old' => $original[$key] ?? null,
                    'new' => $value,
                ];
            }
        }

        $this->logActivity($post, 'updated', $diff);
    }

    public function deleted(Post $post)
    {
        $this->logActivity($post, 'deleted');
    }

    protected function logActivity(Post $post, string $action, $changes = null)
    {
        ActivityLog::create([
            'entity_id' => $post->id,
            'action' => $action,
            'changed_by' => Auth::id() ?? null,
        'changes' => $changes ? json_encode($changes) : ($action === 'created' ? json_encode($post->toArray()) : null),
        ]);
    }
}
