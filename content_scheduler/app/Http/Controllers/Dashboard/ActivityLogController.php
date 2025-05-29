<?php

namespace App\Http\Controllers\Dashboard;
use App\Models\ActivityLog;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActivityLogController extends Controller
{
    public function index()
    {
        $logs = ActivityLog::with('user')->orderBy('created_at', 'desc')->get();
        return response()->json([
            'success' => true,
            'data' => $logs
        ]);
    }

}
