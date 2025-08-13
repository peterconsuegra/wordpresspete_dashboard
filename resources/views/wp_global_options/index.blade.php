@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white">
                <h5 class="mb-0">Global Options</h5>
                <a href="{{ route('wp_global_options.create') }}" class="btn btn-pete d-inline-flex align-items-center gap-1"><i class="bi bi-plus-lg"></i> Create</a>
            </div>
            <div class="card-body p-0">
                @if ($wp_global_options->count())
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Option Name</th>
                                    <th scope="col">Value</th>
                                    <th scope="col">Image</th>
                                    <th scope="col" class="text-end text-nowrap">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($wp_global_options as $opt)
                                    <tr>
                                        <td>{{ $opt->id }}</td>
                                        <td class="fw-semibold">{{ $opt->option_name }}</td>
                                        <td class="small text-truncate" style="max-width:300px;">{{ Str::limit($opt->option_value, 120) }}</td>
                                        <td>
                                            @if($opt->image)
                                                <img src="{{ asset('options/' . $opt->image) }}" alt="img" class="img-thumbnail" style="max-height:60px;">
                                            @endif
                                        </td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="{{ route('wp_global_options.edit', $opt->id) }}" class="btn btn-outline-secondary"><i class="bi bi-pencil"></i></a>
                                                <form action="{{ route('wp_global_options.destroy', $opt->id) }}" method="POST" onsubmit="return confirm('Delete this option?');">
                                                    @csrf
                                                    @method('DELETE')
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
                    <div class="alert alert-info m-3"><i class="bi bi-info-circle me-2"></i>No options found.</div>
                @endif
            </div>
            @if ($wp_global_options->hasPages())
                <div class="card-footer bg-white py-3">{{ $wp_global_options->links('pagination::bootstrap-5') }}</div>
            @endif
        </div>
    </div>
@endsection