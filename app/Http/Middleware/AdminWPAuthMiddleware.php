<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Log;
use App\Models\PeteSync;

class AdminWPAuthMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        Log::info("enter in AdminWPAuthMiddleware");

        $wp_user = PeteSync::getTheWPUserFromMiddleware($request);
        $roles = PeteSync::get_roles($wp_user);

        Log::info("after getTheWPUserFromMiddleware");
        Log::info("after getTheWPUserFromMiddleware");
        Log::info($wp_user);
        Log::info($roles);

        if (empty($wp_user['logged_in']) || !in_array('administrator', $roles, true)) {
           return redirect(env('WP_URL_LOGIN'));
        }

        $request->attributes->set('wp_user', $wp_user);
        $request->attributes->set('wp_roles', $roles);

        return $next($request);

    }
}
