<?php

namespace App\Http\Controllers;

use App\Standard\Generator;
use App\Standard\License;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use Log;
use App\Models\Site;
use App\Models\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\DashboardOption;
use View;
use Illuminate\Support\Facades\Http;
use App\Models\PeteSync;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	
	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$viewsw = "my_orders";
		$wordpress_url  = env('WP_URL');
		$roles = $request->attributes->get('wp_roles');
		View::share(compact('dashboard_option','viewsw','wordpress_url','roles'));
	
	}

	public function my_orders(Request $request){
		
		$wp_user = $request->attributes->get('wp_user');
		$user_id = $wp_user['user']["id"];
		$viewsw = "my_orders";
		$orders = PeteSync::fetchFromWp($request, "user-orders/$user_id");
		return view('dashboard.my_orders',compact('viewsw','orders'));
	}

	public function my_subscriptions(Request $request){
		
		$wp_user = $request->attributes->get('wp_user');
		$user_id = $wp_user['user']["id"];
		$viewsw = "my_subscriptions";
		$subscriptions = PeteSync::fetchFromWp($request, "user-subscriptions/$user_id");
		$sites = Site::orderBy('id', 'desc')->where('user_id', $user_id)->get();	

		return view('dashboard.my_subscriptions',compact('viewsw','subscriptions','sites'));
	}
	
	public function plugins_json(Request $request)
	{
		$pete_plugins = PetePlugin::orderBy('id', 'desc')->get();
		Log::info("plugins_json");
		
		//return response()->json($pete_plugins);
		echo $request->input('callback') . '('.json_encode($pete_plugins).')';
		
	}
	
	public function set_lang(Request $request){
		$user = Auth::user();
		
		DB::table('wp_users')->where('ID', $user->ID)->update(['dashboard_lang' => $request->input('lang')]);
		return response()->json(['lang' => $request->input('lang')]);
	}
	
	public function my_subscriptions_old(Request $request){
		
		Log::info("Entro en my_subscriptions");
		$current_user = Auth::user();
		$wp_user = get_user_by('id',$current_user->ID);
		 $viewsw = "my_subscriptions";
		
		//Que tenga id de usuario logeado
		$sites = Site::orderBy('id', 'desc')->where('user_id', $current_user->ID)->get();	
		 
		$success = $request->input('success');
		$message = $request->input('message');
		 
		return view('dashboard.my_subscriptions',compact('wp_user','sites','success','viewsw','message'));
	}
	
	
	public function create_api_key(Request $request){

		$wp_user = $request->attributes->get('wp_user');
		$user_id = $wp_user['user']["id"];
		$user_email = $wp_user['user']["email"];
		$sites_numbers = Site::where('user_id', $user_id)->where("subscription_id",$request->input('subscription_id'))->count();
	
		if($sites_numbers < 5){
			
			$site = new Site();
			$site->subscription_id = $request->input('subscription_id');
			$site->product_id = $request->input('product_id');
			$site->user_id = $user_id;
			$site->user_email = $user_email;
			$site->token = bin2hex(openssl_random_pseudo_bytes(30));
			$site->domain="";
			$site->key="";
			$site->api_key="";
			$site->save();
			
			$site->created_at_string = date_format($site->created_at, 'Y.m.d');
			
			//$license = new License("Juraj Puchký", "10.5.2018", "License Test", "1239", "test.devtech.cz");
			$generator = new Generator();
			$license = new License($user_email, $site->created_at_string,"WordpressPete",$site->token,"wordpresspete.com");
			$licenseKey = $generator->generate($license);
			$site->api_key = $licenseKey;
			$site->save();
				
			return Redirect::to('/my_subscriptions?success=yes');
			
		}else{
			return Redirect::to('/my_subscriptions?success=no');
		}

	}
	
	public function delete_api_key(Request $request){
			
		$site = Site::findOrFail($request->input('site_id'));	
		$site->delete();
		//return Redirect::back();
		return redirect("/my_subscriptions");
	}
	
	public function logout(Request $request){
		
		Auth::logout();
	    $url=wp_logout_url(env('WP_URL'));
		return redirect($url);

		//return Redirect::back();
	}

   
}
