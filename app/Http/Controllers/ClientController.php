<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class ClientController extends Controller
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

    
    public function addClient(Request $request){
       $this->validate($request, [
        'name' => 'required',
        'email' => 'required|unique:clients,email',
        'address' => 'required',
        'country_id' => 'required',
        'state_id' => 'required',
    ]);

       $response = array();
       $client = new \App\Client();
       $client->name = $request->name;
       $client->email = $request->email;
       $client->address = $request->address;           
       $client->website = $request->website;
       $client->contact_number = $request->contact_number;
       $client->city = $request->city;             
       $client->state_id = $request->state_id;         
       $client->country_id = $request->country_id;         
       $client->remarks = $request->remarks;           
       $client->visiting_card = $request->visiting_card;
       $client->other_document = $request->other_document;
       $client->latitude = $request->latitude;
       $client->longitude = $request->longitude;   

       if($client->save()){
        $response['flag'] = true;
        $response['message'] = "Added Successfully";
    }else{
        $response['flag'] = false;
        $response['message'] = "Failed to Save";
    }
    return response()->json($response);
}

public function addClientContactPerson(Request $request){
   $this->validate($request, [
    'client_id' => 'required',
    'name' => 'required',
    'email' => 'unique:client_contact_persons,email',

]);

   $response = array();
   $client_contact_person = new \App\ClientContactPerson();
   $client_contact_person->client_id = $request->client_id;
   $client_contact_person->name = $request->name;
   $client_contact_person->email = $request->email;
   $client_contact_person->contact_number = $request->contact_number;
   $client_contact_person->address = $request->address;           
   $client_contact_person->designation = $request->designation;
   if($client_contact_person->save()){
    $response['flag'] = true;
    $response['message'] = "Added Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Save";
}
return response()->json($response);
}


public function addClientEnquiry(Request $request){
   $this->validate($request, [
    'client_id' => 'required',
    'contact_person_id' => 'required',
    'subject_id' => 'required',
    'communication_mode_id' => 'required',
    'enquiry_date' => 'required',
    'enquiry_time' => 'required',
    'remark' => 'required',

]);

   $response = array();
   $client_enquiry = new \App\ClientEnquiry();
   $client_enquiry->client_id = $request->client_id;
   $client_enquiry->contact_person_id = $request->contact_person_id;
   $client_enquiry->subject_id = $request->subject_id;
   $client_enquiry->communication_mode_id = $request->communication_mode_id;
   $client_enquiry->enquiry_date = date('Y-m-d',strtotime($request->enquiry_date));
   $client_enquiry->enquiry_time = date('H:i:s',strtotime($request->enquiry_time));
   $client_enquiry->remark = $request->remark;
   if($client_enquiry->save()){
    $response['flag'] = true;
    $response['message'] = "Added Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Save";
}
return response()->json($response);
}

public function addClientProduct(Request $request){
   $this->validate($request, [
    'client_id' => 'required',
    'product' => 'required',
    'product_service_type_id' => 'required',

]);

   $response = array();
   $client_product = new \App\ClientProduct();
   $client_product->client_id = $request->client_id;
   $client_product->product = $request->product;
   $client_product->product_service_type_id = $request->product_service_type_id;
   if($client_product->save()){
    $response['flag'] = true;
    $response['message'] = "Added Successfully";
}else{
    $response['flag'] = false;
    $response['message'] = "Failed to Save";
}
return response()->json($response);
}

}
