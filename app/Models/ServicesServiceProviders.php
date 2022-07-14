<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Stancl\Tenancy\Database\Concerns\BelongsToTenant;

class ServicesServiceProviders extends Model
{
    use BelongsToTenant;
    protected $table = 'services_services_providers';
}
