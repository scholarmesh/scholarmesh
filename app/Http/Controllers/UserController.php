<?php

namespace App\Http\Controllers;

//use App\Models\User;
use App\Models\User;
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

    static function store(Request $req)
    {
        $credentials = $req->validate([
            'type'       => 'required|integer|min:0|max:2',
            'first_name' => 'required|max:255',
            'last_name'  => 'required|max:255',
            'email'      => 'required|email|max:255|unique:user,email',
            'password'   => 'required',
            'bio'        => 'string|nullable',
        ]);

        // return $credentials;

        $user = new User($credentials);
        $user->save();
        // DB::insert(
        //     'INSERT INTO user(type, email, password, first_name, last_name, dob)
        //     VALUES (0, :email, :password, :fname, :lname, \'2000-01-01\')',
        //     [
        //         'email' => $req['email'],
        //         'password' => bcrypt($req['password']),
        //         'fname' => $req['fname'],
        //         'lname' => $req['lname'],
        //     ]
        // );
        return view('profile.user');
    }
}
