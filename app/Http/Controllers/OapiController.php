<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Log;
use App\Models\Site;
use Input;
use App\Models\User;
use App\Models\Oupdate;
use App\Models\PeteSync;
use App\Http\Requests;
use App\Http\Controllers\Controller;

use Response;
use App\Models\PetePlugin;
use App\Models\Wp_plugin;
use App\Models\Ad;
use App\Models\PeteInstaller;
use App\Models\PeteUser;

class OapiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	
    public function __construct()
    {
        //global $current_user;
        //$this->wp_user = getUserWP();
		
    	//include_once(env('WP_LOAD_PATH')."/wp-load.php");  
	
    }
	
	public function get_pete_script(){
		
	}
	
	public function save_pete_user(Request $request){
		
		/*
				$data = array(
				"email" => $data['email'], 
				"name" => $data['name'], 
				"os" => $os, "os_version" => $os_version, 
				"version" => $version,
				"os_distribution" => $os_distribution, 
				"country" => $country);
		*/
		
		$pete_user = new PeteUser();
		
		$pete_user->name = $request->input("name");
        $pete_user->email = $request->input("email");
		$pete_user->os = $request->input("os");
		$pete_user->version = $request->input("version");
		$pete_user->os_distribution = $request->input("os_distribution");
		$pete_user->country = $request->input("country");
		$pete_user->save();
		
		return response()->json($pete_user);
		
	}
	
	public function ads_json()
	{
		Log::info("ads_json AdController");
		
		$ads = Ad::orderBy('id', 'desc')->get();
		return response()->json($ads);
		
	}
	
	public function save_pete_user_json(Request $request){
		
		$email = $request->input('email');
		$first_name = $request->input('first_name');
		$last_name = $request->input('last_name');
		
		if(isset($email)) {
			
			$pete_user = PeteUser::where("email",$email)->first();
			
			if(isset($pete_user)){
				$pete_user->installs = $pete_user->installs+1;
				$pete_user->save();
			}else{
				$pete_user = new PeteUser();
				$pete_user->os = $request->input('os');
				$pete_user->os_distribution = $request->input('os_distribution');	
				$pete_user->os_version = $request->input('os_version') ;	
				$pete_user->name = $request->input('name');	
				$pete_user->last_name = $request->input('last_name') ;	
				$pete_user->email = $request->input('email') ;	
				$pete_user->country = $request->input('country') ;
				$pete_user->contact_me_again = $request->input('contact_me_again');
				$pete_user->installs = 1;		
				$pete_user->save();
			}
		}
		
		return response()->json(["ok"=>"ok"]);
		
	}
	
	public function development_installer(){
		
		  $pete_installers = PeteInstaller::orderBy('id', 'desc')->first();
		  $content = $pete_installers->development;
		  // Set the name of the text file
		  $filename = 'darwin.txt';

		  // Set headers necessary to initiate a download of the textfile, with the specified name
		  $headers = array(
		      'Content-Type' => 'plain/txt',
		      'Content-Disposition' => sprintf('attachment; filename="%s"', $filename),
		      'Content-Length' => 1,
		  );

		  //return response()->download($content, $filename, $headers); 
		  return \Response::make($content, 200, $headers);
		
	}
	
		
	public function darwin_installer(){
		
		  $pete_installers = PeteInstaller::orderBy('id', 'desc')->first();
		  $content = $pete_installers->darwin;
		  // Set the name of the text file
		  $filename = 'darwin.txt';

		  // Set headers necessary to initiate a download of the textfile, with the specified name
		  $headers = array(
		      'Content-Type' => 'plain/txt',
		      'Content-Disposition' => sprintf('attachment; filename="%s"', $filename),
		      'Content-Length' => 1,
		  );

		  //return response()->download($content, $filename, $headers); 
		  return \Response::make($content, 200, $headers);
		
	}
	
	public function cloud_installer(Request $request){
		
		$dbpassword = $request->input('dbpassword');
		$petepassword = $request->input('petepassword');
		$name = $request->input('name') ;
		$email = $request->input('email') ;
		$petetoken = $request->input('petetoken') ;
		$filemanagerpass = $request->input('filemanagerpassword') ;
		$sshpassword = $request->input('sshpassword') ;
		$zone = $request->input('zone') ;
		$osstack= $request->input('script_name');
		
		$variables="#!/bin/bash\n";
		$variables.="DBPASSWORD=$dbpassword\n";
		$variables.="PETEPASSWORD=$petepassword\n";
		$variables.="ONAME=$name\n";
		$variables.="EMAIL=$email\n";
		$variables.="PETETOKEN=$petetoken\n";
		$variables.="FILEMANAGERPASS=$filemanagerpass\n";
		$variables.="SSHPASSWORD=$sshpassword\n";
		$variables.="OSSTACK=$osstack\n";
		
	  	$pete_installers = PeteInstaller::where('script_name', $request->input('script_name'))->first();
		$content = $variables;
	  	$content .= $pete_installers->linux;
		$content = str_replace (array("\r\n", "\n", "\r"), "\n", $content);
		return response($content)->header('Content-Type', 'text/plain');
		
	}
	
	public function linux_installer(Request $request){
		//http://dashboard.wordpresspete.petelocal.net/linux_installer.sh
		
		/*
		#!/bin/bash
		#<UDF name="dbpassword" Label="db password root" default="" example="db password root" />
		#DBPASSWORD=
		#<UDF name="petepassword" Label="pete password" default="" example="pete password" />
		#PETEPASSWORD=
		#<UDF name="name" Label="pete username" default="" example="pete username" />
		#NAME=
		#<UDF name="email" Label="pete email" default="" example="pete email" />
		#EMAIL=
		#<UDF name="petetoken" Label="pete email" default="" example="pete email" />
		#PETETOKEN=
		#<UDF name="filemanagerpass" Label="file manager pass" default="" example="file manager pass" />
		#FILEMANAGERPASS=
		*/
		
		$dbpassword = $request->input('dbpassword') ;
		$petepassword = $request->input('petepassword') ;
		$name = $request->input('name') ;
		$email = $request->input('email') ;
		$petetoken = $request->input('petetoken') ;
		$filemanagerpass = $request->input('filemanagerpassword');
		$sshpassword = $request->input('sshpassword') ;
		$zone = $request->input('zone');
		
		$variables="#!/bin/bash\n";
		$variables.="DBPASSWORD=$dbpassword\n";
		$variables.="PETEPASSWORD=$petepassword\n";
		$variables.="ONAME=$name\n";
		$variables.="EMAIL=$email\n";
		$variables.="PETETOKEN=$petetoken\n";
		$variables.="FILEMANAGERPASS=$filemanagerpass\n";
		$variables.="SSHPASSWORD=$sshpassword\n";
		
	  	$pete_installers = PeteInstaller::where('url', 'https://dashboard.wordpresspete.com/linux_installer.sh')->first();
		$content = $variables;
	  	$content .= $pete_installers->linux;
		$content = str_replace (array("\r\n", "\n", "\r"), "\n", $content);
		return response($content)->header('Content-Type', 'text/plain');
	}
	
	public function commercial_installer(Request $request){
		
		$dbpassword = $request->input('dbpassword') ;
		$petepassword = $request->input('petepassword');
		$name =$request->input('name');
		$email = $request->input('email');
		$petetoken = $request->input('petetoken');
		$filemanagerpass = $request->input('filemanagerpassword');
		$sshpassword = $request->input('sshpassword');
		$zone = $request->input('zone');
		
		$variables="#!/bin/bash\n";
		$variables.="DBPASSWORD=$dbpassword\n";
		$variables.="PETEPASSWORD=$petepassword\n";
		$variables.="ONAME=$name\n";
		$variables.="EMAIL=$email\n";
		$variables.="PETETOKEN=$petetoken\n";
		$variables.="FILEMANAGERPASS=$filemanagerpass\n";
		$variables.="SSHPASSWORD=$sshpassword\n";
		
	  	$pete_installers = PeteInstaller::orderBy('id', 'desc')->first();
		$content = $variables;
	  	$content .= $pete_installers->linux;
		$content = str_replace (array("\r\n", "\n", "\r"), "\n", $content);
		return response($content)->header('Content-Type', 'text/plain');
	}
	
	public function windows_installer(Request $request){
		
		  $pete_installers = PeteInstaller::orderBy('id', 'desc')->first();
		  $content = $pete_installers->windows;
		  // Set the name of the text file
		  $filename = 'windows.txt';

		  // Set headers necessary to initiate a download of the textfile, with the specified name
		  $headers = array(
		      'Content-Type' => 'plain/txt',
		      'Content-Disposition' => sprintf('attachment; filename="%s"', $filename),
		      'Content-Length' => 1,
		  );

		  return \Response::make($content, 200, $headers);
		
	}
	
	public function plugins_json()
	{
		$pete_plugins = PetePlugin::orderBy('id', 'asc')->get();
		$wp_plugins = Wp_plugin::orderBy('id', 'asc')->get();
		
		return response()->json(["pete_plugins" => $pete_plugins, "wp_plugins" => $wp_plugins]);
		
	}
	
	public function validate_key_json(){
		
		return response()->json($pete_plugins);
	}
	
	public function update_button_json(Request $request)
	{
		Log::info("ENTROO EN update_button_json");
		$parent_version = $request->input('parent_version');
		$oupdate = Oupdate::where("parent_version",$parent_version)->orderBy('id', 'desc')->first();
		echo $request->input('callback') . '('.json_encode($oupdate).')';
		
	}
	
    public function world()
    {
       
	   Log::info("Entro en World");
	   //Response::json(["ok"=>"ok"], 200, array('Content-Type' => 'application/javascript'));
	   Response::json(["ok"=>"ok"])->setCallback($request->input('callback'));
    }
	
	public function validate_update_json(){
	  $oupdates = Oupdate::orderBy('created_at', 'desc')->get();		
	  echo $request->input('callback') . '('.json_encode(['title'=>$oupdates[0]->title, 'branch'=>$oupdates[0]->branch ]).')';
	}
	
	public function validate_site_json(Request $request)
	{
		Log::info('validate_site_json called');

		$apiKey = $request->input('oapi_key');
		$email  = $request->input('oemail');
		$domain = $request->input('odomain');

		Log::info("Input — key: {$apiKey} | email: {$email} | domain: {$domain}");
		
		// 1️⃣  Look up the local licence row
		$site = Site::where('user_email', $email)
					->where('api_key',  $apiKey)
					->first();

		if (! $site) {
			return response()->json(['message'=>"Sorry wrong keys"]);
		}

		try {
			$wpResp = PeteSync::fetchFromWp($request,
					"subscription-status/{$site->subscription_id}");
			$status = $wpResp['status'] ?? null;

			Log::info("SUBSCRIPTION STATUS");
			Log::info($status);

		} catch (\Throwable $e) {
			Log::error('WP subscription check failed', ['error' => $e->getMessage()]);
			return response()->json(['message'=>"Cannot verify subscription right now"]);
		}

		if ($status !== 'active') {
			return response()->json(["Sorry, your subscription isn't active"]);
		}

		if (! $site->validated && empty($site->domain)) {
			$site->validated = true;
			$site->domain    = $domain;
			$site->save();
			return response()->json($site);
		}

		if ($site->validated && $site->domain === $domain) {
			return response()->json($site);
		}

		return response()->json(['message'=>'Sorry this API key has already been validated']);
			
	}

}
