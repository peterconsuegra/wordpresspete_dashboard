<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\PeteUser;
use Illuminate\Http\Request;
use App\Models\DashboardOption;
use View;
use Log;
use App\Http\Middleware\WPAuthMiddleware; 

class PeteUserController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	
	

	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$viewsw = "pete_users";
		$roles = $request->attributes->get('wp_roles');
		$wordpress_url  = env('WP_URL');

		/*
		$wp_user = $request->attributes->get('wp_user');
		Log::info("Roles:");
		Log::info($roles);
		Log::info("wp_user:");
		Log::info($wp_user);
		*/
		
		View::share(compact('dashboard_option','viewsw','wordpress_url','roles'));
		
	}
	
	public function index(Request $request)
	{
		$pete_users = PeteUser::orderBy('id', 'desc')->paginate(50);
		$wp_user = $request->attributes->get('wp_user');
		
		return view('pete_users.index', compact('pete_users'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('pete_users.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		$pete_user = new PeteUser();

		$pete_user->name = $request->input("name");
        $pete_user->email = $request->input("email");
        $pete_user->country = $request->input("country");

		$pete_user->save();

		return redirect()->route('pete_users.index')->with('message', 'Item created successfully.');
	}
	
	

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$pete_user = PeteUser::findOrFail($id);

		return view('pete_users.show', compact('pete_user'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$pete_user = PeteUser::findOrFail($id);

		return view('pete_users.edit', compact('pete_user'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @param Request $request
	 * @return Response
	 */
	public function update(Request $request, $id)
	{
		$pete_user = PeteUser::findOrFail($id);

		$pete_user->name = $request->input("name");
        $pete_user->email = $request->input("email");
        $pete_user->country = $request->input("country");

		$pete_user->save();

		return redirect()->route('pete_users.index')->with('message', 'Item updated successfully.');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$pete_user = PeteUser::findOrFail($id);
		$pete_user->delete();

		return redirect()->route('pete_users.index')->with('message', 'Item deleted successfully.');
	}

}
