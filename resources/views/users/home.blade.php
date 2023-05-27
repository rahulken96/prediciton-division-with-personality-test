<!DOCTYPE html>
<html lang="en">

<head>
    @include('layout.head', ['title' => 'Home'])
    <style>
        html {
            scroll-behavior: smooth;
        }

    </style>
</head>

<body class="w-full">
    <div class="w-full text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800">
        <div x-data="{ open: false }"
            class="flex flex-col max-w-screen-xl px-4 mx-auto md:items-center md:justify-between md:flex-row md:px-6 lg:px-8    ">
            <div class="p-4 flex flex-row items-center justify-between">
                <a href="/"
                    class="text-lg font-semibold tracking-widest text-gray-900 rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">MBTI<span
                        class="ml-2" style="color: #00BFA6">Test</span></a>
                <button class="md:hidden rounded-lg focus:outline-none focus:shadow-outline" @click="open = !open">
                    <svg fill="currentColor" viewBox="0 0 20 20" class="w-6 h-6">
                        <path x-show="!open" fill-rule="evenodd"
                            d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM9 15a1 1 0 011-1h6a1 1 0 110 2h-6a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                        <path x-show="open" fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <nav :class="{'flex': open, 'hidden': !open}"
                class="flex-col flex-grow pb-4 md:pb-0 hidden md:flex md:justify-end md:flex-row ">
                <a class="px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline"
                    href="#mbti">Apa itu MBTI</a>
                <a class="px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline"
                    href="#panduan">Panduan</a>
                @if (Auth::check())
                    <a class="px-4 py-2 text-sm font-semibold bg-transparent rounded-lg border-2 bg-green-400 md:mt-0 md:ml-4 active:bg-green-600 hover:bg-green-400 hover:text-white transform hover:scale-110 hover:border-green-50 transition duration-400"
                        href="{{ route('logout') }}">Logout</a>
                @endif
            </nav>
        </div>
    </div>
    <div class="flex bg-white max-w-screen-xl h-screen">
        <div class="flex items-center text-center lg:text-left px-5 md:px-20 lg:w-1/2">
            <div>
                <h1 class="py-5 text-5xl font-semibold text-gray-800 md:text-6xl">MBTI<span
                        class="ml-2" style="color: #00BFA6">Test</span></h1>

                <p class="mt-2 text-sm text-gray-500 md:text-lg"><strong>MBTI
                        Test</strong> ini bertujuan untuk menemukan diri dalam 16 tipe kepribadian MBTI.
                    Kenali lebih jauh dirimu untuk berkembang setidaknya satu persen setiap harinya!</p>
                <div class="flex space-x-3 justify-center lg:justify-start mt-6">
                    <a href="{{ route('test') }}" class="px-4 py-2 text-sm font-semibold text-green-400 border-2 border-green-400 rounded-lg active:bg-green-600 hover:bg-green-700 hover:text-white transform hover:scale-110 hover:border-green-50 transition duration-500">
                        Mulai Test
                    </a>
                </div>
            </div>
        </div>
        <div class="hidden lg:block lg:w-1/2">
            <img src="{{ asset('images/undraw_Online_test_re_kyfx.png') }}"
                x-transition:enter="transition duration-500 ease-in-out" style="margin-left: 10rem">
        </div>
    </div>
    <div class="min-h-screen flex justify-center items-center" id="mbti">
        <div class="container mx-auto p-10">
            <h1 class="text-4xl font-bold from-current mb-1">Apa itu <span style="color: #00BFA6"><i>Myers-Briggs Type Indicator</i></span> (MBTI) Test ?</h1>
            <section class="text-gray-600 body-font">
                <div class="container px-5 py-10 mx-auto">
                    <div class="flex flex-wrap -m-4">
                        <p class="text-2md">Tes MBTI adalah sebuah uji kepribadian yang pertama kali diperkenalkan oleh <strong> Katharine Cook Briggs </strong> dan anaknya, <strong> Isabel Briggs Myers </strong> pada 1942.
                            <br> Melalui tes MBTI, kamu bisa mengetahui bahwa kepribadian ada lebih banyak dari itu.
                            <br> Tes MBTI membagi kepribadian seseorang berdasarkan beberapa dikotomi kategori, yaitu :
                            <br>
                            <strong> Introversion (I) </strong> vs <strong> Extraversion (E) </strong>,
                            <br><strong> Intuitive (N) </strong> vs <strong> Sensory (S) </strong>,
                            <br><strong> Thinking (T) </strong> vs <strong> Feeling (F) </strong>,
                            <br><strong> Judging (J) </strong> vs <strong> Perceiving (P) </strong>.
                            <br><br> Dari kombinasi 8 kategori tersebut, dihasilkan 16 tipe kepribadian yang bisa dimiliki oleh setiap orang.
                            <br> Dengan berbagai tipe kepribadian itu, banyak perusahaan dan lembaga yang menjadikan tes MBTI sebagai salah satu tahap rekrutmennya.
                        </p>
                        <p class="italic mt-2">sumber : <a
                                href="https://glints.com/id/lowongan/tes-mbti-adalah/"
                                target="_blank" rel="noopener noreferrer">https://glints.com/id/lowongan/tes-mbti-adalah/</a></p>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <div class="min-h-screen flex justify-center items-center" id="panduan">
        <div class="container mx-auto p-10">
            <h1 class="text-4xl font-bold from-current mb-8">Panduan</h1>
            <section class="text-gray-600 body-font">
                <div class="container px-5 py-10 mx-auto">
                    <div class="flex flex-wrap -m-4">
                        <div
                            class="shadow-md py-3 px-5 rounded-md mb-3 hover:shadow-xl transform transition duration-500 hover:scale-105 border-2 border-green-400 hover:bg-green-600 hover:text-white hover:border-green-50">
                            1. Isilah setiap pertanyaan sesuai kepribadianmu dengan jujur. Karena setiap jawaban dapat
                            diterima dan tidak ada jawaban yang salah. </div>
                        <div
                            class="shadow-md py-3 px-5 rounded-md mb-3 hover:shadow-xl transform transition duration-500 hover:scale-105 border-2 border-green-400 hover:bg-green-600 hover:text-white hover:border-green-50">
                            2. Jawablah dengan santai karena tes kepribadian ini tidak dibatasi waktu. </div>
                        <div
                            class="shadow-md py-3 px-5 rounded-md mb-3 hover:shadow-xl transform transition duration-500 hover:scale-105 border-2 border-green-400 hover:bg-green-600 hover:text-white hover:border-green-50">
                            3. Kerjakan tes kepribadian ini ditempat yang nyaman dan kondusif agar kamu dapat menjawab
                            setiap pertanyaan dengan fokus</div>
                        <div
                            class="shadow-md py-3 px-5 rounded-md mb-3 hover:shadow-xl transform transition duration-500 hover:scale-105 border-2 border-green-400 hover:bg-green-600 hover:text-white hover:border-green-50">
                            4. Apabila kamu berhenti di tengah-tengah tes, maka jawaban selama proses tes akan hilang.
                        </div>
                        <div
                            class="shadow-md py-3 px-5 rounded-md mb-3 hover:shadow-xl transform transition duration-500 hover:scale-105 border-2 border-green-400 hover:bg-green-600 hover:text-white hover:border-green-50">
                            5. Setelah kamu selesai mengisi semua pertanyaan, kamu dapat mengetahui hasil tes
                            kepribadian ini .</div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <footer class="footer bg-white relative pt-1 border-b-2 border-green-700">
        <div class="container mx-auto">
            <div class="mt-16 border-t-2 border-gray-300 flex flex-col items-center">
                <div class="sm:w-2/3 text-center py-6">
                    <p class="text-sm text-green-700 font-bold mb-2">
                        © {{ date('Y') }} by TI UIN Walisongo
                    </p>
                </div>
            </div>
        </div>
    </footer>
    @if (session('berhasil'))
        <script>
            $(function() {
                Swal.fire({
                    icon: 'success',
                    title: '{{ session('berhasil') }}',
                    showConfirmButton: false,
                    timerProgressBar: true,
                    timer: 2000
                })
            });
        </script>
    @endif
</body>

</html>
