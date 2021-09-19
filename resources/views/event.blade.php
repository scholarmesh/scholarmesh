@extends('layouts.app')

@section('content')
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    <link href="{{ URL::to('css/event.css') }}" rel="stylesheet">
    <title>Conference</title>
</head>
<body>



<section>
        <div class="container-fluid">
             <div class="row">
                  <!--Attending list-->
                  <div class="col-md-4" style="background-color: #ffffff;">
                    <div class="col-md-1">
                       <div class="row">
                            <div class="col-md-6">
                                <h2>Attending:</h2>
                                 <ul class="icon-list">
                                    <!--Loop and post list elements of people attending-->
                                 </ul>
                            </div>
                            
                       </div>
                  </div>
                  </div>
                  <div class="col-md-7" style="background-color: #8470FF;">
                    <br>
                    
                      
                      <h1 class="display-5 text-white" style="font-family: 'Anton', sans-serif;">{{$event->name}}</h1>
                      <br>
                      
                      <br>
                      <!--Content Section-->

                    <div class="col-md-4" style="background-color: #8470FF;">
                        <center>
                            <img src="https://cdn5.vectorstock.com/i/1000x1000/22/99/scientific-conference-banner-vector-29062299.jpg" width="800px">
                        </center>
                    </div>
                      <div class="row">
                           <div class="col-md-6">
                               <h4 class="text-white">Start Date:</h4>
                               <p class="text-white">{{$event->start_time}} </p>
                           </div>
                           <div class="col-md-6">
                               <h4 class="text-white">End Date:</h4>
                               <p class="text-white">{{$event->end_time}}</p>
                           </div>
                      </div>
                      
                      
                      <br>
                      <br>
                      <div class="row">
                          <div class="col-md-12">
                              <p class="lead text-white">Venue: {{$event->venue}}</p>
                          </div>
                      </div>

                      <br>
                      <div class="row">
                          <div class="col-md-12">
                              <p class="lead text-white">Register with this link: <a href="{{ $event->url }}" target="_blank">Click Here For Registration</a> </p>
                              
                          </div>
                      </div>
                      
                  </div>
             </div>
        </div>   
     </section>



</body>
</html>


@endsection
