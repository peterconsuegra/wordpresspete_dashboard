@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white">
                <h5 class="mb-0">Pete Installers</h5>
                <a href="{{ route('pete_installers.create') }}" class="btn btn-pete d-inline-flex align-items-center gap-1">
                    <i class="bi bi-plus-lg"></i> Create
                </a>
            </div>
            <div class="card-body p-0">
                @if ($pete_installers->count())
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">Script Name</th>
                                    <th scope="col">URL</th>
                                    <th scope="col">Snippet</th>
                                    <th scope="col" class="text-end text-nowrap">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pete_installers as $installer)
                                    <tr>
                                        <td class="fw-semibold">{{ $installer->script_name }}</td>
                                        <td class="small text-break" style="max-width:200px;">
                                            <a href="{{ $installer->url }}" target="_blank">{{ Str::limit($installer->url, 45) }}</a>
                                        </td>
                                        <td class="small font-monospace text-truncate" style="max-width:260px;">{{ Str::limit($installer->linux, 80) }}</td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="{{ route('pete_installers.show', $installer->id) }}" class="btn btn-outline-primary" title="View"><i class="bi bi-eye"></i></a>
                                                <a href="{{ route('pete_installers.edit', $installer->id) }}" class="btn btn-outline-secondary" title="Edit"><i class="bi bi-pencil"></i></a>
                                                <form action="{{ route('pete_installers.destroy', $installer->id) }}" method="POST" onsubmit="return confirm('Delete this installer?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger" title="Delete"><i class="bi bi-trash"></i></button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3"><i class="bi bi-info-circle me-2"></i>No installers found.</div>
                @endif
            </div>
            @if ($pete_installers->hasPages())
                <div class="card-footer bg-white py-3">
                    {{ $pete_installers->links('pagination::bootstrap-5') }}
                </div>
            @endif
        </div>
    </div>
@endsection
