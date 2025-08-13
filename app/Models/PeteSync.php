<?php

namespace App\Models;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use Log;

class PeteSync{

    public static function get_roles($wpUser){
        $wpRoles  = $wpUser['roles'] ?? []; 
        return $wpRoles;
    }

    public static function getTheWPUser(?Request $request = null)
    {
        $request ??= request();

        $cookieHeader = $request->header('Cookie', '');
        $wpSite = rtrim(env('WP_URL'), '/');
        $endpoint = "{$wpSite}/wp-json/pete/v1/admin-is-logged-in";

        $response = Http::withHeaders(['Cookie' => $cookieHeader])->get($endpoint);

        return $response->ok() ? $response->json() : false;
    }

    public static function checkTheTypeOfLoggedIn(){

        $wpSite = env('WP_URL');
        $endpoint = "{$wpSite}/wp-json/pete/v1/return-user-if-logged-in";
        $request = request();

        $cookieHeader = $request->header('Cookie', '');
        $response = Http::withHeaders([
            'Cookie' => $cookieHeader,
        ])->get($endpoint);
        
        $wpUser = $response;
        $roles = PeteSync::get_roles($wpUser);

        if (($wpUser['logged_in'] == true) && in_array('administrator', $roles, true)){
            return "loggedInAsAdmin";
        }else if ((isset($wpUser)) && ($wpUser['logged_in'] == true)){ 
            return "loggedInAsUser";
        }else {
            return "notLoggedIn";
        }

    }

    public static function getTheWPUserFromMiddleware(Request $request){
        
        $wpSite = env('WP_URL');
        $endpoint = "{$wpSite}/wp-json/pete/v1/return-user-if-logged-in";

        $cookieHeader = $request->header('Cookie', '');
        $response = Http::withHeaders([
            'Cookie' => $cookieHeader,
        ])->get($endpoint);
        return $response;

    }

    public static function fetchFromWp(Request $request, string $resource): array
    {
        $cookie = $request->header('Cookie', '');
        $wpUrl  = rtrim(env('WP_URL'), '/');
        $url    = "{$wpUrl}/wp-json/pete/v1/{$resource}";

        try {
            $response = Http::withHeaders([
                'Cookie' => $cookie,
            ])
            // Optional: retry network hiccups automatically
            ->retry(2, 200)          // 2 attempts, 200 ms apart
            ->timeout(5)             // fail fast on slow servers
            ->get($url)
            ->throw();               // let 4xx/5xx bubble into catch block
        } catch (RequestException $e) {
            // Network error OR non-2xx status code
            Log::error('PeteSync » WP call failed', [
                'url'     => $url,
                'message' => $e->getMessage(),
                // Laravel keeps the failed response, if any
                'status'  => optional($e->response)->status(),
                'body'    => optional($e->response)->body(),
                'cookies' => str($cookie)->limit(120),
            ]);

            // Decide how you want to surface the error upstream
            // Throwing lets the controller/middleware decide:
            throw $e;
        }

        return $response->json();
    }

}