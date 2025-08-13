@extends('layout')

@section('header')
  
@endsection

@section('content')

    <div class="row">
        <div class="col-md-12">
			<br />
			
			<div class="index_layout">
			
			<!-- code started -->			
			<ul class="products">
			 <?php
				
			   $USER_ID = $wp_user->ID;
			   
				//Devuelve todas las subscripciones 
				//Cada subscripcion puede tener varias subscripciones
				$subscriptions = wcs_get_users_subscriptions($USER_ID);
				
				foreach ($subscriptions as  $key => $subscription ){
					
					$subscription_id = $subscription->get_id();
					$subscription_status = $subscription->get_status();
					$order_items = $subscription->get_items();
					
					if( $subscription_status == 'active' ){
				
						foreach ( $order_items as $key => $item ) {
							
							$_product = wc_get_product($item['product_id']);
										              
							echo '<h4 class="title">' . get_the_title( $item['product_id']) .'</h4>';

		                    echo '<div class="content table-responsive table-full-width">';
		                    echo '    <table class="table table-hover table-striped">';
		                    echo '        <thead>';  
							echo '<th>API Key</th>';
							echo '<th>Validated Server</th>';
							echo '<th>Actions</th>';
		                    echo '       </thead>';
		                    echo '        <tbody>';
							
							foreach ($sites as $site ){
								
								if(($site->product_id == $item['product_id']) & ($site->subscription_id == $subscription_id)){
									
	                                echo '<tr>';
	                                echo '<td>'.$site->api_key.'</td>';
									echo '<td>'.$site->domain.'</td>';	
									
									echo '<td>';
									echo '<form action="/delete_api_key" method="post">';
									echo '<input type="hidden" name="_token" value="' . csrf_token() .'">';
									echo '<input type="hidden" name="site_id" value="'.$site->id.'">';
									echo '<input type="submit" value="Delete API Key">';
									echo '</form>';
									echo '</td>';
									
									echo '</tr>';
									
								}
                              	
							}
							echo '        </tbody>';
							echo '        </table>';
							echo '        </div>';
							
							echo '<form action="/create_api_key" method="post">';
							echo '<input type="hidden" name="_token" value="' . csrf_token() .'">';
							echo '<input type="hidden" name="product_id" value="'.$item['product_id'].'">';
							echo '<input type="hidden" name="subscription_id" value="'.$subscription_id.'">';
							echo '<input class="et_manage_submit" type="submit" value="Add New API Key">';
							echo '</form>';
			                    
							
						}
					
					echo '<br />';
					echo '<br />';
							
					//}
					
					}
	
				}
				
				
				/*			
			    $customer_orders = get_posts( array(
					           'numberposts' => -1,
					           'meta_key'    => '_customer_user',
					           'meta_value'  => $USER_ID,
					           'post_type'   => "shop_order",
					           'post_status' => ['wc-pending','wc-active'],
				) );
				
				//echo '<pre/>'; print_r( $customer_orders );
				
				foreach($customer_orders as $key => $order)
				{
					
					$order_id = $order->ID;
				    $order = new WC_Order( $order->ID );
				    $order_items = $order->get_items();
					
					foreach ( $order_items as $key => $item ) {
					
						$_product = get_product($item[product_id]);
						echo("<h4><a href='/set_omission?order_id=$order_id&user_id=$USER_ID&product_id=$item[product_id]&order_item_id=$key'>" . get_the_title( icl_object_id( $item[product_id], 'product', false, $current_user->ogrowthlang ) ) . '</a></h4>');
						echo("<a href='/set_omission?order_id=$order_id&user_id=$USER_ID&product_id=$item[product_id]&order_item_id=$key'>" . $_product->get_image($size = array($image_width, $image_height)) . '</a>');
					}
					
				}
				*/

			?>
			</ul><!--/.products-->
		
			
		</div>

 	   <br />
	    <br />

</div>
</div>
	

@endsection

