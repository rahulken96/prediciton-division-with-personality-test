<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <head>
        @include('layout.head', ['title' => 'Print Hasil'])
        <style>
            @media print {
                @page {
                    margin-top: 0;
                    margin-bottom: 0;
                }

                body {
                    -webkit-print-color-adjust: exact;
                }

                #printbtn{
                    display: none !important;
                }

                #backbtn{
                    display: none !important;
                }

            }
        </style>
    </head>
</head>

<body>
    <div class="container w-11/12 mx-auto px-5">
        <p class="text-center text-2xl font-bold mt-10 text-black">Hasil Tes MBTI</p>
        <p class="mt-3 text-lg text-black">Nama : {{ $tes['nama'] ?? '?' }}</p>
        <p class="text-lg text-black">Email : {{ $tes['email'] ?? '@?' }}</p>
        <p class="mt-3 text-lg text-black">Tipe Kepribadian : {{ $tes['result'] ?? '' }}</p>
        <table class="border-2 w-full mt-3 mb-5">
            <tr>
                <th class="text-center border-2 border-cool-gray-500 p-2 text-black">No</th>
                <th class="text-center border-2 border-cool-gray-500 p-2 text-black">Simbol</th>
                <th class="text-center border-2 border-cool-gray-500 p-2 text-black">Skor</th>
            </tr>
            <tbody>
                <tr class="mx-20">
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">1</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(I) Inroverts</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['I']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">2</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(E) Extroverts</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['E']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">3</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(N) Intuitives</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['N']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">4</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(S) Sensors</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['S']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">5</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(T) Thinkers</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['T']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">6</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(F) Feelers</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['F']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">7</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(J) Judgers</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['J']) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">8</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">(P) Perceivers</td>
                    <td class="text-center border-2 border-cool-gray-500 p-2 text-black">{{ round($tes['P']) ?? '0' }}%</td>
                </tr>
            </tbody>
        </table>
        <p class="text-black"><b>Penjelasan</b> : </p>
        <div class="bg-cool-gray-200 py-3 px-4 italic text-justify my-3">
            <blockquote>{{ $ket['penjelasan'] ?? 'NULL' }}</blockquote>
        </div>
        <p class="text-black"><b>Profesi</b> : {{ $ket['profesi'] ?? 'NULL' }}</p>
        <p class="text-black"><b>Partner</b> : {{ $ket['partner'] ?? 'NULL' }}</p>
        <div class="text-right text-black">
            <p class="pb-16">{{ now()->format('d M Y') }}</p>
            <p>{{ $tes['nama'] ?? '?' }}</p>
            <p>{{ $tes['email'] ?? '@?' }}</p>
        </div>
        <div class="flex justify-center mb-20">
            <input id="backbtn" onclick="window.location='{{ url()->previous() }}';" class="ml-5 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="button" value="↩️ Kembali">
            <input id="printbtn" onclick="window.print();" class="ml-5 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" type="button" value="🖨️ Cetak">
        </div>
    </div>
</body>

</html>
