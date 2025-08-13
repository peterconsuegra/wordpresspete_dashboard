<?php

namespace App\Models;
use Log;
use Illuminate\Database\Eloquent\Model;
use App\Models\WpGlobalOption;

class DashboardOption extends Model
{
    //
    //
	public function __construct(){
		global $options;
		$options = WpGlobalOption::all()->keyBy('option_name');
	}
	
	public function get_meta_value($meta_key){
		global $options;
		if(isset($options[$meta_key])){
			return $options[$meta_key]->option_value;
		}else{
			return "";
		}
		
	}
	
	public function get_meta_image($meta_key){
		global $options;
		if(isset($options[$meta_key])){
			return $options[$meta_key]->image;
		}else{
			return "";
		}
		
	}
	
}
