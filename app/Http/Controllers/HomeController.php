<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    function show(Request $req) {
        UserController::showProfile(Auth::id());
    }
}
