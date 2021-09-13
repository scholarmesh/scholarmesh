@extends('layouts.app')

@section('content')
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
    <link rel="icon" href="Favicon.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link href="{{ URL::to('customcss/makeevent.css') }}" rel="stylesheet">

    <title>Make Conference</title>
</head>
<body>



<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Fill up Information to Create new Conference</div>
                        <div class="card-body">
                            <form name="my-form" action="{{ route('makeevent') }}" method="post">
                                <div class="form-group row">
                                    <label for="name" class="col-md-4 col-form-label text-md-right">Name:</label>
                                    <div class="col-md-6">
                                        <input type="text" id="name" class="form-control" name="name">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="image" class="col-md-4 col-form-label text-md-right">Image:</label>
                                    <div class="col-md-6">
                                        <input type="file" class="form-control-file" id="image" name="image">
                                    </div>
                                   
                                </div>

                                <div class="form-group row">
                                    <label for="venue" class="col-md-4 col-form-label text-md-right">Venue:</label>
                                    <div class="col-md-6">
                                        <input type="text" id="venue" class="form-control" name="venue">
                                    </div>
                                </div>

                        
                                <div class="form-group row">
                                    <label for="start-date" class="col-md-4 col-form-label text-md-right">Start Date:</label>
                                    <div class="col-md-6">
                                        <input type="text" id="start-date" class="form-control" name="start-date">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="end-date" class="col-md-4 col-form-label text-md-right">End Date:</label>
                                    <div class="col-md-6">
                                        <input type="text" id="end-date" class="form-control" name="end-date">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="url" class="col-md-4 col-form-label text-md-right">Registration URL:</label>
                                    <div class="col-md-6">
                                        <input type="text" id="url" class="form-control" name="url">
                                    </div>
                                </div>


                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                        Submit
                                        </button>
                                    <input type="hidden" name="_token" value="{{ Session::token() }}">    

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>
@endsection