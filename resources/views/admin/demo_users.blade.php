@extends('layout')


@section('content')
    <div class="row">
        <div class="col-md-12">
			
			<h3>Pete Demo Users</h3>
			
            <table id="demo_user_table" class="table table-condensed table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
						<th>Name</th>
						<th>Email</th>  
						<th>Created at</th>  
                    </tr>
                </thead>

                <tbody>
                   
				</tbody>
			</table>

        </div>
    </div>
	
	
	<script>
		
		$(document).ready(function(){
			get_demo_users();
		});
		
		function get_demo_users(){
			var demo_url = "{{$dashboard_option->get_meta_value('demo_url')}}";
			
		 	$.ajax({
		 		url: demo_url+"/get_demo_users",
		 		dataType: 'JSONP',
		 		type: 'GET',
		 		success : function(result) {
					
					console.log(result);
					rows ="";
					for (var item in result) {
						rows+="<tr>";
						rows+="<td>"+result[item].id+"</td>";
						rows+="<td>"+result[item].name+"</td>";
						rows+="<td>"+result[item].email+"</td>";
						rows+="<td>"+result[item].created_at+"</td>";
						rows+="</tr>";
					}
					
					$('#demo_user_table tr:last').after(rows);
	           }
	
	     	});
		}
		
	</script>

@endsection