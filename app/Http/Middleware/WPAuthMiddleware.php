<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Log;

class WPAuthMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        Log::info("desde WPAuthMiddleware");

        $cookieHeader = $request->header('Cookie', '');
        $wpSite = env('WP_URL');
        //$wpSite   = config('services.wp.url');
        $endpoint = "{$wpSite}/wp-json/pete/v1/customer-is-logged-in";
        $loginUrl = "{$wpSite}/wp-login.php?redirect_to=" . urlencode(url()->full());

        $response = Http::withHeaders([
            'Cookie' => $cookieHeader,
        ])->get($endpoint);

        if (! $response->ok()) {
            //abort(502, 'Cannot reach WordPress for auth check.');
            return redirect()->away($loginUrl);
        }

        $wpUser = $response->json();  
        
        Log::info("check wpUser");
        Log::info($wpUser);

        // full payload from Pete Sync
        $roles  = $wpUser['roles'] ?? []; 

         Log::info("check2");
        if (empty($wpUser['logged_in'])) {
            Log::info("entro en empty logged_in");
            return redirect()->away($loginUrl);
        }
        Log::info("check3");
        $request->attributes->set('wp_user', $wpUser);
        $request->attributes->set('wp_roles', $roles);

        Log::info("check4");
        return $next($request);
    }
}
