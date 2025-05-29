<?php

namespace App\Http\Resources\Platforms;


use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PlatformResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'is_active' => (bool) $this->is_active,  // مهم ترجع الـ is_active
            'type' => $this->type,
        ];
    }
}
