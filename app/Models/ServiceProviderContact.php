<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Stancl\Tenancy\Database\Concerns\BelongsToTenant;

class ServiceProviderContact extends Model
{
    use BelongsToTenant;
    protected $table = 'service_providers_contacts';
}
