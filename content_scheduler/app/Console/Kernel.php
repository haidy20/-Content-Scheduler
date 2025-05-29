<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
  
    protected $commands = [
        \App\Console\Commands\ProcessScheduledPosts::class, // 👈 ضيفي ده
    ];

    /**
     * Define the application's command schedule.
     */
    // Every minute, check for scheduled posts and process them
    protected function schedule(Schedule $schedule): void
    {
        $schedule->command('posts:process-scheduled')->everyMinute();
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
