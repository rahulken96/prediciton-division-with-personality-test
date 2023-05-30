<?php

use App\Models\Question;
use Illuminate\Support\Str;

function totalSoal($kepribadian)
{
    return Question::where('type_satu', Str::upper($kepribadian))->count('type_satu') ?? '0';
}

function itunganSoal($nilai)
{
    $P = 0;
    $I = 0;
    $J = 0;
    $E = 0;
    $T = 0;
    $N = 0;
    $S = 0;
    $F = 0;
    $huruf = substr(Str::upper($nilai),1,2);
    $angka = substr(Str::upper($nilai),0,1);

    if ($huruf == 'P') {
        return $P += $angka;
    }
    if ($huruf == 'I') {
        return $I += $angka;
    }
    if ($huruf == 'J') {
        return $J += $angka;
    }
    if ($huruf == 'E') {
        return $E += $angka;
    }
    if ($huruf == 'T') {
        return $T += $angka;
    }
    if ($huruf == 'N') {
        return $N += $angka;
    }
    if ($huruf == 'S') {
        return $S += $angka;
    }
    if ($huruf == 'F') {
        return $F += $angka;
    }
}

?>
