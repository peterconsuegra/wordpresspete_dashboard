@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">New Global Option</h5>
                <a href="{{ route('wp_global_options.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
            <div class="card-body">
                <form action="{{ route('wp_global_options.store') }}" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                    @csrf
                    @include('wp_global_options._form', ['option' => null])
                </form>
            </div>
        </div>
    </div>
@endsection