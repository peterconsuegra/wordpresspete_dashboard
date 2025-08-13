<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\PetePlugin;
use App\Models\DashboardOption;
use Illuminate\Http\Request;
use View;
use Log;

class PetePluginController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */

	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$viewsw = "pete_plugins";
		$wordpress_url  = env('WP_URL');
		$roles = $request->attributes->get('wp_roles');
		View::share(compact('dashboard_option','viewsw','wordpress_url','roles'));
	
	}
	
	
	
	public function index()
	{
		$pete_plugins = PetePlugin::orderBy('id', 'desc')->paginate(10);
		
		return view('pete_plugins.index', compact('pete_plugins'));
	}
	

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{	
		return view('pete_plugins.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		$pete_plugin = new PetePlugin();

		$pete_plugin->title = $request->input("title");
		$pete_plugin->version = $request->input("version");
		$pete_plugin->package_folder = $request->input("package_folder");
		$pete_plugin->description = $request->input("description");
		$pete_plugin->redirect_after_install = $request->input("redirect_after_install");
		
		$pete_plugin->mac_install_script = $request->input("mac_install_script");
		$pete_plugin->mac_update_script = $request->input("mac_update_script");
		$pete_plugin->mac_uninstall_script = $request->input("mac_uninstall_script");
		
		$pete_plugin->olinux_install_script = $request->input("olinux_install_script");
		$pete_plugin->olinux_update_script = $request->input("olinux_update_script");
		$pete_plugin->olinux_uninstall_script = $request->input("olinux_uninstall_script");
		
		$pete_plugin->win_install_script = $request->input("win_install_script");
		$pete_plugin->win_update_script = $request->input("win_update_script");
		$pete_plugin->win_uninstall_script = $request->input("win_uninstall_script");
		
		$pete_plugin->supported_os = $request->input("supported_os");
		
		$pete_plugin->option_name = $request->input("option_name");
		
		$pete_plugin->development_script = $request->input("development_script");
		
		if($request->file('image')!= ""){
			Log::info('Entro en logica archivo');
				
			$file = $request->file('image');
	        // SET UPLOAD PATH
	        $destinationPath = 'pete_plugins';
	         // GET THE FILE EXTENSION
	        $extension = $file->getClientOriginalExtension();
	         // RENAME THE UPLOAD WITH RANDOM NUMBER
	        $fileName = rand(11111, 99999) . '.' . $extension;
	         // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
	        $upload_success = $file->move($destinationPath, $fileName);
			$pete_plugin->image = $fileName;
			
		}

		$pete_plugin->save();

		return redirect()->route('pete_plugins.index')->with('message', 'Item created successfully.');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$pete_plugin = PetePlugin::findOrFail($id);
		$viewsw = "plugins";
		return view('pete_plugins.show', compact('pete_plugin','viewsw'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$pete_plugin = PetePlugin::findOrFail($id);
		return view('pete_plugins.edit', compact('pete_plugin'));
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
		$pete_plugin = PetePlugin::findOrFail($id);

		$pete_plugin->title = $request->input("title");
		$pete_plugin->version = $request->input("version");
		$pete_plugin->package_folder = $request->input("package_folder");
        $pete_plugin->description = $request->input("description");
		$pete_plugin->redirect_after_install = $request->input("redirect_after_install");
        
		$pete_plugin->mac_install_script = $request->input("mac_install_script");
		$pete_plugin->mac_update_script = $request->input("mac_update_script");
		$pete_plugin->mac_uninstall_script = $request->input("mac_uninstall_script");
		
		$pete_plugin->olinux_install_script = $request->input("olinux_install_script");
		$pete_plugin->olinux_update_script = $request->input("olinux_update_script");
		$pete_plugin->olinux_uninstall_script = $request->input("olinux_uninstall_script");
		
		$pete_plugin->win_install_script = $request->input("win_install_script");
		$pete_plugin->win_update_script = $request->input("win_update_script");
		$pete_plugin->win_uninstall_script = $request->input("win_uninstall_script");
		
		$pete_plugin->option_name = $request->input("option_name");
		
		$pete_plugin->supported_os = $request->input("supported_os");
		
		$pete_plugin->development_script = $request->input("development_script");
		
		if($request->file('image')!= ""){
			Log::info('Entro en logica archivo');
			Log::info($request->file('image'));
			$file = $request->file('image');
	        // SET UPLOAD PATH
	        $destinationPath = 'plugins_images';
	         // GET THE FILE EXTENSION
	        $extension = $file->getClientOriginalExtension();
	         // RENAME THE UPLOAD WITH RANDOM NUMBER
	        $fileName = rand(11111, 99999) . '.' . $extension;
	         // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
	        $upload_success = $file->move($destinationPath, $fileName);
			$pete_plugin->image = $fileName;
			
		}

		$pete_plugin->save();

		return redirect()->route('pete_plugins.index')->with('message', 'Item updated successfully.');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$pete_plugin = PetePlugin::findOrFail($id);
		$pete_plugin->delete();

		return redirect()->route('pete_plugins.index')->with('message', 'Item deleted successfully.');
	}

}
