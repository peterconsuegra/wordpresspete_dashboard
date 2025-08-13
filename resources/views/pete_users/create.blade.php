@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">New User</h5>
                <a href="{{ route('pete_users.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
            <div class="card-body">
                <form action="{{ route('pete_users.store') }}" method="POST" class="needs-validation" novalidate>
                    @csrf
                    @include('pete_users._form', ['user' => null])
                </form>
            </div>
        </div>
    </div>
@endsection