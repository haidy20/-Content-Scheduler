@extends('layouts.app')

@section('title', 'My Posts')

@section('content')
<h2 class="mb-4">My Posts</h2>

<div class="table-responsive">
    <table class="table table-striped table-bordered" id="postsTable">
        <thead class="table-primary">
            <tr>
                <th>Title</th>
                <th>Platforms</th>
                <th>Scheduled Time</th>
                <th>Status</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- سيتم تحميل البوستات عبر AJAX -->
        </tbody>
    </table>
</div>

<div id="alertPlaceholder" class="mt-3"></div>

@endsection

@push('scripts')
<script>
async function fetchPosts() {
    try {
        const res = await fetch('/api/posts', {
            headers: {'Accept': 'application/json'}
        });
        const data = await res.json();

        const tbody = document.querySelector('#postsTable tbody');
        tbody.innerHTML = '';

        if (data.status && data.data.length) {
            data.data.forEach(post => {
                const platformsNames = post.platforms.map(p => p.name).join(', ');
                const scheduledTime = new Date(post.scheduled_time).toLocaleString();
                const imageTag = post.image_url ? `<img src="/storage/${post.image_url}" alt="Post Image" style="max-width: 80px; max-height: 50px;">` : '—';

                tbody.insertAdjacentHTML('beforeend', `
                    <tr data-id="${post.id}">
                        <td>${post.title}</td>
                        <td>${platformsNames}</td>
                        <td>${scheduledTime}</td>
                        <td>${post.status}</td>
                        <td>${imageTag}</td>
                        <td>
                            <a href="/posts/${post.id}/edit" class="btn btn-sm btn-warning me-1">Edit</a>
                            <button class="btn btn-sm btn-danger btn-delete">Delete</button>
                        </td>
                    </tr>
                `);
            });
        } else {
            tbody.innerHTML = '<tr><td colspan="6" class="text-center">No posts found.</td></tr>';
        }
    } catch (error) {
        console.error(error);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    fetchPosts();

    // حذف بوست عند الضغط على زر Delete
    document.querySelector('#postsTable tbody').addEventListener('click', async e => {
        if (e.target.classList.contains('btn-delete')) {
            const tr = e.target.closest('tr');
            const postId = tr.dataset.id;

            if (confirm('Are you sure you want to delete this post?')) {
                try {
                    const res = await fetch(`/api/posts/${postId}`, {
                        method: 'DELETE',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        }
                    });
                    const data = await res.json();

                    const alertPlaceholder = document.getElementById('alertPlaceholder');
                    alertPlaceholder.innerHTML = '';

                    if (data.status) {
                        alertPlaceholder.innerHTML = `<div class="alert alert-success">${data.message}</div>`;
                        fetchPosts();
                    } else {
                        alertPlaceholder.innerHTML = `<div class="alert alert-danger">${data.message || 'Failed to delete post.'}</div>`;
                    }
                } catch (error) {
                    alertPlaceholder.innerHTML = `<div class="alert alert-danger">Network error, please try again.</div>`;
                }
            }
        }
    });
});
</script>
@endpush
