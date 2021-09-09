<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class SignupController extends Controller
{
    /**
     * Store a newly created user in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function signup(Request $request)
    {

        $user= new User();
        $user->fisrtname= $request['fisrtname'];
        $user->lastname= $request['lastname'];
    
        $user->save();

            );

        return redirect('/');
    }

}