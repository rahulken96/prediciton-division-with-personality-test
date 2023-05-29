<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Models\Report;
use Illuminate\Http\Request;

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
        return view('users.dashboard', ['questions' => $question]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request;
        $array = array_count_values($request->all());
        $P = $array['P'] / 15 * 100;
        $I = $array['I'] / 15 * 100;
        $J = $array['J'] / 15 * 100;
        $T = $array['T'] / 15 * 100;
        $E = $array['E'] / 15 * 100;
        $N = $array['N'] / 15 * 100;
        $S = $array['S'] / 15 * 100;
        $F = $array['F'] / 15 * 100;
        $satu = $I > $E ? "I" : "E";
        $dua = $S > $N ? "S" : "N";
        $tiga = $T > $F ? "T" : "F";
        $empat = $J > $P ? "J" : "P";
        $hasil = $satu . $dua . $tiga . $empat;

        /* Proses Inisiasi Data */
        $reports = new Report();
        $nama = auth()->user()->name;
        $email = auth()->user()->email;

        $reports->nama  = $nama;
        $reports->email = $email;
        $reports->P     = $P;
        $reports->I     = $I;
        $reports->J     = $J;
        $reports->T     = $T;
        $reports->E     = $E;
        $reports->N     = $N;
        $reports->S     = $S;
        $reports->F     = $F;
        $reports->result = $hasil;
        /* Selesai, setelah itu pengecekan data untuk disimpan */

        if ($reports->save()) {
            return view('mbti.'.$hasil.'', [
                'nama' => $nama,
                'hasil' => $hasil,
                'P' => $P,
                'I' => $I,
                'J' => $J,
                'T' => $T,
                'E' => $E,
                'N' => $N,
                'S' => $S,
                'F' => $F
            ]);
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
