<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'creator_id',
        'location',
        'starts_at',
        'ends_at'
    ];

    public function creator() {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function admins() {
        return $this->belongsToMany(User::class, 'event_admin', 'event_id', 'admin_id');
    }

    public function attendees() {
        return $this->belongsToMany(User::class, 'event_attendee', 'event_id', 'user_id');
    }
}

