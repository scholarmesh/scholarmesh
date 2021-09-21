@props(['post'])
<div class="card">
    <div class="card-header">
        <div class="row align-items-center">
            <div class="col-auto">
                <img src="/assets/images/icons/person-circle.svg" alt="avatar" class="rounded-circle" style="width: 5rem" />
            </div>
            <div class="col row">
                <div class="h4"><a href="#"
                        class="link-dark text-decoration-none">{{ $post->user->name }}</a></div>
                <div class="small">
                    <time>
                        <a href="#" class="text-muted text-decoration-none">
                            {{ $post->created_at->diffForHumans() }}
                        </a>
                    </time>
                </div>
            </div>
            <div class="col-auto dropdown">
                <button class="btn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="bi bi-drop bi-three-dots"></i>
                </button>
            </div>
        </div>
    </div>
    <div class="card-body lead">
        {{ $post->body }}
    </div>
    <div class="card-footer d-flex justify-content-evenly">
        <button class="btn"><i class="bi bi-hand-thumbs-up"></i></button>
        <button class="btn"><i class="bi bi-chat-square-text"></i></button>
    </div>
</div>
