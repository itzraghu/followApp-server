<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
$router->post('/api/login/', 'AuthController@authenticate');

$router->group(['prefix' => 'api', 'middleware' => 'auth'],  function ($router) {

	$router->post('/profile','AuthController@profile');

	/*---------Masters-------*/
	$router->post('/product-service-types','MasterController@productServiceTypes');
	$router->post('/add-product-service-type','MasterController@addProductServiceType');
	$router->post('/delete-product-service-type','MasterController@deleteProductServiceType');

	$router->post('/priorities','MasterController@priorities');
	$router->post('/add-priority','MasterController@addPriority');
	$router->post('/delete-priority','MasterController@deletePriority');

	$router->post('/enquiry-subjects','MasterController@enquirySubjects');
	$router->post('/add-enquiry-subject','MasterController@addEnquirySubject');
	$router->post('/delete-enquiry-subject','MasterController@deleteEnquirySubject');
	
	$router->post('/communication-modes','MasterController@communicationModes');
	$router->post('/add-communication-mode','MasterController@addCommunicationMode');
	$router->post('/delete-communication-mode','MasterController@deleteCommunicationMode');


	/*---------Client-------*/
	$router->post('/add-client','ClientController@addClient');
	$router->post('/add-client-contact-person','ClientController@addClientContactPerson');
	$router->post('/add-client-enquiry','ClientController@addClientEnquiry');
	$router->post('/add-client-product','ClientController@addClientProduct');

});
