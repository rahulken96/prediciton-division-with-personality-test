<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Question;
use App\Models\Report;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('users.login');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('users.registrasi');
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
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
            return redirect()->back()->withErrors($validator)->withInput($request->all);
        }

        $data = [
            'email'     => $request->input('email'),
            'password'  => $request->input('password'),
        ];

        // Cek login sekalian session field di users nanti bisa dipanggil via Auth
        if (Auth::attempt($data)) {
            if (Auth::user()->isAdmin == 1) {
                return redirect()->route('admin.dashboard');
            };

            return redirect()->route('home');
        }

        //Login gagal
        return redirect(route('login'))->with('gagal', 'Email atau Password salah !');
    }

    public function register(Request $request)
    {
        $user = new User();
        $user->name     = ucwords(strtolower($request->nama));
        $user->email    = strtolower($request->email);
        $user->noHP     = $request->noHP;
        $user->password = Hash::make($request->password);
        $user->isAdmin  = 0;
        $user->email_verified_at = \Carbon\Carbon::now();

        if ($user->save()) {
            return redirect(route('login'))->with('berhasil','Pendaftaran Berhasil, Silahkan Masuk !');
        }

        return back()->with('gagal','Pendaftaran Gagal !');
    }

    public function logout()
    {
        // menghapus session yang aktif
        Auth::logout();
        return redirect(route('home'))->with('berhasil','Anda Telah Keluar Akun !');
    }
}
