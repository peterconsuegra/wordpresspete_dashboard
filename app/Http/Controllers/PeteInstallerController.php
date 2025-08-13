<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\DashboardOption;
use App\Models\PeteInstaller;
use Illuminate\Http\Request;
use View;
use Log;
use Illuminate\Support\Facades\Redirect;

class PeteInstallerController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */

	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$viewsw = "pete_installers";
		$wordpress_url  = env('WP_URL');
		$roles = $request->attributes->get('wp_roles');
		View::share(compact('dashboard_option','viewsw','wordpress_url','roles'));
	
	}
	
	
	public function index()
	{
		$pete_installers = PeteInstaller::orderBy('id', 'desc')->paginate(10);

		return view('pete_installers.index', compact('pete_installers'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('pete_installers.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		$pete_installer = new PeteInstaller();
		
		$pete_installer->git_url = $request->input("git_url");
		$pete_installer->git_branch = $request->input("git_branch");
		$pete_installer->darwin = $request->input("darwin");
        $pete_installer->linux = $request->input("linux");
        $pete_installer->windows = $request->input("windows");
		$pete_installer->script_name = $request->input("script_name");
		
		$pete_installer->save();

		return redirect()->route('pete_installers.index')->with('message', 'Item created successfully.');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$pete_installer = PeteInstaller::findOrFail($id);

		return view('pete_installers.show', compact('pete_installer'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$pete_installer = PeteInstaller::findOrFail($id);

		return view('pete_installers.edit', compact('pete_installer'));
	}
	
	public function edit_installers(){
		$pete_installer = PeteInstaller::orderBy('id', 'desc')->first();
		if(!isset($pete_installer)){
			$pete_installer = new PeteInstaller();
			$pete_installer->save();
		}
		return view('pete_installers.edit', compact('pete_installer'));
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
		$pete_installer = PeteInstaller::findOrFail($id);
		$pete_installer->url = $request->input("url");
        $pete_installer->linux = $request->input("linux");
		$pete_installer->script_name = $request->input("script_name");
		$pete_installer->save();

		return redirect()->route('pete_installers.index')->with('message', 'Item updated successfully.');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$pete_installer = PeteInstaller::findOrFail($id);
		$pete_installer->delete();

		return redirect()->route('pete_installers.index')->with('message', 'Item deleted successfully.');
	}

}
