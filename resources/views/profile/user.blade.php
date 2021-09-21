<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="{{ asset('css/bootstrap.css') }}"/>
    <link rel="stylesheet" href="{{ asset('icons/bootstrap-icons.css') }}"/>

    <title>User Name — ScholarMesh</title>
</head>
<body>

<main class="container col-xxl-6 col-xl-7 col-8">

    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-auto">
                <img src="{{ asset('images/avatar.png') }}" alt="" class="rounded-circle" width="170"/>
            </div>
            <h2 class="d-flex justify-content-center my-3">
                John Doe
            </h2>

            <div class="btn-group" style="width: 11.5em">
                <button type="button" class="btn btn-primary"><i class="bi bi-plus-lg me-3"></i><strong>Post</strong></button>
                <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="visually-hidden">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-plus-lg me-3"></i>Paper</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-plus-lg me-3"></i>Event</a></li>
                </ul>
            </div>

            <p class="p-3 mb-3 lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus error esse eum fuga fugit impedit itaque molestias neque quidem, tempora temporibus totam. Consectetur corporis esse eum nemo non repudiandae sint.</p>

        </div>
    </div>


    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-auto">
                    <img src="{{ asset('images/avatar.png') }}" alt="" class="rounded-circle" style="width: 5rem"/>
                </div>
                <div class="col row">
                    <div class="h4"><a href="#" class="link-dark text-decoration-none">User Name</a></div>
                    <div class="small">
                        <time><a href="#" class="text-muted text-decoration-none">1 min ago</a></time>
                    </div>
                </div>
                <div class="col-auto dropdown">
                    <button class="btn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-drop bi-three-dots"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="card-body lead">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi consectetur corporis dicta ea error ex explicabo facere hic id incidunt ipsam maiores minima quas rem tempore tenetur vel veniam, voluptatibus?
        </div>
        <div class="card-footer d-flex justify-content-evenly">
            <button class="btn"><i class="bi bi-reply text-muted"></i></button>
            <button class="btn"><i class="bi bi-share text-muted"></i></button>
            <button class="btn"><i class="bi bi-heart text-muted"></i></button>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-auto">
                    <img src="{{ asset('images/avatar.png') }}" alt="" class="rounded-circle" style="width: 5rem"/>
                </div>
                <div class="col">
                    <div class="mb-2">
                        <a href="#" class="h5 link-dark text-decoration-none">User Name</a>
                        <time><span class="small text-muted ms-3">1 min ago</span></time>
                    </div>
                    <div class="row">
                        <div class="col">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet aperiam atque, blanditiis
                            cum, deleniti dicta earum expedita fugiat laborum laudantium modi omnis pariatur porro sed sequi suscipit
                            ullam vero voluptatum.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-auto">
                    <img src="{{ asset('images/avatar.png') }}" alt="" class="rounded-circle" style="width: 5rem"/>
                </div>
                <div class="col">
                    <div class="mb-2">
                        <a href="#" class="h5 link-dark text-decoration-none">User Name</a>
                        <time><span class="small text-muted ms-3">1 min ago</span></time>
                    </div>
                    <div class="row">
                        <div class="col">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet aperiam atque, blanditiis
                            cum, deleniti dicta earum expedita fugiat laborum laudantium modi omnis pariatur porro sed sequi suscipit
                            ullam vero voluptatum.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>

<script src="{{ asset('js/bootstrap.bundle.js') }}"></script>
</body>
</html>
