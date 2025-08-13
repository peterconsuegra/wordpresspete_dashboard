@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Edit WordPress Plugin #{{ $wp_plugin->id }}</h5>
                <a href="{{ route('wp_plugins.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
            <div class="card-body">
                <form action="{{ route('wp_plugins.update', $wp_plugin->id) }}" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                    @csrf
                    @method('PUT')
                    @include('wp_plugins._form', ['plugin' => $wp_plugin])
                </form>
            </div>
        </div>
    </div>
@endsection
