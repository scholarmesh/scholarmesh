<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function posts() {
        return $this->hasMany(Post::class);
    }

    public function comments() {
        return $this->hasMany(Comment::class);
    }

    public function likedPosts() {
        return $this->belongsToMany(Post::class, 'post_liker', 'user_id', 'post_id');
    }

    public function likedComments() {
        return $this->belongsToMany(Comment::class, 'comment_liker', 'user_id', 'comment_id');
    }

    public function groups() {
        return $this->belongsToMany(Group::class, 'group_moderator', 'moderator_id', 'group_id');
    }

    public function events() {
        return $this->belongsToMany(Event::class, 'event_admin', 'admin_id', 'event_id');
    }
}
