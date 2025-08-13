@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Edit Plugin #{{ $pete_plugin->id }}</h5>
                <a href="{{ route('pete_plugins.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
            </div>

            <div class="card-body">
                <form action="{{ route('pete_plugins.update', $pete_plugin->id) }}" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                    @csrf
                    @method('PUT')
                    @include('pete_plugins._form', ['plugin' => $pete_plugin])
                </form>
            </div>
        </div>
    </div>
@endsection
