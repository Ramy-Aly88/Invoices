<?php

use Illuminate\Support\Facades\Route;



Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();
Auth::routes(['register' => false]);

Route::get('/home', 'HomeController@index')->name('home');


Route::resource('invoices', 'InvoicesController');
Route::resource('sections', 'SectionsController');
Route::resource('products', 'ProductsController');
Route::resource('InvoiceAttachments', 'InvoiceAttachmentsController');
Route::get('/section/{id}', 'InvoicesController@getproducts');
Route::get('/InvoicesDetails/{id}', 'InvoicesDetailsController@edit');

Route::get('download/{invoice_number}/{file_name}', 'InvoicesDetailsController@download');

Route::get('View_file/{invoice_number}/{file_name}', 'InvoicesDetailsController@open');

Route::post('delete_file', 'InvoicesDetailsController@destroy')->name('delete_file');

Route::get('/edit_invoice/{id}', 'InvoicesController@edit');
Route::get('/Status_show/{id}', 'InvoicesController@show')->name('Status_show');
Route::post('/Status_Update/{id}', 'InvoicesController@Status_Update')->name('Status_Update');



Route::get('/{page}', 'AdminController@index');
