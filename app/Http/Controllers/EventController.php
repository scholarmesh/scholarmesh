<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class EventController extends Controller
{
    //
     public function show($slug)
    {
        $event = DB::select("select * from conference where name = ?", [$slug]);
        
        return view('event', ['event' => $event[0]]);
    }

    public function showEventform()
    {
        return view('eventform');
    }

    public function makeEvent(Request $request){

            $this->validate($request, [
                'name' => 'required',
                'image' => 'required',
                'venue' => 'required',
                'start-date' => 'required',
                'end-date' => 'required',
                'url' => 'required'
            ]);


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
