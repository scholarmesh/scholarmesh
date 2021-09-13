<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class EventController extends Controller
{
    //
    public function show()
    {
        return view('event');
    }

    public function index()
    {
        return view('eventform');
    }

    public function makeEvent(Request $request){
            $name = $request['name'];
            $dp = $request['image'];
            $venue = $request['venue'];
            $startdate = $request['start-date'];
            $enddate = $request['end-date'];
            $url = $request['url'];
            


            DB::insert('insert into conference (name,dp,venue,start_time,end_time,url) values (?,?,?,?,?,?)',[$name,$dp,$venue,$startdate,$enddate,$url]);

            return redirect()->route('event');

    }


}
