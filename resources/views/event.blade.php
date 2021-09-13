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
    
    
    <link href="{{ URL::to('customcss/event.css') }}" rel="stylesheet">
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
                    
                      
                      <h1 class="display-5 text-white" style="font-family: 'Anton', sans-serif;">Conference Name</h1>
                      <br>
                      
                      <br>
                      <!--Content Section-->

                    <div class="col-md-4" style="background-color: #8470FF;">
                        <center>
                            <img src="https://lp2.hm.com/hmgoepprod?set=source[/00/40/00409b855702e38fb47994a552452356327f4fee.jpg],origin[dam],category[ladies_knitwear_cardigans],type[LOOKBOOK],res[m],res[s],hmver[1]&call=url[file:/product/main]" alt="shopping-girl" class="">
                        </center>
                    </div>
                      <div class="row">
                           <div class="col-md-6">
                               <h4 class="text-white">Start Date:</h4>
                               <p class="text-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                           </div>
                           <div class="col-md-6">
                               <h4 class="text-white">End Date:</h4>
                               <p class="text-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                           </div>
                      </div>
                      
                      
                      <br>
                      <br>
                      <div class="row">
                          <div class="col-md-12">
                              <p class="lead text-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                          </div>
                      </div>

                      <br>
                      <div class="row">
                          <div class="col-md-12">
                              <p class="lead text-white">Register with this link: <a href="url" target="_blank">Click Here For Registration</a> </p>
                              
                          </div>
                      </div>
                      
                  </div>
             </div>
        </div>   
     </section>



</body>
</html>


@endsection
