<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Log;
use App\Site;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\DashboardOption;
use View;
use Illuminate\Support\Facades\Http;
use App\Models\PeteSync;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	
	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$wordpress_url  = env('WP_URL');

		View::share(compact('dashboard_option','wordpress_url'));
	
	}
	
	public function customers(Request $request){
	
		$viewsw = "customers";
        $roles = $request->attributes->get('wp_roles');
        $users = PeteSync::fetchFromWp($request, 'users');
        return view('admin.customers', compact('users','viewsw','roles'));
	}

	public function orders(Request $request){
	
		$viewsw = "orders";
		$orders = PeteSync::fetchFromWp($request, 'orders');
		return view('admin.orders',compact('viewsw','orders'));
	}

	public function my_orders(Request $request)
    {
		Log::info("entro en my_orders");
		$orders = PeteSync($request, 'orders');
        return view('dashboard.my_orders', compact('orders'));
    }
	
	public function get_customer($id){
		
		
		$wp_user = get_user_by('id',$id);
		$viewsw = "customers";
		
		//Que tenga id de usuario logeado
		$sites = Site::orderBy('id', 'desc')->where('user_id', $wp_user->ID)->get();	
		
		return view('admin.get_customer', compact('viewsw','wp_user','sites'));
			
	}
	
	
	public function demo_users(){
		$viewsw = "demo_users";
		$dashboard_option = new DashboardOption();	
		return view('admin.demo_users',compact('viewsw','dashboard_option'));
	}
	
}
