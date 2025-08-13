@extends('layout')

@section('content')
<div class="row mt-4">
    <div class="col-md-12">
        <div class="index_layout">
            <ul class="products list-unstyled">
                @foreach($subscriptions as $subscription)
                    @if($subscription['status'] === 'active')
                        @foreach($subscription['items_hash'] as $item)
                            @foreach($item as $product_id => $product_name)
                                <li class="mb-3 p-3 border rounded shadow-sm bg-white">
                                    <h6 class="mb-1">
                                        <strong>Product ID:</strong> {{ $product_id }}
                                    </h6>
                                    <p class="mb-3">
                                        <strong>Product Name:</strong> {{ $product_name }}
                                    </p>

                                    <!-- Existing API Keys -->
                                    <div class="table-responsive mb-3">
                                        <table class="table table-sm table-hover align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>API Key</th>
                                                    <th>Validated Server</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($sites as $site)
                                                    @if($site->product_id == $product_id && $site->subscription_id == $subscription['id'])
                                                        <tr>
                                                            <td class="text-break">{{ $site->api_key }}</td>
                                                            <td>{{ $site->domain }}</td>
                                                            <td>
                                                                <form action="/delete_api_key" method="post" class="d-inline">
                                                                    @csrf
                                                                    <input type="hidden" name="site_id" value="{{ $site->id }}">
                                                                    <button type="submit" class="btn btn-sm btn-danger">
                                                                        <i class="bi bi-trash"></i> Delete API Key
                                                                    </button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    @endif
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Add New API Key -->
                                    <form action="/create_api_key" method="post" class="d-flex flex-wrap gap-2">
                                        @csrf
                                        <input type="hidden" name="product_id" value="{{ $product_id }}">
                                        <input type="hidden" name="subscription_id" value="{{ $subscription['id'] }}">
                                        <button type="submit" class="btn btn-sm btn-success">
                                            <i class="bi bi-plus-circle"></i> Add New API Key
                                        </button>
                                    </form>
                                </li>
                            @endforeach
                        @endforeach
                    @endif
                @endforeach
            </ul>
        </div>
    </div>
</div>
@endsection
