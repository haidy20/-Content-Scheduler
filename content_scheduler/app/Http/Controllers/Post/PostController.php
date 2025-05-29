<?php

namespace App\Http\Controllers\Post;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Platform;

use App\Http\Requests\Posts\PostRequest;
use App\Http\Requests\Posts\UpdatePostRequest;
use App\Http\Resources\Posts\PostResource;

use Illuminate\Http\Request;

class PostController extends Controller
{

public function store(PostRequest $request)
{
    $postData = $request->validated();

    // Rate limiting logic
    if ($postData['status'] === 'scheduled') {
        $user = $request->user();
        $scheduledCount = $user->posts()
        ->where('status', 'scheduled')
        ->count();


        if ($scheduledCount >= 10) {
            return response()->json([
                'status' => false,
                'message' => 'You have reached the limit of 10 scheduled posts for today.',
                'data'=>null
            ], 422);
        }
    }

    // Create the post
    $post = $request->user()->posts()->create($postData);

    if ($request->hasFile('image')) {
        $imagePath = $request->file('image')->store('Posts', 'public');
        $post->update(['image_url' => $imagePath]);
    }

    $post->platforms()->attach($request->platforms);

    return response()->json([
        'status' => true,
        'message' => 'Post created successfully!',
        'data' => new PostResource($post)
    ], 201);
}

public function scheduledCount(Request $request)
{
    $user = $request->user();
    $count = $user->posts()
    ->where('status', 'scheduled')
    ->count();

    return response()->json([
        'status' => true,
        'message' => 'Scheduled posts count fetched successfully!',
        'data' => $count,
    ]);
}

    public function index(Request $request)
    {
        $query = $request->user()->posts()->with('platforms');

        $query->when($request->status, function ($q, $status) {
            $q->where('status', $status);
        });

        $query->when($request->date, function ($q, $date) {
            $q->whereDate('scheduled_time', $date);
        });

        $posts = PostResource::collection($query->get());

        return response()->json([
            'status' => true,
            'message' => 'Posts fetched successfully!',
            'data' => $posts
        ], 200);
    }

    public function update(UpdatePostRequest $request, $id)
    {
        $post = Post::find($id);

        if (!$post) {
            return response()->json([
                'status' => false,
                'message' => 'Post not found!',
                'data' => null
            ], 404);
        }

        $data = $request->validated();
        // dd($data);
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('Posts', 'public');
            $data['image_url'] = $imagePath;
        }

        $post->update($data);

        if ($request->platforms) {
            $post->platforms()->sync($request->platforms);
        }

        return response()->json([
            'status' => true,
            'message' => 'Post updated successfully!',
            'data' => new PostResource($post)
        ], 200);
    }

    public function destroy($id)
    {
        $post = Post::find($id);

        if (!$post) {
            return response()->json([
                'status' => false,
                'message' => 'Post not found!',
                'data' => null
            ], 404);
        }
        $post->delete();

        return response()->json([
            'status' => true,
            'message' => 'Post deleted successfully!',
            'data' => null
        ], 200);
    }

}
