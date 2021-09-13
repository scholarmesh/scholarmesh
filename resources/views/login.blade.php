<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('icons/bootstrap-icons.css') }}" />

    <title>Login &mdash; ScholarMesh</title>

    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>


<body class="text-center bg-dark-secondary text-light-secondary">

<main class="form-signin d-flex align-items-center">
    <div class="d-flex flex-column">
        <form>
            <img class="m-5" src="{{ asset('svg/sm-full.svg') }}" alt="ScholarMesh logo" width="250rem" />

            <h2 class="my-3 fw-normal">Sign in</h2>
{{--            <p class="lead">You must log in first.</p>--}}

            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput" class="text-dark-secondary">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                <label for="floatingPassword" class="text-dark-secondary">Password</label>
            </div>

            <button class="w-100 btn btn-lg btn-primary" type="submit">Log in</button>
        </form>

        <div class="row mt-4">
            <a href="/signup" class="fs-5">Don&rsquo;t have an account? Sign up.</a>
        </div>
    </div>

</main>

</body>
</html>
