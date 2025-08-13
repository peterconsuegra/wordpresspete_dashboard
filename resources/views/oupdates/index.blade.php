<?php /** @var \Illuminate\Pagination\LengthAwarePaginator $oupdates */ ?>
@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white">
                <h5 class="mb-0">System Updates</h5>
                <a href="{{ route('oupdates.create') }}" class="btn btn-pete d-inline-flex align-items-center gap-1">
                    <i class="bi bi-plus-lg"></i> Create
                </a>
            </div>

            <div class="card-body p-0">
                @if ($oupdates->count())
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col" class="text-nowrap">Parent&nbsp;Version</th>
                                    <th scope="col" class="text-nowrap">Version</th>
                                    <th scope="col" class="w-100">Scripts</th>
                                    <th scope="col" class="text-end text-nowrap">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($oupdates as $oupdate)
                                    <tr>
                                        <td>{{ $oupdate->parent_version }}</td>
                                        <td>{{ $oupdate->version }}</td>
                                        <td class="small">
                                            <code class="d-block text-wrap">{{ Str::limit($oupdate->olinux_script, 160) }}</code>
                                        </td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="{{ route('oupdates.edit', $oupdate->id) }}" class="btn btn-outline-secondary">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                                <form action="{{ route('oupdates.destroy', $oupdate->id) }}" method="POST"
                                                      onsubmit="return confirm('Delete this update?');">
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
                    <div class="alert alert-info m-3">
                        <i class="bi bi-info-circle me-2"></i> No updates found.
                    </div>
                @endif
            </div>

            @if ($oupdates->hasPages())
                <div class="card-footer bg-white py-3">
                    {{ $oupdates->links('pagination::bootstrap-5') }}
                </div>
            @endif
        </div>
    </div>
@endsection
