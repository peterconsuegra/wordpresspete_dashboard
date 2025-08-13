                <div class="card">
                    <div class="header">
						@if(isset($_product->ID))
						<h4 class="title">{{$_product->get_title()}}</h4>
						@endif
                        
                        <p class="title">API Key: {{$user->api_key}}</p>
						
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                               
                                <th>URL</th>
								<th>Key</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </thead>
                            <tbody>
								
								 @foreach($sites as $site)
								
                                <tr>
                                  
                                    <td>{{$site->domain}}</td>
									<td>{{$site->key}}</td>
                                    <td>Validated</td>
                                    <td>
                                    	<a href="{{$site->domain}}"><i class="pe-7s-look"></i></a>
										@if($role == "administrator")
	                                    <form action="{{ route('sites.destroy', $site->id) }}" method="POST" style="display: inline;" onsubmit="if(confirm('Delete? Are you sure?')) { return true } else {return false };">
	                                        <input type="hidden" name="_method" value="DELETE">
	                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
											
											@if($get_customer)
											  <input type="hidden" name="current_user_id" value="{{$site->user_id}}">
										    @endif	
											
	                                        <button type="submit" class="btn btn-xs btn-danger">Delete</button>
	                                    </form>
										@endif
                                    </td>
                                </tr>
                              
							  @endforeach
							  
							  
							  
                            </tbody>
                        </table>

						

                    </div>
					
					
					
                </div>