<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Mail\email;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Password;
use Illuminate\Validation\Rule;
use Tymon\JWTAuth\Facades\JWTAuth;
class AuthController extends Controller
{

    protected $data = ['message' => '','response' => [],'errors' => [],'status' => 200];

    // validate login
    protected function validateLogin($request = array()){
        return Validator::make($request->all(),[
            'email'         => 'required|string|email',
            'password'      => 'required|string|min:8',
            'company_identifier'    => '',
            'type'          => 'required|integer',
        ]);
    }

    // login
    public function login(Request $request){
        // dd(request()->getHttpHost());
        $validator = $this->validateLogin($request);
        if($validator->fails()){
            $this->data['errors'] = $validator->errors()->all();
            $this->data['status'] = 422;
        }else{
            // if(empty($request->input('company_identifier','')) && $request->input('type') == 0){

            // } else if(!empty($request->input('company_identifier','')) && $request->input('type') == 1) {
            //     if(!$token = auth('apiUser')->attempt($validator->validated())){
            //         $this->data['errors'] = ['Unauthorized'];
            //         $this->data['status'] = 401;
            //     }else{
            //         $user = auth('apiUser')->user();
            //         $this->data['response'] = $this->createNewToken($token,$user);
            //     }
            // }else if(!empty($request->input('company_identifier','')) && $request->input('type') == 2){
            //     if(!$token = auth('apiUser')->attempt($validator->validated())){
            //         $this->data['errors'] = ['Unauthorized'];
            //         $this->data['status'] = 401;
            //     }else{
            //         $user = auth('apiUser')->user();
            //         $this->data['response'] = $this->createNewToken($token,$user);
            //     }
            // }else{
            //     $this->data['errors'] = ['Wrong Username or Password!'];
            //     $this->data['status'] = 404;
            // }

            if(!$token = auth('api')->attempt($validator->validated())){
                $this->data['errors'] = ['Unauthorized'];
                $this->data['status'] = 401;
            }else{
                $user = auth('api')->user();
                $this->data['response'] = $this->createNewToken($token,$user);
            }
        }
        return response()->json($this->data);
    }

    protected function validateForget($request){
        return Validator::make($request->all(),[
            'email' => 'required|email|string'
        ]);
    }

    public function forgetPassword(Request $request){
        $validate = $this->validateForget($request);
        if($validate->fails()){
            $this->data['errors'] = $validate->errors()->all();
            $this->data['status'] = 422;
        }else{
            $email = $request->email;
            $user = User::where('email', $email)->first();
            if (empty($user)) {
                $this->data['errors'] = ['Email Not Found!'];
                $data['status'] = 404;
            }else{
                // $credentials = ['email' => $email];
                // $response = Password::sendResetLink($credentials);
                $token = JWTAuth::fromUser($user);
                $link = 'https://natoorservices.com/password/reset/'.$token.'/'.$email;
                try{
                    Mail::to($email)->send(new email($link));
                    if(Mail::failures()){
                        $this->data['message'] = 'Unable to send email';
                        $this->data['status'] = 400;
                    }else{
                        $this->data['message'] = 'We have sent a password reset link to your email';
                        $this->data['status'] = 200;
                    }
                }catch(Exception $e){
                    $this->data['message'] = 'Please enter correct email address';
                    $this->datap['status'] = 404;
                }
            }
        }
        return response()->json($this->data);
    }

    public function reset(Request $request){

    }

    protected function validateProfile($request = array()){
        return Validator::make($request->all(),[
            'first_name' => 'required|string',
            'last_name'  => 'required|string',
            'username'   => 'required|string',
            'gender'     => 'string',
            'mobile_number' => 'required|integer',
            'dob'        => 'required|date_format:Y-m-d',
        ]);
    }
    // update Profile
    public function updateProfile(Request $request){
        $validate = $this->validateProfile($request);
        if($validate->fails()){
            $this->data['errors'] = $validate->errors()->all();
            $this->data['status'] = 422;
        }else{
            $profile = new User();
            $response = $profile->updateProfile($request);
            if($response){
                $this->data['message'] = 'Profile updated successfully';
                $this->data['status'] = 200;
            }else{
                $this->data['errors'] = ['Error while updating profile'];
                $this->data['status'] = 500;
            }
        }
        return response()->json($this->data);
    }

    // add admin account

    protected function validateUserAccount($request = array()){
        return Validator::make($request->all(),[
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => [
                'required',
                Rule::unique('users')->where('dns', request()->getHttpHost()),
            ],
            'username' => [
                'required',
                Rule::unique('users')->where('dns', request()->getHttpHost()),
            ],
            'password' => 'required|min:8',
            'type'    => 'required|integer',
            'status'   => 'required|string',
            'company_name' => 'string|unique:users,company_name,except,id',
            'dns'  => 'required|string',
            'country_id' => 'required|integer',
            'city_id' => 'required|integer',
            'address' => 'required|string',
            'image_url' => 'required|string',
            'latitude' => 'string',
            'longitude' => 'string',
        ]);
    }

    public function addAdmin(Request $request){
        $validate = $this->validateUserAccount($request);

        if($validate->fails()){
            $this->data['errors'] = $validate->errors()->all();
            $this->data['status'] = 422;
        }else{
            $user = new User();
            $response = $user->saveUserAccount($request);
            if($response){
                $this->data['message'] = 'User saved successfully';
            }else{
                $this->data['message'] = 'Error while saving user account';
                $this->data['status'] = 500;
            }
        }
        return response()->json($this->data);
    }


    // logout
    public function logout(){
        if(Auth::check()){
            auth()->logout();
            $this->data['status'] = 200;
            $this->data['message'] = 'User successfully signed out';
        }else{
            $this->data['status'] = 401;
            $this->data['errors'] = ['Unauthorized'];
        }

        return response()->json($this->data);
    }

    // create json web token
    protected function createNewToken($token,$user = array()){
        // $x = $user->tenant->domain;
        // $user = $user;
        return [
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => env('JWT_TTL',null),
            'user' => $user,
        ];
    }
}
