<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;


class AuthController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function authenticate(Request $request)
    {
     $this->validate($request, [
       'email' => 'required',
       'password' => 'required'
     ]);

     $user = \App\User::where('email', $request->email)->first();
     if(Hash::check($request->password, $user->password)){
      $apikey = base64_encode(str_random(40));
      \App\User::where('email', $request->email)->update(['api_key' => "$apikey"]);;
      return response()->json(['status' => 200,'api_key' => $apikey]);
    }else{
      return response()->json(['status' => 'fail'],401);
    }
  }

  public function profile(Request $request)
  {
    return response()->json(['status' =>200,'user' => \Auth::user()]);
  }


}
