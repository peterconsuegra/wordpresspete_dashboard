@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white">
                <h5 class="mb-0">Pete Plugins</h5>
                <a href="{{ route('pete_plugins.create') }}" class="btn btn-pete d-inline-flex align-items-center gap-1">
                    <i class="bi bi-plus-lg"></i> Create
                </a>
            </div>

            <div class="card-body p-0">
                @if ($pete_plugins->count())
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col" class="text-nowrap">Title</th>
                                    <th scope="col" class="text-nowrap">Option&nbsp;Name</th>
                                    <th scope="col" class="text-nowrap">Version</th>
                                    <th scope="col">Description</th>
                                    <th scope="col" class="text-end text-nowrap">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pete_plugins as $plugin)
                                    <tr>
                                        <td class="fw-semibold">{{ $plugin->title }}</td>
                                        <td>{{ $plugin->option_name }}</td>
                                        <td>{{ $plugin->version }}</td>
                                        <td class="small text-truncate" style="max-width: 320px;">{{ Str::limit($plugin->description, 120) }}</td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="{{ route('pete_plugins.edit', $plugin->id) }}" class="btn btn-outline-secondary" title="Edit">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                                <form action="{{ route('pete_plugins.destroy', $plugin->id) }}" method="POST" onsubmit="return confirm('Delete this plugin?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger" title="Delete">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3">
                        <i class="bi bi-info-circle me-2"></i> No plugins found.
                    </div>
                @endif
            </div>

            @if ($pete_plugins->hasPages())
                <div class="card-footer bg-white py-3">
                    {{ $pete_plugins->links('pagination::bootstrap-5') }}
                </div>
            @endif
        </div>
    </div>
@endsection