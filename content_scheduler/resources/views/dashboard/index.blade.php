@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
<h2 class="mb-4">Dashboard Overview</h2>

<div class="row g-4">
    <div class="col-md-4">
        <div class="card text-white bg-primary shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Total Scheduled Posts</h5>
                <p id="totalPosts" class="display-6">0</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-white bg-success shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Posts Posted</h5>
                <p id="postedCount" class="display-6">0</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-white bg-warning shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Posts Pending</h5>
                <p id="pendingCount" class="display-6">0</p>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
async function fetchDashboardStats() {
    try {
        const res = await fetch('/api/dashboard/stats', {headers: {'Accept': 'application/json'}});
        const data = await res.json();

        if (data.status) {
            document.getElementById('totalPosts').textContent = data.data.total_posts;
            document.getElementById('postedCount').textContent = data.data.posted;
            document.getElementById('pendingCount').textContent = data.data.pending;
        }
    } catch (error) {
        console.error(error);
    }
}

document.addEventListener('DOMContentLoaded', fetchDashboardStats);
</script>
@endpush
