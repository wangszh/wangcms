<?php
/**
 * Created by PhpStorm.
 * User: jnjsgcjyzx
 * Date: 2016/6/29
 * Time: 16:01
 */

namespace Douyasi\Api\Controllers;


use Douyasi\Models\User;
use Illuminate\Http\Request;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthController extends BaseController
{
    public function authenticate(Request $request)
    {
        // grab credentials from the request

        $user = User::first();
        //$token = JWTAuth::fromUser($user);
        dd($user);

        $credentials = $request->only('username', 'password');
        //dd($credentials);

        try {
            // attempt to verify the credentials and create a token for the user
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 401);
            }
        } catch (JWTException $e) {
            // something went wrong whilst attempting to encode the token
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        // all good so return the token
        return response()->json(compact('token'));

    }

}