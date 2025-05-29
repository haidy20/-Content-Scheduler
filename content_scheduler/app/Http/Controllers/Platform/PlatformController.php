<?php

namespace App\Http\Controllers\Platform;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Platform;
use App\Models\Post;
use App\Http\Requests\Platforms\PlatformRequest;
use App\Http\Requests\Platforms\UpdatePlatformRequest;
use App\Http\Requests\Platforms\PlatformToggleRequest;

use App\Http\Resources\Platforms\PlatformResource;

use Illuminate\Support\Facades\Auth;

class PlatformController extends Controller
{
    public function index()
    {
            $platforms = Platform::all();

        return response()->json([
            'status' => true,
            'message' => 'Platforms fetched successfully',
            'data' => PlatformResource::collection($platforms)
        ]);
    }


public function store(PlatformRequest $request)
{
    $platform = Platform::create([
        'name' => $request->name,
        'type' => $request->type, 
    ]);

    return response()->json([
        'status' => true,
        'message' => 'Platform added successfully',
        'data' => new PlatformResource($platform)
    ]);
}


public function update(UpdatePlatformRequest $request, $id)
{
    $platform = Platform::findOrFail($id);

    $platform->update([
        'name' => $request->name,
        'type' => $request->type, 
    ]);

    return response()->json([
        'status' => true,
        'message' => 'Platform updated successfully',
        'data' => new PlatformResource($platform)
    ]);
}

public function destroy($id)
{
    $platform = Platform::findOrFail($id);
    $platform->delete();
    return response()->json([
        'status' => true,
        'message' => 'Platform deleted successfully',
        'data' => null

    ]);
}



public function togglePlatform(Request $request)
{
    $platform = Platform::findOrFail($request->platform_id);

    $platform->is_active = !$platform->is_active;
    $platform->save();

    return response()->json([
        'status' => true,
        'message' => $platform->is_active ? 'Platform activated' : 'Platform deactivated',
        'data' => [
            'platform_id' => $platform->id,
            'is_active' => $platform->is_active
        ]
    ]);
}



}
