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
            $angka = substr(Str::upper($value), 0, 1);
            $huruf = substr(Str::upper($value), 1, 2);

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

        $P = (($P / (totalSoal('P') * 5)) * 100);
        $I = (($I / (totalSoal('I') * 5)) * 100);
        $J = (($J / (totalSoal('J') * 5)) * 100);
        $E = (($E / (totalSoal('E') * 5)) * 100);
        $T = (($T / (totalSoal('T') * 5)) * 100);
        $N = (($N / (totalSoal('N') * 5)) * 100);
        $S = (($S / (totalSoal('S') * 5)) * 100);
        $F = (($F / (totalSoal('F') * 5)) * 100);

        $I0 = $I;
        $E0 = $E;
        $N0 = $N;
        $S0 = $S;
        $T0 = $T;
        $F0 = $F;
        $J0 = $J;
        $P0 = $P;

        /* I > E */
        if ($I > $E) {
            $E = 100 - round($I);
        } elseif($E > $I) {
            $I = 100 - round($E);
        } else {
            $I = $E;
        }

        /* N > S */
        if ($N > $S) {
            $S = 100 - round($N);
        } elseif($S > $N) {
            $N = 100 - round($S);
        } else {
            $S = $N;
        }

        /* T > F */
        if ($T > $F) {
            $F = 100 - round($T);
        } elseif($F > $T) {
            $T = 100 - round($F);
        } else {
            $F = $T;
        }

        /* J > P */
        if ($J > $P) {
            $P = 100 - round($J);
        } elseif($P > $J) {
            $J = 100 - round($P);
        } else {
            $J = $P;
        }
        /* Selesai Proses */

        /* Implementasi KNN */
        $knn = KNN($I, $E, $N, $S, $T, $F, $J, $P);
        $hasil = $knn['knnPREDICITON'];
        /* End */

        /* Proses Inisiasi Data */
        $reports = new Report();
        $id = auth()->user()->id;
        $nama = auth()->user()->nama;
        $email = auth()->user()->email;

        $reports->nama  = (!empty($nama) || $nama != null ? $nama : '?');
        $reports->email = (!empty($email) || $email != null ? $email : '?');
        $reports->userID = (!empty($id) || $id != null ? $id : 0);
        $reports->P     = $P0;
        $reports->I     = $I0;
        $reports->J     = $J0;
        $reports->E     = $E0;
        $reports->T     = $T0;
        $reports->N     = $N0;
        $reports->S     = $S0;
        $reports->F     = $F0;
        $reports->result = $hasil;

        $penjelasan = Result::where('mbti', $hasil)->first();
        $data = [
            'nama'       => $nama,
            'email'      => $email,
            'hasil'      => $hasil,
            'penjelasan' => $penjelasan,
            'P'          => $P0,
            'I'          => $I0,
            'J'          => $J0,
            'T'          => $T0,
            'E'          => $E0,
            'N'          => $N0,
            'S'          => $S0,
            'F'          => $F0,
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
