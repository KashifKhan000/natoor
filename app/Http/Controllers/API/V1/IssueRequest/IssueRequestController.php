<?php

namespace App\Http\Controllers\API\V1\IssueRequest;

use App\Http\Controllers\Controller;
use App\Models\IssueRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class IssueRequestController extends Controller
{
    protected $data = ['message' => '','response' => [],'errors' => [],'status' => 200];

    protected function validateIssueRequest($request){
        return Validator::make($request->all(),[
            "status"  => "required",
        ]);
    }

    public function saveIssueRequest(Request $request){
        $validate = $this->validateIssueRequest($request);
        if($validate->fails()){
            $this->data['errors'] = $validate->errors()->all();
            $this->data['status'] = 422;
        }else{
            $service = new IssueRequest();
            $response = $service->saveIssueRequest($request);
            if($response){
                $this->data['message'] = 'Problem Send successfully';
            }else{
                $this->data['errors'] = ['Unable to Send Problem'];
                $this->data['status'] = 500;
            }
        }
        return response()->json($this->data);
    }

    public function updateService(Request $request,$id = ''){
        if($id > 0){
            $validate = $this->validateService($request);
            if($validate->fails()){
                $this->data['errors'] = $validate->errors()->all();
                $this->data['status'] = 422;
            }else{
                $service = new Services();
                $response = $service->updateService($request,$id);
                if($response){
                    $this->data['message'] = 'Service updated successfully';
                }else{
                    $this->data['errors'] = ['Unable to update service'];
                    $this->data['status'] = 500;
                }
            }
        }else{
            $this->data['status'] = 404;
            $this->data['errors'] = ['Error while resolving id'];
        }
        return response()->json($this->data);
    }

    public function getService(Request $request,$id=""){
        $service = new Services();
        $this->data['response'] = $service->getService($request,$id);
        return response()->json($this->data);
    }

    public function deleteService($id = ''){
        if($id > 0){
            $service = new Services();
            $response = $service->deleteService($id);
            if($response){
                $this->data['message'] = 'Service deleted successfully';
                $this->data['status'] = 200;
            }else{
                $this->data['errors'] = ['Unable to delete service'];
                $this->data['status'] = 500;
            }
        }else{
            $this->data['errors'] = ['Error resolving id'];
            $this->data['status'] = 404;
        }
        return response()->json($this->data);
    }
    
        public function images(){
            return $this->hasMany(MediaFiles::class,'item_id')->where(['item_type' => 'IssueRequest' ]);
        }
}
