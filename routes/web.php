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
Route::get('/InvoicesDetails/{id}', 'InvoicesDetailsController@edit');
Route::get('View_file/{invoice_number}/{file_name}', 'InvoicesDetailsController@open');
Route::get('download/{invoice_number}/{file_name}', 'InvoicesDetailsController@download');
Route::post('delete_file', 'InvoicesDetailsController@destroy')->name('delete_file');



Route::get('/section/{id}', 'InvoicesController@getproducts');
Route::get('/{page}', 'AdminController@index');
