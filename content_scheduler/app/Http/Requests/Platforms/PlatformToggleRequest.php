<?php

namespace App\Http\Requests\Platforms;

use Illuminate\Foundation\Http\FormRequest;

class PlatformToggleRequest extends FormRequest
{
    public function rules()
    {
        return [
            'post_id' => 'required|exists:posts,id',
            'platform_id' => 'required|exists:platforms,id',
        ];
    }

    public function authorize()
    {
        return true;
    }
}
