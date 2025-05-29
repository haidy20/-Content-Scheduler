<?php

namespace App\Http\Requests\Posts;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePostRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'nullable|string',
            'content' => 'nullable|string',
            'image' => 'nullable|image',
            'scheduled_time' => 'nullable|date',
            'status' => 'nullable|in:draft,scheduled,published',
            'platforms' => 'nullable|array',
            'platforms.*' => 'exists:platforms,id',
        ];
    }


    public function messages(): array
    {
        return [
            'platforms.*.exists' => 'One or more selected platforms are invalid.',
        ];
    }
}
