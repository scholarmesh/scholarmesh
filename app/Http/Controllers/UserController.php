<?php

namespace App\Http\Controllers;

//use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    static function showProfile($id)
    {
        $user = DB::select('SELECT * FROM user WHERE user_id = :id', ['id' => $id])[0];
        $posts = DB::select(
            'SELECT * FROM post WHERE user_id = :id ORDER BY post_time DESC',
            ['id' => $id]
        );
        return view('profile.user', [
            'user' => $user,
            'posts' => $posts
        ]);
    }

    static function create(Request $req)
    {
        DB::insert(
            'INSERT INTO user(type, email, password, first_name, last_name, dob)
            VALUES (0, :email, :password, :fname, :lname, \'2000-01-01\')',
            [
                'email' => $req->input('email'),
                'password' => $req->input('password'),
                'fname' => $req->input('fname'),
                'lname' => $req->input('lname'),
            ]
        );
    }
}
