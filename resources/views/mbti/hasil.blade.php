<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <head>
        @include('layout.head', ['title' => 'Hasil Test'])
        <style>
            @media print {
                @page {
                    margin-top: 0;
                    margin-bottom: 0;
                }

                body {
                    -webkit-print-color-adjust: exact;
                    padding-top: 72px;
                    padding-bottom: 72px;
                }

                #printbtn{
                    display: none !important;
                }

            }
        </style>
    </head>
</head>

<body>
    <div class="container w-full mx-auto">
        <p class="text-center text-2xl font-bold mt-10 text-indigo-900">HASIL TEST MBTI - MBTI TEST</p>
        <p class="mt-10 text-lg text-indigo-900">Nama : {{ $nama ?? '?' }}</p>
        <p class="text-lg text-indigo-900">Email : {{ $email ?? '@?' }}</p>
        <p class="mt-3 text-lg text-indigo-900">Tipe Kepribadian : {{ $hasil ?? '' }}</p>
        <table class="border-2 w-full mt-3 mb-5">
            <tr>
                <th class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">No</th>
                <th class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">Simbol</th>
                <th class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">Skor</th>
            </tr>
            <tbody>
                <tr class="mx-20">
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">1</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">(P) Perceivers</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">{{ round($P) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">2</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">(I) Inroverts</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">{{ round($I) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">3</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">(J) Judgers</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">{{ round($J) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">4</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">(T) Thinkers</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">{{ round($T) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">5</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">(E) Extroverts</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">{{ round($E) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">6</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">(N) Intuitives</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">{{ round($N) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">7</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">(S) Sensors</td>
                    <td class="text-center border-2 border-indigo-400 p-2 text-indigo-900">{{ round($S) ?? '0' }}%</td>
                </tr>
                <tr>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">8</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">(F) Feelers</td>
                    <td class="text-center border-2 border-indigo-400 p-2 bg-indigo-500 text-white">{{ round($F) ?? '0' }}%</td>
                </tr>
            </tbody>
        </table>
        <p class="text-indigo-900"><b>Penjelasan</b> : </p>
        <div class="bg-purple-300 py-3 px-4 italic text-justify my-3">
            <blockquote>{{ $penjelasan['penjelasan'] ?? 'NULL' }}</blockquote>
        </div>
        <p class="text-indigo-900"><b>Profesi</b> : {{ $penjelasan['profesi'] ?? 'NULL' }}</p>
        <p class="text-indigo-900"><b>Partner</b> : {{ $penjelasan['partner'] ?? 'NULL' }}</p>
        <p class="text-indigo-900"><b>Tokoh Terkenal</b> : {{ $penjelasan['tokoh_terkenal'] ?? 'NULL' }}</p>
        <p class="text-indigo-900"><b>Sumber : </b><a class="italic" href="https://campuspedia.id/news/mengenal-16-tipe-kepribadian-mbti-lebih-dalam-part-1/" target="_blank" rel="noopener noreferrer">campuspedia.id</a></p>
        <div class="text-right text-indigo-900 mt-20">
            <p class="pb-16">{{ now()->format('d M Y') }}</p>
            <p>{{ $nama ?? '?' }}</p>
            <p>{{ $email ?? '@?' }}</p>
        </div>
        <div class="flex justify-center mb-20">
            <input id="backbtn" onclick="window.location='{{ route('test') }}';" class="ml-5 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="button" value="Kembali ↩️">
            <input id="printbtn" onclick="window.print();" class="ml-5 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" type="button" value="Cetak 🖨️">
        </div>
    </div>
</body>

</html>
