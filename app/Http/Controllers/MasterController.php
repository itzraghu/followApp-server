<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class MasterController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function productServiceTypes(Request $request){
       $response['flag'] = true;
       $response['product_service_types'] = \App\ProductServiceType::where('is_active',1)->get();
       return response()->json($response);
   }

   public function addProductServiceType(Request $request){
       $this->validate($request, [
         'product_service_type' => 'required|unique:product_service_types,product_service_type',
     ]);
       $response = array();

       $product_service_type = new \App\ProductServiceType();
       $product_service_type->product_service_type = $request->product_service_type;
       if($product_service_type->save()){
        $response['flag'] = true;
        $response['message'] = "Added Successfully";
    }else{
        $response['flag'] = false;
        $response['message'] = "Failed to Save";
    }
    return response()->json($response);
}

public function deleteProductServiceType(Request $request){
   $this->validate($request, [
    'product_service_type_id' => 'required',
]);
   $response = array();

   $product_service_type = \App\ProductServiceType::find($request->product_service_type_id);
   $product_service_type->is_active = 0;
   if($product_service_type->save()){
    $response['flag'] = true;
    $response['message'] = "Deleted Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Delete";
}
return response()->json($response);
}



public function addPriority(Request $request){
   $this->validate($request, [
    'priority' => 'required|unique:priorities,priority',
]);
   $response = array();

   $priority = new \App\Priority();
   $priority->priority = $request->priority;
   if($priority->save()){
    $response['flag'] = true;
    $response['message'] = "Added Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Save";
}
return response()->json($response);
}

public function deletePriority(Request $request){
   $this->validate($request, [
    'priority_id' => 'required',
]);
   $response = array();

   $priority = \App\Priority::find($request->priority_id);
   $priority->is_active = 0;
   if($priority->save()){
    $response['flag'] = true;
    $response['message'] = "Deleted Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Delete";
}
return response()->json($response);
}


public function addEnquirySubject(Request $request){
   $this->validate($request, [
    'enquiry_subject' => 'required|unique:enquiry_subjects,enquiry_subject',
]);
   $response = array();

   $enquiry_subject = new \App\EnquirySubject();
   $enquiry_subject->enquiry_subject = $request->enquiry_subject;
   if($enquiry_subject->save()){
    $response['flag'] = true;
    $response['message'] = "Added Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Save";
}
return response()->json($response);
}

public function deleteEnquirySubject(Request $request){
   $this->validate($request, [
    'enquiry_subject_id' => 'required',
]);
   $response = array();

   $enquiry_subject = \App\EnquirySubject::find($request->enquiry_subject_id);
   $enquiry_subject->is_active = 0;
   if($enquiry_subject->save()){
    $response['flag'] = true;
    $response['message'] = "Deleted Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Delete";
}
return response()->json($response);
}


public function addCommunicationMode(Request $request){
   $this->validate($request, [
    'communication_mode' => 'required|unique:communication_modes,communication_mode',
]);
   $response = array();

   $communication_mode = new \App\CommunicationMode();
   $communication_mode->communication_mode = $request->communication_mode;
   if($communication_mode->save()){
    $response['flag'] = true;
    $response['message'] = "Added Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Save";
}
return response()->json($response);
}

public function deleteCommunicationMode(Request $request){
   $this->validate($request, [
    'communication_mode_id' => 'required',
]);
   $response = array();

   $communication_mode = \App\CommunicationMode::find($request->communication_mode_id);
   $communication_mode->is_active = 0;
   if($communication_mode->save()){
    $response['flag'] = true;
    $response['message'] = "Deleted Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Delete";
}
return response()->json($response);
}


}
