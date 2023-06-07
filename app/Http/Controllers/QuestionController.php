<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Models\Report;
use App\Models\Result;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class QuestionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('login');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jmlOrang = Report::distinct('nama')->count('nama');
        return view('users.home', compact('jmlOrang'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (auth()->user()->isAdmin == 1) {
            return redirect()->back()->with('gagal', 'Harap Mengganti Akun Terlebih Dahulu !');
        }

        $question = Question::all();
        return view('users.quiz', ['questions' => $question]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request = Arr::except($request->all(), '_token');
        $P = 0;
        $I = 0;
        $J = 0;
        $E = 0;
        $T = 0;
        $N = 0;
        $S = 0;
        $F = 0;

        /* Proses Hitung Data */
        foreach ($request as $value) {
            $huruf = substr(Str::upper($value), 1, 2);
            $angka = substr(Str::upper($value), 0, 1);

            if ($huruf == 'P') {
                $P += $angka;
            }
            if ($huruf == 'I') {
                $I += $angka;
            }
            if ($huruf == 'J') {
                $J += $angka;
            }
            if ($huruf == 'E') {
                $E += $angka;
            }
            if ($huruf == 'T') {
                $T += $angka;
            }
            if ($huruf == 'N') {
                $N += $angka;
            }
            if ($huruf == 'S') {
                $S += $angka;
            }
            if ($huruf == 'F') {
                $F += $angka;
            }
        }

        $P = (($P / (totalSoal('P') * 5)) * 100) ?? 0;
        $I = (($I / (totalSoal('I') * 5)) * 100) ?? 0;
        $J = (($J / (totalSoal('J') * 5)) * 100) ?? 0;
        $E = (($E / (totalSoal('E') * 5)) * 100) ?? 0;
        $T = (($T / (totalSoal('T') * 5)) * 100) ?? 0;
        $N = (($N / (totalSoal('N') * 5)) * 100) ?? 0;
        $S = (($S / (totalSoal('S') * 5)) * 100) ?? 0;
        $F = (($F / (totalSoal('F') * 5)) * 100) ?? 0;

        $satu = $I > $E ? "I" : "E";
        $dua = $N > $S ? "N" : "S";
        $tiga = $T > $F ? "T" : "F";
        $empat = $J > $P ? "J" : "P";
        $hasil = $satu . $dua . $tiga . $empat;
        /* Selesai Proses */

        /* Proses Inisiasi Data */
        $reports = new Report();
        $nama = auth()->user()->name;
        $email = auth()->user()->email;

        $reports->nama  = (!empty($nama) || $nama != null ? $nama : '?');
        $reports->email = (!empty($email) || $email != null ? $email : '?');
        $reports->P     = $P;
        $reports->I     = $I;
        $reports->J     = $J;
        $reports->E     = $E;
        $reports->T     = $T;
        $reports->N     = $N;
        $reports->S     = $S;
        $reports->F     = $F;
        $reports->result = $hasil;

        $penjelasan = Result::where('mbti', $hasil)->first();
        $data = [
            'nama'       => $nama,
            'email'      => $email,
            'hasil'      => $hasil,
            'penjelasan' => $penjelasan,
            'P'          => $P,
            'I'          => $I,
            'J'          => $J,
            'T'          => $T,
            'E'          => $E,
            'N'          => $N,
            'S'          => $S,
            'F'          => $F
        ];

        /* Selesai, setelah itu pengecekan data untuk disimpan */
        if ($reports->save()) {
            return view('mbti.hasil', $data);
        }

        return redirect(route('home'))->with('gagal', 'Harap Mengganti Akun Terlebih Dahulu !');
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
}
