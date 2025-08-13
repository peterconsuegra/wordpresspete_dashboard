@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white">
                <h5 class="mb-0">Pete Users</h5>
                <a href="{{ route('pete_users.create') }}" class="btn btn-pete d-inline-flex align-items-center gap-1"><i class="bi bi-plus-lg"></i> Create</a>
            </div>
            <div class="card-body p-0">
                @if ($pete_users->count())
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Country</th>
                                    <th>Email</th>
                                    <th>OS</th>
                                    <th>Distro</th>
                                    <th>Version</th>
                                    <th>Installs</th>
                                    <th>Contact&nbsp;Again</th>
                                    <th>Created</th>
                                    <th class="text-end text-nowrap">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pete_users as $u)
                                    <tr>
                                        <td>{{ $u->id }}</td>
                                        <td class="fw-semibold">{{ $u->name }}</td>
                                        <td>{{ $u->country }}</td>
                                        <td>{{ $u->email }}</td>
                                        <td>{{ $u->os }}</td>
                                        <td>{{ $u->os_distribution }}</td>
                                        <td>{{ $u->os_version }}</td>
                                        <td>{{ $u->installs }}</td>
                                        <td>{{ $u->contact_me_again ? 'Yes' : 'No' }}</td>
                                        <td>{{ $u->created_at->format('Y-m-d') }}</td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="{{ route('pete_users.edit', $u->id) }}" class="btn btn-outline-secondary"><i class="bi bi-pencil"></i></a>
                                                <form action="{{ route('pete_users.destroy', $u->id) }}" method="POST" onsubmit="return confirm('Delete this user?');">
                                                    @csrf @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger"><i class="bi bi-trash"></i></button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3"><i class="bi bi-info-circle me-2"></i>No users found.</div>
                @endif
            </div>
            @if ($pete_users->hasPages())
                <div class="card-footer bg-white py-3">{{ $pete_users->links('pagination::bootstrap-5') }}</div>
            @endif
        </div>
    </div>
@endsection