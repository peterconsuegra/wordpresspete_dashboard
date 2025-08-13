@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white">
                <h5 class="mb-0">WordPress Plugins</h5>
                <a href="{{ route('wp_plugins.create') }}" class="btn btn-pete d-inline-flex align-items-center gap-1">
                    <i class="bi bi-plus-lg"></i> Create
                </a>
            </div>

            <div class="card-body p-0">
                @if ($wp_plugins->count())
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">Title</th>
                                    <th scope="col">Version</th>
                                    <th scope="col">Description</th>
                                    <th scope="col" class="text-nowrap">URL</th>
                                    <th scope="col" class="text-end text-nowrap">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($wp_plugins as $plugin)
                                    <tr>
                                        <td class="fw-semibold">{{ $plugin->title }}</td>
                                        <td>{{ $plugin->version }}</td>
                                        <td class="small text-truncate" style="max-width: 280px;">{{ Str::limit($plugin->description, 120) }}</td>
                                        <td class="small text-break" style="max-width: 180px;">
                                            <a href="{{ $plugin->url }}" target="_blank">{{ Str::limit($plugin->url, 45) }}</a>
                                        </td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="{{ route('wp_plugins.edit', $plugin->id) }}" class="btn btn-outline-secondary">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                                <form action="{{ route('wp_plugins.destroy', $plugin->id) }}" method="POST" onsubmit="return confirm('Delete this plugin?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger">
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
                    <div class="alert alert-info m-3"><i class="bi bi-info-circle me-2"></i>No plugins found.</div>
                @endif
            </div>

            @if ($wp_plugins->hasPages())
                <div class="card-footer bg-white py-3">
                    {{ $wp_plugins->links('pagination::bootstrap-5') }}
                </div>
            @endif
        </div>
    </div>
@endsection
