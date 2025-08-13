@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white">
                <h5 class="mb-0">WordPress Users <span class="badge text-bg-light">{{ count($subscriptions) }}</span></h5>
            </div>

            <div class="card-body p-0">
                @if(count($subscriptions))
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
                                @forelse($subscriptions as $subscription)
                                   <tr>
                                        <td>{{ $subscription['id'] }}</td>
                                        <td>{{ \Carbon\Carbon::parse($subscription['date_created'])->format('Y-m-d H:i') }}</td>
                                        <td>{{ ucfirst($subscription['status']) }}</td>
                                        <td>{{ number_format($subscription['total'], 2) }}</td>
                                        <td>{{ $subscription['currency'] }}</td>
                                      
                                        <td>{{ $subscription['billing_email'] }}</td>
                                    
                                        <td>{{ $subscription['item_count'] }}</td>
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



    <div class="row mt-4">
        <div class="col-md-12">
            <div class="index_layout">
                <ul class="products list-unstyled">
                    @foreach($subscriptions as $subscription)
                        @if($subscription['status'] === 'active')
                            @foreach($subscription['items_hash'] as $item)
                                @foreach($item as $product_id => $product_name)
                                    <li class="mb-2">
                                        <strong>Product ID:</strong> {{ $product_id }} <br>
                                        <strong>Product Name:</strong> {{ $product_name }}
                                    </li>


                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead> 
                                                <th>API Key</th>
                                                <th>Validated Server</th>
                                                <th>Actions</th>
                                            </thead>
                                            <tbody>

                                    @foreach ($sites as $site )
								
                                        @if(($site->product_id == $product_id) & ($site->subscription_id == $subscription['id']))
                                        
                                            <tr>
                                            <td>{{$site->api_key}}</td>
                                            <td>{{$site->domain}}</td>	
                                            
                                            <td>
                                            <form action="/delete_api_key" method="post">
                                                <input type="hidden" name="_token" value="">
                                                <input type="hidden" name="site_id" value="{{$site->id}}">
                                                <input type="submit" value="Delete API Key">
                                            </form>
                                            </td>
                                            </tr>
                                        @endif

                                         
							           
							
                                    @endforeach

                                       </tbody>
							            </table>

                                     </div>

                                @endforeach
                            @endforeach
                        @endif
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
@endsection