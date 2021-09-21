<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'creator_id'
    ];

    public function creator() {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function posts() {
        return $this->hasMany(Post::class);
    }

    public function members() {
        return $this->belongsToMany(User::class, 'group_member', 'group_id', 'member_id');
    }

    public function moderators() {
        return $this->belongsToMany(User::class, 'group_moderator', 'group_id', 'moderator_id');
    }
}
