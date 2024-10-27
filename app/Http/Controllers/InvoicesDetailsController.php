<?php

namespace App\Http\Controllers;


use App\invoices;
use App\invoices_details;
use App\invoice_attachments;
use Illuminate\Support\Facades\Storage;
use File;
use Illuminate\Http\Request;


class InvoicesDetailsController extends Controller
{

    public function index()
    {

    }


    public function create()
    {

    }


    public function store(Request $request)
    {

    }


    public function show(invoices_details $invoices_details)
    {

    }


    public function edit($id)
    {
        $invoices= invoices::where ('id',$id)->first();
        $details= invoices_details::where('id_invoice',$id)->get();
        $attachments  = invoice_attachments::where('invoice_id',$id)->get();


        return view('invoices.details_invoice',compact('invoices','details','attachments'));
    }


    public function update(Request $request, invoices_details $invoices_details)
    {

    }


    public function destroy(Request $request)
    {
        $invoices = invoice_attachments::findOrFail($request->id_file);
        $invoices->delete();
        Storage::disk('public_uploads')->delete($request->invoice_number.'/'.$request->file_name);
        session()->flash('delete', 'تم حذف المرفق بنجاح');
        return back();
    }

    public function download($invoice_number,$file_name)

    {
        $contents= Storage::disk('public_uploads')->getDriver()->getAdapter()->applyPathPrefix($invoice_number.'/'.$file_name);
        return response()->download( $contents);
    }
    public function open($invoice_number,$file_name){
        $files = Storage::disk('public_uploads')->getDriver()->
        getAdapter()->applyPathPrefix($invoice_number.'/'.$file_name);
        return response()->file($files);
    }
}
