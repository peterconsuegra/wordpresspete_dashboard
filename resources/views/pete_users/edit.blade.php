@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Edit User #{{ $pete_user->id }}</h5>
                <a href="{{ route('pete_users.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
            <div class="card-body">
                <form action="{{ route('pete_users.update', $pete_user->id) }}" method="POST" class="needs-validation" novalidate>
                    @csrf @method('PUT')
                    @include('pete_users._form', ['user' => $pete_user])
                </form>
            </div>
        </div>
    </div>
@endsection
