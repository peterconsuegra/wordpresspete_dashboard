{{-- ===============================================================
     File: resources/views/oupdates/edit.blade.php
     Purpose: Edit screen for System Update using Bootstrap 5.3.7
------------------------------------------------------------------}}
@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Edit System Update #{{ $oupdate->id }}</h5>
                <a href="{{ route('oupdates.index') }}" class="btn btn-outline-secondary btn-sm d-inline-flex align-items-center gap-1">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
            </div>

            <div class="card-body">
                <form action="{{ route('oupdates.update', $oupdate->id) }}" method="POST" class="needs-validation" novalidate>
                    @csrf
                    @method('PUT')
                    @include('oupdates._form')
                </form>
            </div>
        </div>
    </div>
@endsection