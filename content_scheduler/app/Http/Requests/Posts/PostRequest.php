<?php
namespace App\Http\Requests\Posts;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Validator;
use Carbon\Carbon;

class PostRequest extends FormRequest
{
    public function rules()
    {
        return [
            'title' => 'required|string',
            'content' => 'required|string',
            'image' => 'nullable|image',
            'scheduled_time' => 'nullable|date',
            'status' => 'required|in:draft,scheduled,published',
            'platforms' => 'required|array',
            'platforms.*' => 'exists:platforms,id',
        ];
    }

    public function authorize()
    {
        return true;
    }

    public function messages(): array
    {
        return [
            'platforms.*.exists' => 'One or more selected platforms are invalid.',
        ];
    }

public function withValidator($validator)
{
    $validator->after(function ($validator) {
        $status = $this->input('status');
        $scheduledTime = $this->input('scheduled_time');

        if ($status === 'scheduled') {
            if (!$scheduledTime) {
                $validator->errors()->add('scheduled_time', 'Scheduled time is required when status is scheduled.');
            } elseif (Carbon::parse($scheduledTime)->lt(now())) {
                $validator->errors()->add('scheduled_time', 'Scheduled time must be now or in the future.');
            }
        } else {
            if ($scheduledTime) {
                $validator->errors()->add('scheduled_time', 'Scheduled time should only be set when status is scheduled.');
            }
        }
    });
}


}
