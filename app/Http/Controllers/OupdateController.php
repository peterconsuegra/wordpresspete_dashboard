<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\DashboardOption;
use App\Models\Oupdate;
use Illuminate\Http\Request;
use View;
use Log;

class OupdateController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	

	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$viewsw = "system";
		$wordpress_url  = env('WP_URL');
		$roles = $request->attributes->get('wp_roles');
		View::share(compact('dashboard_option','viewsw','wordpress_url','roles'));
	
	}
	
	public function index()
	{
		$oupdates = Oupdate::orderBy('id', 'desc')->paginate(10);

		return view('oupdates.index', compact('oupdates'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{	$oupdate = new Oupdate();
		return view('oupdates.create', compact('oupdate'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		$oupdate = new Oupdate();

		$oupdate->parent_version = $request->input("parent_version");
        $oupdate->version = $request->input("version");
        $oupdate->mac_script = "";
        $oupdate->olinux_script = $request->input("olinux_script");
        $oupdate->win_script = "";

		$oupdate->save();

		return redirect()->route('oupdates.index')->with('message', 'Item created successfully.');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$oupdate = Oupdate::findOrFail($id);

		return view('oupdates.show', compact('oupdate'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$oupdate = Oupdate::findOrFail($id);

		return view('oupdates.edit', compact('oupdate'));
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
		$oupdate = Oupdate::findOrFail($id);

		$oupdate->parent_version = $request->input("parent_version");
        $oupdate->version = $request->input("version");
        $oupdate->mac_script = "";
        $oupdate->olinux_script = $request->input("olinux_script");
        $oupdate->win_script = "";

		$oupdate->save();

		return redirect()->route('oupdates.index')->with('message', 'Item updated successfully.');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$oupdate = Oupdate::findOrFail($id);
		$oupdate->delete();

		return redirect()->route('oupdates.index')->with('message', 'Item deleted successfully.');
	}

}
