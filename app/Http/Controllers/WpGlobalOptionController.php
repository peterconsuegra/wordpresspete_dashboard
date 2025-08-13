<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\WpGlobalOption;
use App\Models\DashboardOption;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Log;
use View;

class WpGlobalOptionController extends Controller {

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
		$wp_global_options = WpGlobalOption::orderBy('id', 'desc')->paginate(10);
		$viewsw = "options";
		 
		return view('wp_global_options.index', compact('wp_global_options','viewsw'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{	
		$viewsw = "options";
		return view('wp_global_options.create',compact('viewsw'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		$wp_global_option = new WpGlobalOption();

		$wp_global_option->option_name = $request->input("option_name");
        $wp_global_option->option_value = $request->input("option_value");
        $wp_global_option->image = $request->input("image");
		
		if($request->file('image')!= ""){
			Log::info('Entro en logica archivo');
				
			$file = $request->file('image');
	        // SET UPLOAD PATH
	        $destinationPath = 'options';
	         // GET THE FILE EXTENSION
	        $extension = $file->getClientOriginalExtension();
	         // RENAME THE UPLOAD WITH RANDOM NUMBER
	        $fileName = rand(11111, 99999) . '.' . $extension;
	         // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
	        $upload_success = $file->move($destinationPath, $fileName);
			$wp_global_option->image = $fileName;
			
		}

		$wp_global_option->save();

		return redirect()->route('wp_global_options.index')->with('message', 'Item created successfully.');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$wp_global_option = WpGlobalOption::findOrFail($id);

		return view('wp_global_options.show', compact('wp_global_option'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$viewsw = "options";
		$wp_global_option = WpGlobalOption::findOrFail($id);

		return view('wp_global_options.edit', compact('wp_global_option','viewsw'));
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
		$wp_global_option = WpGlobalOption::findOrFail($id);

		$wp_global_option->option_name = $request->input("option_name");
        $wp_global_option->option_value = $request->input("option_value");
        $wp_global_option->image = $request->input("image");
		
		
		if($request->file('image')!= ""){
			Log::info('Entro en logica archivo');
				
			$file = $request->file('image');
	        // SET UPLOAD PATH
	        $destinationPath = 'options';
	         // GET THE FILE EXTENSION
	        $extension = $file->getClientOriginalExtension();
	         // RENAME THE UPLOAD WITH RANDOM NUMBER
	        $fileName = rand(11111, 99999) . '.' . $extension;
	         // MOVE THE UPLOADED FILES TO THE DESTINATION DIRECTORY
	        $upload_success = $file->move($destinationPath, $fileName);
			$wp_global_option->image = $fileName;
			
		}

		$wp_global_option->save();
		
		return Redirect::to("/wp_global_options");
		
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$wp_global_option = WpGlobalOption::findOrFail($id);
		$wp_global_option->delete();

		return redirect()->route('wp_global_options.index')->with('message', 'Item deleted successfully.');
	}

}
