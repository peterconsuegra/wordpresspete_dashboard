@extends('layout')

@section('header')

<style>

	.list th {
	    background-color: #cecece;
	    text-align: left;
	    color: black;
	    padding: 0.4em 0.3em 0.4em 0.4em;
	    font-weight: 700;
	    font-size: 14px;
	}

</style>  
@endsection

@section('content')
			
<div class="row">
            <div class="col-md-12">

			
			<table class="table table-responsive list">
				<tbody><tr>
					<th colspan="6">All Tickets</th>
				</tr>

				<tr class="list_head">
					<td>TicketID</td>
					<td>Summary</td>
					<td>Regarding</td>
					<td>Status</td>
					<td nowrap="" align="right">Opened</td>
					<td nowrap="" align="right">Last Updated</td>
				</tr>

	
				  @foreach($otickets as $oticket)
		

					<tr class="list_entry" style="">
						<td><a href="/otickets/{{$oticket->id}}">{{$oticket->id}}</a></td>
						<td><a href="/otickets/{{$oticket->id}}">{{$oticket->summary}}</a></td>
						<td>
				
								{{$oticket->regarding}}<br>
				
						</td>
						<td>{{$oticket->status}}</td>
						<td nowrap="" align="right">
							{{$oticket->created_at}} <br>

							<span class="hint">
								
								<strong>{{$oticket->opened_by_login}}</strong>
							</span>
						</td>
						<td nowrap="" align="right">
							{{$oticket->updated_at}}<br>
							<span class="hint">
								
								<strong>{{$oticket->updated_by_login}}</strong>
							</span>
						</td>
					</tr>
	
				@endforeach


			</tbody></table>
			
			 {!! $otickets->render() !!}
				
		   </div>
</div>
   
@endsection

