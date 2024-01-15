@extends('layouts.master')
@section('title')
     معاينة  الفاتورة قبل الطباعة
@stop
@section('css')
    <style>
        @media print {
            #print_Button {
                display: none;
            }
        }

    </style>
@endsection

@section('page-header')

@endsection

@section('content')
    <!-- row -->
    <div class="row row-sm">
        <div class="col-md-12 col-xl-12">
            <div class=" main-content-body-invoice" id="print">
                <div class="card card-invoice">
                    <div class="card-body">
                        <div class="invoice-header">
                            <h1 class="invoice-title" style="margin-left: 333px">معاينة فاتورة قبل الطباعة </h1>
                            <div class="billed-from">
                            </div>
                        </div>
                        <div class="row mg-t-20">
                            <div class="col-md">

                                <div class="billed-to">

                                </div>
                            </div>
                            <div style="margin-left: 900px">
                                <label class="tx-gray-600">معلومات الفاتورة</label>
                                <p class="invoice-info-row"><span>رقم الفاتورة</span>
                                    <span>{{$invoices->invoice_number}}</span></p>
                                <p class="invoice-info-row"><span>تاريخ الاصدار</span>
                                    <span>{{$invoices->invoice_Date}}</span></p>
                                <p class="invoice-info-row"><span>تاريخ الاستحقاق</span>
                                    <span>{{$invoices->Due_date}}</span></p>
                                <p class="invoice-info-row"><span>القسم</span>
                                    <span>{{$invoices->section->section_name}}</span></p>
                            </div>
                        </div>
                        <div class="table-responsive mg-t-40">
                            <table class="table table-invoice border text-md-nowrap mb-0">
                                <thead>
                                <tr>
                                    <th class="wd-20p">#</th>
                                    <th class="wd-40p">المنتج</th>
                                    <th class="tx-center">مبلغ التحصيل</th>
                                    <th class="tx-right">مبلغ العمولة</th>
                                    <th class="tx-right">الاجمالي</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td class="tx-12">{{$invoices->product}}</td>
                                    <td class="tx-center">{{number_format($invoices->Amount_collection,0)}}</td>
                                    <td class="tx-right">{{number_format($invoices->Amount_Commission,0)}}</td>
                                    @php
                                        $total = $invoices->Amount_collection + $invoices->Amount_Commission ;
                                    @endphp
                                    <td class="tx-right">
                                        {{number_format($total,0)}}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="valign-middle" colspan="2" rowspan="4">
                                        <div class="invoice-notes">
                                            <label class="main-content-label tx-13">#</label>

                                        </div><!-- invoice-notes -->
                                    </td>
                                    <td class="tx-right">الاجمالي</td>
                                    <td class="tx-right" colspan="2"> {{ number_format($total,0) }}</td>
                                </tr>
                                <tr>
                                    <td class="tx-right">نسبة الضريبة ({{ $invoices->Rate_VAT }})</td>
                                    <td class="tx-right" colspan="2">287.50</td>
                                </tr>
                                <tr>
                                    <td class="tx-right">قيمة الخصم</td>
                                    <td class="tx-right" colspan="2"> {{ number_format($invoices->Discount,0) }}</td>

                                </tr>
                                <tr>
                                    <td class="tx-right tx-uppercase tx-bold tx-inverse">الاجمالي شامل الضريبة</td>
                                    <td class="tx-right" colspan="2">
                                        <h4 class="tx-primary tx-bold">{{ number_format($invoices->Total,0) }}</h4>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <hr class="mg-b-40">



                        <button class="btn btn-danger  float-left mt-3 mr-2" id="print_Button" onclick="printDiv() "> <i
                                class="mdi mdi-printer ml-1"></i>طباعة</button>
                    </div>
                </div>
            </div>
        </div><!-- COL-END -->
    </div>
    <!-- row closed -->
    </div>
    <!-- Container closed -->
    </div>

@endsection

@section('js')
<script src="{{ URL::asset('assets/plugins/chart.js/Chart.bundle.min.js') }}"></script>
                  <script>
                       function printDiv() {
                              var printContents = document.getElementById('print').innerHTML;
                              var originalContents = document.body.innerHTML;
                              document.body.innerHTML = printContents;
                              window.print();
                              document.body.innerHTML = originalContents;
                              location.reload();
                       }

                  </script>
@endsection
