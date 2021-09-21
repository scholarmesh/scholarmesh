<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    /**
     * Handle an authentication attempt.
     *
     * @param  \Illuminate\Http\Request  $req
     * @return \Illuminate\Http\Response
     */
    public function authenticate(Request $req)
    {
        $credentials = $req->validate([
            'email'    => 'required|email|max:255',
            'password' => 'required',
        ]);

        if (Auth::attempt($credentials)) {
            $req->session()->regenerate();
            return redirect()->intended('login');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ]);
    }
}
