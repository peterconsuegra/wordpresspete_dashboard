<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\DashboardOption;
use App\Models\Wp_plugin;
use Illuminate\Http\Request;
use View;
use Log;

class Wp_pluginController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */

	public function __construct(Request $request){

		$dashboard_option = new DashboardOption();	
		$viewsw = "wordpress_plugins";
		$wordpress_url  = env('WP_URL');
		$roles = $request->attributes->get('wp_roles');
		View::share(compact('dashboard_option','viewsw','wordpress_url','roles'));
	
	}
	
	public function index()
	{
		$wp_plugins = Wp_plugin::orderBy('id', 'desc')->paginate(10);

		return view('wp_plugins.index', compact('wp_plugins'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		$wp_plugin = new Wp_plugin();
		return view('wp_plugins.create',compact('wp_plugin'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		$wp_plugin = new Wp_plugin();

		$wp_plugin->title = $request->input("title");
        $wp_plugin->description = $request->input("description");
       
        $wp_plugin->url = $request->input("url");
		
		$wp_plugin->supported_os = $request->input("supported_os");
		
		if($request->file('image')!= ""){
			Log::info('Entro en logica archivo');
				
			$file = $request->file('image');
	        // SET UPLOAD PATH
	        $destinationPath = 'wp_plugins_images';
	         // GET THE FILE EXTENSION
	        $extension = $file->getClientOriginalExtension();
	         // RENAME THE UPLOAD WITH RANDOM NUMBER
	        $fileName = rand(11111, 99999) . '.' . $extension;
	         // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
	        $upload_success = $file->move($destinationPath, $fileName);
			$wp_plugin->image = $fileName;
			
		}

		$wp_plugin->save();

		return redirect()->route('wp_plugins.index')->with('message', 'Item created successfully.');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$wp_plugin = Wp_plugin::findOrFail($id);

		return view('wp_plugins.show', compact('wp_plugin'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$wp_plugin = Wp_plugin::findOrFail($id);

		return view('wp_plugins.edit', compact('wp_plugin'));
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
		$wp_plugin = Wp_plugin::findOrFail($id);

		$wp_plugin->title = $request->input("title");
        $wp_plugin->description = $request->input("description");
        $wp_plugin->url = $request->input("url");
		$wp_plugin->supported_os = $request->input("supported_os");
		
		if($request->file('image')!= ""){
			Log::info('Entro en logica archivo');
				
			$file = $request->file('image');
	        // SET UPLOAD PATH
	        $destinationPath = 'wp_plugins_images';
	         // GET THE FILE EXTENSION
	        $extension = $file->getClientOriginalExtension();
	         // RENAME THE UPLOAD WITH RANDOM NUMBER
	        $fileName = rand(11111, 99999) . '.' . $extension;
	         // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
	        $upload_success = $file->move($destinationPath, $fileName);
			$wp_plugin->image = $fileName;
			
		}

		$wp_plugin->save();

		return redirect()->route('wp_plugins.index')->with('message', 'Item updated successfully.');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$wp_plugin = Wp_plugin::findOrFail($id);
		$wp_plugin->delete();

		return redirect()->route('wp_plugins.index')->with('message', 'Item deleted successfully.');
	}

}
