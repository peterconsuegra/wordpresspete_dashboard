@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">New Pete Installer</h5>
                <a href="{{ route('pete_installers.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
            <div class="card-body">
                <form action="{{ route('pete_installers.store') }}" method="POST" class="needs-validation" novalidate>
                    @csrf
                    @include('pete_installers._form', ['installer' => null])
                </form>
            </div>
        </div>
    </div>
@endsection
