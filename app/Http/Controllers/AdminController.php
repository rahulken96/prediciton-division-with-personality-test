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
            $item = Report::orderBy('created_at', 'desc')->get();
            return DataTables::of($item)
                ->addIndexColumn()
                ->addColumn('created_at', function ($row) {
                    return date('d F Y H:i', strtotime($row->created_at));
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . url("/print/" . enc($row->id)) . '" class="px-1 py-1 text-sm font-semibold text-green-400 border-2 border-green-400 rounded-lg active:bg-green-600 hover:bg-green-700 hover:text-white transform hover:scale-110 hover:border-green-50 transition duration-500">Lihat Hasil</a>&nbsp';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.report');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function users()
    {
        if (request()->ajax()) {
            $item = User::where('isAdmin', 0)->orderBy('created_at', 'desc')->get();
            return DataTables::of($item)
                ->addIndexColumn()
                ->addColumn('created_at', function ($row) {
                    return date('d F Y H:i', strtotime($row->created_at));
                })
                ->make(true);
        }

        return view('admin.user-acc');
    }

    public function register(Request $request)
    {
        $request->validate([
            'nama'      => 'required|string',
            'noHP'      => 'required|numeric',
            'email'     => 'required|email',
            'password'  => 'required',
        ],[
            'nama.required'     => 'Nama Wajib Diisi !',
            'nama.string'       => 'Nama Hanya Berisi Huruf',
            'noHP.required'     => 'No. HP Wajib Diisi !',
            'noHP.numeric'      => 'No. HP Hanya Berisi Angka',
            'email.required'    => 'Email Wajib Diisi !',
            'email.email'       => 'Harap Mengisi Email Dengan Benar !',
            'password.required' => 'Password Wajib Diisi !',
        ]);

        $user = new User;
        $user->nama = ucwords(strtolower($request->nama));
        $user->email = strtolower($request->email);
        $user->noHP = $request->noHP;
        $user->password = Hash::make($request->password);
        $user->isAdmin  = 1;
        $user->email_verified_at = \Carbon\Carbon::now();
        $user->remember_token = Str::random(10);

        if ($user->save()) {
            return redirect(route('admin.dashboard'))->with('berhasil', 'Pendaftaran Berhasil !');
        }

        return redirect(route('admin.dashboard'))->with('gagal', 'Pendaftaran Gagal !');
    }
}
