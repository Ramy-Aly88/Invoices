<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\invoices;

class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }


    public function index()
    {
//=================احصائية نسبة الفواتير======================



      $count_all =invoices::count();
      $count_invoices1 = invoices::where('Value_Status', 1)->count();
      $count_invoices2 = invoices::where('Value_Status', 2)->count();
      $count_invoices3 = invoices::where('Value_Status', 3)->count();

      if($count_invoices2 == 0){
          $nspainvoices2=0;
      }
      else{
          $nspainvoices2 = $count_invoices2/ $count_all*100;
      }

        if($count_invoices1 == 0){
            $nspainvoices1=0;
        }
        else{
            $nspainvoices1 = $count_invoices1/ $count_all*100;
        }

        if($count_invoices3 == 0){
            $nspainvoices3=0;
        }
        else{
            $nspainvoices3 = $count_invoices3/ $count_all*100;
        }


        $chartjs = app()->chartjs
            ->name('barChartTest')
            ->type('bar')
            ->size(['width' => 350, 'height' => 200])
            ->labels(['الفواتير الغير المدفوعة','الفواتير المدفوعة جزئيا', 'الفواتير المدفوعة'])
            ->datasets([
                [
                    "label" => "الفواتير الغير المدفوعة",
                    'backgroundColor' => ['#e41b0a'],
                    'data' => [$nspainvoices2]
                ],

                [
                    "label" => "الفواتير المدفوعة جزئيا",
                    'backgroundColor' => ['#f87434'],
                    'data' => [$nspainvoices3]
                ],
                [
                    "label" => "الفواتير المدفوعة",
                    'backgroundColor' => ['#0b9c6c'],
                    'data' => [$nspainvoices1]
                ],



            ])
            ->options([]);


        $chartjs_2 = app()->chartjs
            ->name('pieChartTest')
            ->type('pie')
            ->size(['width' => 340, 'height' => 200])
            ->labels(['الفواتير الغير المدفوعة', 'الفواتير المدفوعة','الفواتير المدفوعة جزئيا'])
            ->datasets([
                [
                    'backgroundColor' => ['#e41b0a', '#0b9c6c','#f87434'],
                    'data' => [ $nspainvoices2,$nspainvoices1,$nspainvoices3]
                ]
            ])
            ->options([]);

        return view('home', compact('chartjs','chartjs_2'));

    }




    public function postLogin(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            return redirect()->intended('dashboard')
                ->withSuccess('You have Successfully Logged In');
        }

        return redirect("login")->withSuccess('Oppes! You have entered invalid credentials');
    }

}
