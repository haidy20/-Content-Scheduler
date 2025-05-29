<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{

 public function stats(Request $request)
    {
        $user = $request->user();
        $totalPosts = $user->posts()->count();

        $postsByStatus = $user->posts()
            ->selectRaw('status, COUNT(*) as count')
            ->groupBy('status')
            ->pluck('count', 'status');

        // عدد البوستات المجدولة لكل يوم (آخر 7 أيام مثلاً)
        $scheduledPosts = $user->posts()
            ->whereNotNull('scheduled_time')
            ->where('scheduled_time', '>=', now()->subDays(2))
            ->selectRaw('DATE(scheduled_time) as date, COUNT(*) as count')
            ->groupBy('date')
            ->orderBy('date')
            ->get();

        return response()->json([
            'status' => true,
            'message' => 'Dashboard stats fetched successfully',
            'data' => [
                'total_posts' => $totalPosts,
                'posts_by_status' => $postsByStatus,
                'scheduled_posts' => $scheduledPosts,
            ]
        ]);
    }

}
