<?php

namespace App\Http\Controllers\API\V1\Buildings;

use App\Http\Controllers\Controller;
use App\Models\Building;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BuildingsController extends Controller
{
    protected $data = ['message' => '','response' => [],'errors' => [],'status' => 200];

   

    // building validation

    protected function validateBuilding($request){
        return Validator::make($request->all(),[
            'name_en' => 'string',
            'name_ar' => 'string',
            'latitude' => 'required|string',
            'longitude' => 'required|string',
            'country_id' => 'required|integer',
            'city_id'   => 'required|integer',
        ]);
    }

    // save building
    public function saveBuilding(Request $request){
        $validate = $this->validateBuilding($request);
        if($validate->fails()){
            $this->data['errors'] = $validate->errors()->all();
            $this->data['status'] = 422;
        }else{
            $building = new Building();
            $response = $building->saveBuilding($request);
            if($response){
                $this->data['message'] = 'Building saved successfully';
                $this->data['status'] = 200;
            }else{
                $this->data['errors'] = ['Error saving building'];
                $this->data['status'] = 500;
            }
        }
        return response()->json($this->data);
    }

    // update building
    public function updateBuilding(Request $request,$id){
        if($id > 0){
            $validate = $this->validateBuilding($request);
            if($validate->fails()){
                $this->data['errors'] = $validate->errors()->all();
                $this->data['status'] = 422;
            }else{
                $building = new Building();
                $response = $building->updateBuilding($request,$id);
                if($response){
                    $this->data['message'] = 'Building updated successfully';
                    $this->data['status'] = 200;
                }else{
                    $this->data['errors'] = ['Error updating building'];
                    $this->data['status'] = 500;
                }
            }
        }else{
            $this->data['errors'] = ['Error resolving id'];
            $this->data['status'] = 404;
        }
        return response()->json($this->data);
    }
    
     // get building
    public function getBuilding(Request $request,$id=""){
        $building = new Building();
        $this->data['response'] = $building->getBuilding($request,$id);
        return response()->json($this->data);
    }

    // delete building
    public function deleteBuilding($id){
        if($id > 0){
            $building = new Building();
            $response = $building->deleteBuilding($id);
            if($response){
                $this->data['message'] = 'Building Deleted successfully';
                $this->status = 200;
            }else{
                $this->data['errors'] = ['Unable to delete building'];
                $this->status = 500;
            }
        }else{
            $this->data['errors'] = ['Error resolving id'];
            $this->status = 404;
        }
        return response()->json($this->data);

    }
}
