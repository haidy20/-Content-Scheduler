<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    use HasFactory;

    protected $guarded = [
        'id',
        'created_at', 
        'updated_at', 
    ];

    public function post()
{
    return $this->belongsTo(Post::class, 'entity_id');
}

        public function user()
    {
        return $this->belongsTo(User::class, 'changed_by');
    }
}
