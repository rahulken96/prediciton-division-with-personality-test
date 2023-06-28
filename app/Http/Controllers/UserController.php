<?php

namespace App\Http\Controllers;

use App\Models\Report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Models\User;
use Yajra\DataTables\Facades\DataTables;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!auth()->check()) {
            return view('users.login')->with('login', 'Harap Masuk Terlebih Dahulu !');
        }

        return redirect(route('home'))->with('info', 'Anda Telah Masuk Akun !');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!auth()->check()) {
            return view('users.registrasi');
        }

        return redirect(route('home'))->with('info', 'Anda Telah Masuk Akun !');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        if (auth()->user()->isAdmin != 0) {
            return back()->with('gagal', 'Harap Mengganti Akun Terlebih Dahulu !');
        }

        if (request()->ajax()) {
            $item = Report::where('userID', Auth::user()->id)->orderBy('created_at','desc')->get();
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

        $data = [
            'reportCount'   => Report::where('userID', Auth::user()->id)->count(),
        ];

        return view('users.dashboard', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit()
    {
        if (auth()->user()->isAdmin != 0) {
            return back()->with('gagal', 'Harap Mengganti Akun Terlebih Dahulu !');
        }

        $data = [
            'data'  => User::find(Auth::user()->id),
        ];

        return view('users.profile', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //Validasi inputan dari $request
        $request->validate([
            'nama'      => 'required|string',
            'noHP'      => 'required|numeric',
            'email'     => 'required|email',
        ],[
            'nama.required'     => 'Nama Wajib Diisi !',
            'nama.string'       => 'Nama Hanya Berisi Huruf',
            'noHP.required'     => 'No. HP Wajib Diisi !',
            'noHP.numeric'      => 'No. HP Hanya Berisi Angka',
            'email.required'    => 'Email Wajib Diisi !',
            'email.email'       => 'Harap Mengisi Email Dengan Benar !',
        ]);

        $user = User::where('id', Auth::user()->id);
        $report = Report::where('userID', Auth::user()->id);

        //Update user
        if(isset($request->password)){
            $password = Hash::make($request->password);
            $user->update(['password' => $password]);
        }
        $user->update([
            'nama'        => $request->nama,
            'email'       => $request->email,
            'noHP'        => $request->noHP,
            'updated_at'  => \Carbon\Carbon::now(),
        ]);

        //Update user di reports
        $report->update([
            'nama'        => $request->nama,
            'email'       => $request->email,
            'updated_at'  => \Carbon\Carbon::now(),
        ]);

        return redirect(route('users.profile'))->with('berhasil', 'Data berhasil diubah !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function login(Request $request)
    {
        $rules = [
            'email'                 => 'required|email',
            'password'              => 'required|string'
        ];

        $messages = [
            'email.required'        => 'Email wajib diisi',
            'email.email'           => 'Email tidak valid',
            'password.required'     => 'Password wajib diisi',
            'password.string'       => 'Password harus berupa string'
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return redirect()->back()->with('gagal', 'Email atau Password salah !');
        }

        $data = [
            'email'     => $request->input('email'),
            'password'  => $request->input('password'),
        ];

        // Cek login sekalian session field di users nanti bisa dipanggil via Auth
        if (Auth::attempt($data)) {
            if (Auth::user()->isAdmin == 1) {
                return redirect(route('admin.dashboard'));
            };

            return redirect(route('test'))->with('info', 'Selamat Mengerjakan !!');
        }

        //Login gagal
        return redirect(route('login'))->with('gagal', 'Email atau Password salah !');
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

        $user = new User();
        $user->nama     = ucwords(strtolower($request->nama));
        $user->email    = strtolower($request->email);
        $user->noHP     = $request->noHP;
        $user->password = Hash::make($request->password);
        $user->isAdmin  = 0;
        $user->email_verified_at = \Carbon\Carbon::now();
        $user->remember_token = Str::random(10);

        if ($user->save()) {
            return redirect(route('login'))->with('berhasil', 'Pendaftaran Berhasil, Silahkan Masuk !');
        }

        return back()->with('gagal', 'Pendaftaran Gagal !');
    }

    public function logout()
    {
        // menghapus session yang aktif
        Auth::logout();
        return redirect(route('login'))->with('berhasil', 'Anda Berhasil Keluar !');
    }
}
