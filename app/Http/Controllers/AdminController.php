<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\Question;
use App\Models\Report;
use Yajra\DataTables\Facades\DataTables;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('logout');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (auth()->user()->isAdmin != 1) {
            return redirect()->back()->with('gagal', 'Harap Mengganti Akun Terlebih Dahulu !');
        }

        $data = [
            'adminCount'    => User::where('isAdmin', 1)->count(),
            'userCount'     => User::where('isAdmin', 0)->count(),
            'reportCount'   => Report::count(),
            'questionCount' => Question::count(),
        ];

        return view('admin.dashboard', $data);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function report()
    {
        if (request()->ajax()) {
            $item = Report::get();
            return DataTables::of($item)
                ->addIndexColumn()
                ->addColumn('created_at', function ($row) {
                    return date('d F Y', strtotime($row->created_at));
                })
                // ->addColumn('action', function ($row) {

                //     $btn = '<a href="javascript:void(0)" class="edit btn btn-primary btn-sm">View</a>';

                //     return $btn;
                // })
                // ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.report');
    }

    public function register(Request $request)
    {
        $user = new User;
        $user->name = ucwords(strtolower($request->name));
        $user->email = strtolower($request->email);
        $user->password = Hash::make($request->password);
        $user->isAdmin  = 1;
        $user->email_verified_at = \Carbon\Carbon::now();
        $user->remember_token = Str::random(10);

        if ($user->save()) {
            return redirect(route('admin.dashboard'))->with('berhasil', 'Pendaftaran Berhasil !');
        }

        return back()->with('gagal', 'Pendaftaran Gagal !');
    }
}
