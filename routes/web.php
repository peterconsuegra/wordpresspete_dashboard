<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PeteUserController;
use App\Http\Controllers\OupdateController;
use App\Http\Controllers\PetePluginController;
use App\Http\Controllers\Wp_pluginController;
use App\Http\Controllers\PeteInstallerController;
use App\Http\Controllers\WpGlobalOptionController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\OapiController;
use App\Models\PeteSync;

Route::get('/', function (Request $request) {
    
    $logged_in_as = PeteSync::checkTheTypeOfLoggedIn();

    if($logged_in_as === "loggedInAsAdmin"){
       return redirect('/customers');
    }else if($logged_in_as === "loggedInAsUser"){
        return redirect('/my_subscriptions');
    }else{
         return redirect(env('WP_URL_LOGIN'));
    }

});

use App\Http\Controllers\HelloController;
Route::get('list_users', [HelloController::class,'list_users']);
Route::get('list_orders', [HelloController::class,'list_orders']);
Route::get('list_posts', [HelloController::class,'list_posts']);
Route::get('list_products', [HelloController::class,'list_products']);
Route::get('edit_posts', [HelloController::class, 'edit_posts']);
Route::get('edit_post', [HelloController::class, 'edit_post']);
Route::post('update_post', [HelloController::class, 'update_post']);
Route::get('/wordpress_plus_laravel_examples', [HelloController::class, 'wordpress_plus_laravel_examples']);

Route::get('/validate_site_json', [OapiController::class, 'validate_site_json']);
Route::get('/validate_update_json', [OapiController::class, 'validate_update_json']);
Route::get('/plugins_json', [OapiController::class, 'plugins_json']);
Route::get('/update_button_json', [OapiController::class, 'update_button_json']);
Route::get("ads_json",[OapiController::class, 'ads_json']);
Route::get("save_pete_user_json",[OapiController::class, 'save_pete_user_json']);

// Only the routes you need

Route::middleware(['web', 'admin.wp'])->group(function () {

     Route::resource('pete_users', PeteUserController::class);
     Route::resource('oupdates', OupdateController::class);
     Route::resource('pete_plugins', PetePluginController::class);
     Route::resource('wp_plugins', Wp_pluginController::class);
     Route::resource('pete_installers', PeteInstallerController::class);
     Route::resource('wp_global_options', WpGlobalOptionController::class);
     Route::get('customers', [AdminController::class,'customers']);
     Route::get('orders', [AdminController::class,'orders']);

});

Route::middleware(['web', 'auth.wp'])->group(function () {

    Route::get('my_orders', [DashboardController::class,'my_orders']);
    Route::get('my_subscriptions', [DashboardController::class,'my_subscriptions']);

    Route::post('create_api_key', [DashboardController::class,'create_api_key']);
    Route::post('delete_api_key', [DashboardController::class,'delete_api_key']);

});