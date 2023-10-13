<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Notification;
use App\invoices;
use App\sections;
use App\User;
use App\invoices_details;
use App\invoice_attachments;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Notifications\AddInvoice;
use App\Exports\InvoicesExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Events\MyEventClass;
class InvoicesController extends Controller
{

    public function index()
    {
        $invoices=invoices::all();
        return view('invoices.invoices',compact('invoices'));
    }


    public function create()
    {
        $sections = sections::all();
        return view('invoices.add_invoice', compact('sections'));
    }

    public function store(Request $request)
    {
             invoices::create([
            'invoice_number' => $request->invoice_number,
            'invoice_Date' => $request->invoice_Date,
            'Due_date' => $request->Due_date,
            'product' => $request->product,
            'section_id' => $request->Section,
            'Amount_collection' => $request->Amount_collection,
            'Amount_Commission' => $request->Amount_Commission,
            'Discount' => $request->Discount,
            'Value_VAT' => $request->Value_VAT,
            'Rate_VAT' => $request->Rate_VAT,
            'Total' => $request->Total,
            'Status' => 'غير مدفوعة',
            'Value_Status' => 2,
            'note' => $request->note,
        ]);

        $invoice_id = invoices::latest()->first()->id;
        invoices_details::create([
            'id_Invoice' => $invoice_id,
            'invoice_number' => $request->invoice_number,
            'product' => $request->product,
            'Section' => $request->Section,
            'Status' => 'غير مدفوعة',
            'Value_Status' => 2,
            'note' => $request->note,
            'user' => (Auth::user()->name),
        ]);


        if ($request->hasFile('pic')) {
            $invoice_id = Invoices::latest()->first()->id;
            $image = $request->file('pic');
            $file_name = $image->getClientOriginalName();
            $invoice_number = $request->invoice_number;
            $attachments = new invoice_attachments();
            $attachments->file_name = $file_name;
            $attachments->invoice_number = $invoice_number;
            $attachments->Created_by = Auth::user()->name;
            $attachments->invoice_id = $invoice_id;
            $attachments->save();
            // move pic
            $imageName = $request->pic->getClientOriginalName();
            $request->pic->move(public_path('Attachments/' . $invoice_number), $imageName);
        }

        session()->flash('Add', 'تم اضافة الفاتورة بنجاح');
        return back();
    }

    public function show(invoices $invoices)
    {

    }

   public function edit(invoices $invoices)
    {

    }

    public function update(Request $request, invoices $invoices)
    {

    }

    public function destroy(invoices $invoices)
    {
        invoices::where('id', request('id'))->delete();
        invoices_details::where('invoices_id', request('id'))->delete();
        session()->flash('delete','تم حذف الفاتورة بنجاح');
        return redirect('/invoices');
    }

    public function getproducts($id)
    {
        $products = DB::table("products")->where
        ("section_id", $id)->pluck("Product_name", "id");
        return json_encode($products);

    }


}
