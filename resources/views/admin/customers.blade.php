@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white">
                <h5 class="mb-0">WordPress Users <span class="badge text-bg-light">{{ count($users) }}</span></h5>
            </div>

            <div class="card-body p-0">
                @if(count($users))
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col" class="text-nowrap">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Roles</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <td>{{ $user['id'] }}</td>
                                        <td class="fw-semibold">{{ $user['name'] }}</td>
                                        <td>{{ $user['email'] }}</td>
                                        <td class="small">{{ implode(', ', $user['roles']) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3">
                        <i class="bi bi-info-circle me-2"></i>No users found.
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
