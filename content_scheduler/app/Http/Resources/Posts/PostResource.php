<?php

namespace App\Http\Resources\Posts;

use App\Http\Resources\Platforms\PlatformResource;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'content' => $this->content,
            'image_url' => $this->image_url ? asset('storage/' . $this->image_url) : null,
            'scheduled_time' => $this->scheduled_time,
            'status' => $this->status,
            'platforms' => PlatformResource::collection($this->platforms),
        ];
    }
}
