@extends('layouts.app')

@section('title', 'Create New Post')

@section('content')
<h2 class="mb-4">Create New Post</h2>

<form id="postForm" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label for="title" class="form-label">Post Title</label>
        <input type="text" maxlength="255" class="form-control" id="title" name="title" required>
        <div id="titleCount" class="char-counter">0 / 255 characters</div>
    </div>

    <div class="mb-3">
        <label for="content" class="form-label">Content</label>
        <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
    </div>

    <div class="mb-3">
        <label for="image" class="form-label">Post Image (optional)</label>
        <input class="form-control" type="file" id="image" name="image" accept="image/*">
    </div>

    <div class="mb-3">
        <label for="platforms" class="form-label">Select Platforms</label>
        <select class="form-select" id="platforms" name="platforms[]" multiple required>
            <!-- سيتم تحميل المنصات بواسطة JS -->
        </select>
    </div>

    <div class="mb-3">
        <label for="scheduled_time" class="form-label">Schedule Date & Time</label>
        <input type="datetime-local" class="form-control" id="scheduled_time" name="scheduled_time" required>
    </div>

    <button type="submit" class="btn btn-primary">Create Post</button>
</form>

<div id="alertPlaceholder" class="mt-3"></div>

@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // تحديث عداد الحروف في العنوان
        const titleInput = document.getElementById('title');
        const titleCount = document.getElementById('titleCount');
        titleInput.addEventListener('input', () => {
            titleCount.textContent = `${titleInput.value.length} / 255 characters`;
        });

        // تحميل المنصات من API
        const platformsSelect = document.getElementById('platforms');
        fetch('/api/platforms')
            .then(res => res.json())
            .then(data => {
                if (data.status) {
                    data.data.forEach(platform => {
                        const option = document.createElement('option');
                        option.value = platform.id;
                        option.textContent = platform.name;
                        platformsSelect.appendChild(option);
                    });
                }
            });

        // إرسال الفورم عبر fetch
        const form = document.getElementById('postForm');
        form.addEventListener('submit', async (e) => {
            e.preventDefault();

            const formData = new FormData(form);

            try {
                const res = await fetch('/api/posts', {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Accept': 'application/json',
                    },
                    body: formData,
                    credentials: 'include' // not 'same-origin' if on different subdomains

                });

                const data = await res.json();

                const alertPlaceholder = document.getElementById('alertPlaceholder');
                alertPlaceholder.innerHTML = '';

                if (data.status) {
                    alertPlaceholder.innerHTML = `<div class="alert alert-success">${data.message}</div>`;
                    form.reset();
                    titleCount.textContent = '0 / 255 characters';
                } else {
                    alertPlaceholder.innerHTML = `<div class="alert alert-danger">${data.message || 'Failed to create post.'}</div>`;
                }
            } catch (error) {
                alertPlaceholder.innerHTML = `<div class="alert alert-danger">Network error, please try again.</div>`;
            }
        });
    });
</script>
@endpush