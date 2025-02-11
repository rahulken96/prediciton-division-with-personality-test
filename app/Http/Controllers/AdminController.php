<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\Question;
use App\Models\Report;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class AdminController extends Controller
{
    protected $isAdmin;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->isAdmin = auth()->user()->isAdmin;

            if ($this->isAdmin != 1) {
                return back()->with('gagal', 'Harap Mengganti Akun Terlebih Dahulu !');
            }

            return $next($request);
        });
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'adminCount'    => User::where('isAdmin', 1)->count(),
            'userCount'     => User::where('isAdmin', 0)->count(),
            'reportCount'   => Report::count(),
            'questionCount' => Question::count(),
        ];

        return view('admin.dashboard', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit()
    {
        $data = [
            'data'  => User::find(auth()->user()->id),
        ];

        return view('admin.profile', $data);
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
            'noHP'      => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:12',
            'email'     => 'required|email:rfc,dns',
        ], [
            'nama.required'     => 'Nama Wajib Diisi !',
            'nama.string'       => 'Nama Hanya Berisi Huruf',
            'noHP.required'     => 'No. HP Wajib Diisi !',
            'noHP.regex'        => 'Harap Mengisi Format No. HP Dengan Benar !',
            'noHP.min'          => 'No. HP Minimal 12 Digit Nomor !',
            'email.required'    => 'Email Wajib Diisi !',
            'email.email'       => 'Harap Mengisi Email Dengan Benar !',
        ]);

        $user = User::where('id', auth()->user()->id);

        //Update user
        if (isset($request->password)) {
            $password = Hash::make($request->password);
            $user->update(['password' => $password]);
        }
        $user->update([
            'nama'        => $request->nama,
            'email'       => $request->email,
            'noHP'        => $request->noHP,
            'updated_at'  => \Carbon\Carbon::now(),
        ]);

        return redirect(route('admin.profile'))->with('berhasil', 'Data berhasil diubah !');
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
                    $btn = '<a href="' . url("/print/" . enc($row->id)) . '" data-toggle="tooltip" data-placement="top" data-original-title="Delete" style="cursor:pointer;" class="px-1 py-1 text-sm font-semibold text-green-400 border-2 border-green-400 rounded-lg active:bg-green-600 hover:bg-green-700 hover:text-white transform hover:scale-110 hover:border-green-50 transition duration-500">Lihat Hasil</a>&nbsp';
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
                ->addColumn('noHP', function ($row) {
                    return Str::of($row->noHP)->mask('x', 5);
                })
                ->addColumn('created_at', function ($row) {
                    return date('d F Y H:i', strtotime($row->created_at));
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . url("/admin/akun-pengguna/" . enc($row->id) . "/ubah") . '" title="Ubah" class="px-1 pt-3 text-sm font-semibold text-blue-500 border-1 border-blue-400 rounded-lg active:bg-blue-600 hover:bg-blue-500 hover:text-white transform hover:scale-110 hover:border-blue-50 transition duration-500"><i class="material-icons text-center">edit</i></a>&nbsp';
                    $btn .= '<a href="#" onclick=hapus(' . $row->id . ') title="Hapus" class="px-1 pt-3 text-sm font-semibold text-red-600 border-1 border-red-400 rounded-lg active:bg-red-600 hover:bg-red-500 hover:text-white transform hover:scale-110 hover:border-red-50 transition duration-500"><i class="material-icons text-center">delete</i></a>&nbsp';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.user-acc');
    }

    public function editUsers($id)
    {
        $id = dec($id);
        $data = [
            'data'  => User::find($id),
        ];

        return view('admin.edit-user-acc', $data);
    }

    public function updateUsers(Request $request, $id)
    {
        //Validasi inputan dari $request
        $request->validate([
            'nama'      => 'required|string',
            'noHP'      => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:12',
            'email'     => 'required|email:rfc,dns',
        ], [
            'nama.required'     => 'Nama Wajib Diisi !',
            'nama.string'       => 'Nama Hanya Berisi Huruf',
            'noHP.required'     => 'No. HP Wajib Diisi !',
            'noHP.regex'        => 'Harap Mengisi Format No. HP Dengan Benar !',
            'noHP.min'          => 'No. HP Minimal 12 Digit Nomor !',
            'email.required'    => 'Email Wajib Diisi !',
            'email.email'       => 'Harap Mengisi Email Dengan Benar !',
        ]);

        $id = dec($id);
        $user = User::where('id', $id);
        $report = Report::where('userID', $id);

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

        return redirect(route('admin.users'))->with('berhasil', 'Data berhasil diubah !');
    }

    public function deleteUsers($id)
    {
        if (User::destroy($id)) {
            return redirect(route('admin.users'))->with('berhasil', 'Data berhasil dihapus !');
        }

        return redirect(route('admin.users'))->with('gagal', 'Data gagal dihapus !');
    }

    // public function register(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'nama'      => 'required|string',
    //         'noHP'      => 'required|numeric',
    //         'email'     => 'required|email',
    //         'password'  => 'required',
    //     ], [
    //         'nama.required'     => 'Nama Wajib Diisi !',
    //         'nama.string'       => 'Nama Hanya Berisi Huruf',
    //         'noHP.required'     => 'No. HP Wajib Diisi !',
    //         'noHP.numeric'      => 'No. HP Hanya Berisi Angka',
    //         'email.required'    => 'Email Wajib Diisi !',
    //         'email.email'       => 'Harap Mengisi Email Dengan Benar !',
    //         'password.required' => 'Password Wajib Diisi !',
    //     ]);
    //     if ($validator->fails()) {
    //         return redirect('admin/dashboard')->withErrors($validator);
    //     }

    //     $user = new User;
    //     $user->nama = ucwords(strtolower($request->nama));
    //     $user->email = strtolower($request->email);
    //     $user->noHP = $request->noHP;
    //     $user->password = Hash::make($request->password);
    //     $user->isAdmin  = 1;
    //     $user->email_verified_at = \Carbon\Carbon::now();
    //     $user->remember_token = Str::random(10);

    //     if ($user->save()) {
    //         return redirect(route('admin.dashboard'))->with('berhasil', 'Pendaftaran Berhasil !');
    //     }

    //     return redirect(route('admin.dashboard'))->with('gagal', 'Pendaftaran Gagal !');
    // }
}
