<?php

namespace App\Http\Controllers;

//use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    static function showProfile($id) {
        $user = DB::select('SELECT * FROM user WHERE user_id = :id', ['id' => $id])[0];
        $posts = DB::select('SELECT * FROM post WHERE user_id = :id', ['id' => $id]);
        return view('profile.user', [
            'user' => $user,
            'posts' => $posts
        ]);
    }

    static function create($user) {
        ;
    }
}
