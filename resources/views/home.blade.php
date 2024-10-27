@extends('layouts.master')
@section('title')
 الرئيسية للوحة تحكم الفواتير
@endsection
@section('css')

    <!--  Owl-carousel css-->
    <link href="{{URL::asset('assets/plugins/owl-carousel/owl.carousel.css')}}" rel="stylesheet" />
    <!-- Maps css -->
    <link href="{{URL::asset('assets/plugins/jqvmap/jqvmap.min.css')}}" rel="stylesheet">
@endsection
@section('page-header')
    <!-- breadcrumb -->
    <div class="breadcrumb-header justify-content-between">
        <div class="left-content">
            <div>
                <h2 class="main-content-title tx-24 mg-b-1 mg-b-lg-1"></h2>
                <p class="mg-b-0"</p>
            </div>
        </div>
        <div class="main-dashboard-header-right">
            <div>
                <label class="tx-13"> </label>
                <div class="main-star">

                </div>
            </div>
            <div>
                <label class="tx-13"></label>

            </div>
            <div>
                <label class="tx-13"> </label>

            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
@endsection
@section('content')
    <div class="row row-sm">
        <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-primary-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">مجمع  الفواتير</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    <p class="mb-0 tx-12 text-white op-7">إجمالى عدد  الفواتير</p>
                                {{\App\invoices::count()}}
                                    <p class="mb-0 tx-12 text-white op-7">إجمالى مبلغ  الفواتير</p>
                                    {{number_format(\App\invoices::sum('Total'),2)}}
                                </h4>

                            </div>
                            <span class="float-right my-auto mr-auto">
											<i class="fas fa-arrow-circle-up text-white"></i>
											<span class="text-white op-7">100%</span>
										</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-danger-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير الغبر مدفوعة</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    <p class="mb-0 tx-12 text-white op-7">عدد  الفواتير الغير مدفوعة</p>
                                    {{\App\invoices::where('Value_Status','2')->count()}}
                                    <p class="mb-0 tx-12 text-white op-7"> مبلغ  الفواتير الغير مدفوعة</p>
                                    {{number_format(\App\invoices::where('Value_Status',' 2')->sum('Total'),2)}}
                                </h4>

                            </div>

                            <span class="float-right my-auto mr-auto">
											<i class="fas fa-arrow-circle-up text-white"></i>
{{--											<span class="text-white op-7">{{round(\App\invoices::where('Value_Status','2')->count()/\App\invoices::count() * 100)}}%</span>--}}
										</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
               <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-warning-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير المدفوعة جزئيا</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    <p class="mb-0 tx-12 text-white op-7">عدد  الفواتيرالمدفوعة جزئيا</p>
                                    {{\App\invoices::where('Value_Status','3')->count()}}
                                    <p class="mb-0 tx-12 text-white op-7">مبلغ  الفواتير المدفوعة جزئيا</p>
                                    {{number_format(\App\invoices::where('Value_Status','3')->sum('Total'),2)}}
                                </h4>

                            </div>
                            <span class="float-right my-auto mr-auto">
											<i class="fas fa-arrow-circle-up text-white"></i>
{{--											<span class="text-white op-7">{{round(\App\invoices::where('Value_Status','3')->count()/\App\invoices::count() * 100)}}%</span>--}}
										</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
           <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-success-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير المدفوعة بالكامل</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    <p class="mb-0 tx-12 text-white op-7">عدد  الفواتيرالمدفوعة كليا</p>
                                    {{\App\invoices::where('Value_Status','1')->count()}}
                                    <p class="mb-0 tx-12 text-white op-7">مبلغ  الفواتير المدفوعة كليا </p>
                                    {{number_format(\App\invoices::where('Value_Status','1')->sum('Total'),2)}}
                                </h4>

                            </div>
                            <span class="float-right my-auto mr-auto">
											<i class="fas fa-arrow-circle-up text-white"></i>
{{--											<span class="text-white op-7">{{round(\App\invoices::where('Value_Status','1')->count()/\App\invoices::count() * 100)}}%</span>--}}
										</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- row closed -->

    <div class="row row-sm">
        <div class="col-md-12 col-lg-12 col-xl-7">
            <div class="card">
                <div class="card-header bg-transparent pd-b-0 pd-t-20 bd-b-0">
                    <div class="d-flex justify-content-between">
                        <h4 class="card-title mb-0">نسبة احصائية الفواتير</h4>
                        <i class="mdi mdi-dots-horizontal text-gray"></i>
                    </div>

                </div>
                <div class="card-body" style="width: 70%">
                    {!! $chartjs->render() !!}

                </div>
            </div>
        </div>


        <div class="col-lg-12 col-xl-5">
            <div class="card card-dashboard-map-one">
                <label class="main-content-label">نسبة احصائية فواتير رسم بيانى دائرى</label>
                <div class="" style="width: 100%">
                    {!! $chartjs_2->render() !!}
                </div>
            </div>
        </div>
    </div>
    <!-- row closed -->
    </div>
    </div>
    <!-- Container closed -->
@endsection
@section('js')
    <!--Internal  Chart.bundle js -->
    <script src="{{URL::asset('assets/plugins/chart.js/Chart.bundle.min.js')}}"></script>
    <!-- Moment js -->
    <script src="{{URL::asset('assets/plugins/raphael/raphael.min.js')}}"></script>
    <!--Internal  Flot js-->
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.pie.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.resize.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.categories.js')}}"></script>
    <script src="{{URL::asset('assets/js/dashboard.sampledata.js')}}"></script>
    <script src="{{URL::asset('assets/js/chart.flot.sampledata.js')}}"></script>
    <!--Internal Apexchart js-->
    <script src="{{URL::asset('assets/js/apexcharts.js')}}"></script>
    <!-- Internal Map -->
    <script src="{{URL::asset('assets/plugins/jqvmap/jquery.vmap.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jqvmap/maps/jquery.vmap.usa.js')}}"></script>
    <script src="{{URL::asset('assets/js/modal-popup.js')}}"></script>
    <!--Internal  index js -->
    <script src="{{URL::asset('assets/js/index.js')}}"></script>
    <script src="{{URL::asset('assets/js/jquery.vmap.sampledata.js')}}"></script>
@endsection
