<!DOCTYPE html>
<html lang="en">

<head>
    @include('layout.head', ['title' => 'Mulai Tes'])
    <!--  Custom Radio's CSS -->
    <link rel="stylesheet" href="{{ asset('css/custom-radio.css') }}" />

    <!--  Swiper's CSS -->
    <link rel="stylesheet" href="{{ asset('css/swiper-bundle.min.css') }}" />
    <style>
        /* .container{
            width: min(100%, 50px);
        } */

        .swiper {
            height: 50%;
        }

        .swiper-container .swiper-slide {
            height: 100%;
            background: #fff;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    <div class="flex items-center justify-center">
        <div class="container">
            @csrf
            <form action="{{ route('result') }}" method="post">
                @csrf
                <div class="w-full mb-8 mt-5 overflow-hidden ">
                    <div class="w-full overflow-x-auto">
                        <div class="swiper swiper-container mySwiper">
                            <div class="swiper-wrapper">
                                {{-- <div class="flex h-screen items-center">
                                    <a href="{{ route('home') }}"
                                        class="transform transition duration-500 hover:scale-105 hover:-translate-y-1 bg-blue-600 hover:scale-11 hover:bg-blue-800 text-white py-3 px-6 rounded-md">
                                        ↩️ Kembali
                                    </a>
                                </div> --}}
                                @php
                                    $begin = 0;
                                    $no = 1;
                                @endphp
                                @for ($i = 0; $i < count($questions) / 5; $i++)
                                    <div class="swiper-slide">
                                        @foreach ($questions->slice($begin, 5) as $question)
                                            <div class="flex justify-center my-4 w-full cursor-pointer">
                                                <div class="flex-row w-2/4">
                                                    <p class="my-5">
                                                        {{ $no++ }}. {{ $question->pernyataan }}
                                                    </p>
                                                    <label for="" style="color: #00bf4c">Sangat Setuju</label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}"
                                                            id="{{ $question->type }}" value="5{{ $question->type }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}"
                                                            id="{{ $question->type }}" value="4{{ $question->type }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}"
                                                            id="{{ $question->type }}" value="3{{ $question->type }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}"
                                                            id="{{ $question->type }}" value="2{{ $question->type }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}"
                                                            id="{{ $question->type }}" value="1{{ $question->type }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label for="" style="color: #bf0d00" class="ml-3">Sangat
                                                        Tidak Setuju</label>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    @php
                                        $begin += 5;
                                    @endphp
                                @endfor
                                <div class="swiper-slide">
                                    <div class="flex justify-center h-screen items-center">
                                        <a href="{{ route('home') }}"
                                            class="transform transition duration-500 hover:scale-105 hover:-translate-y-1 bg-blue-600 hover:scale-11 hover:bg-blue-800 text-white py-3 px-6 rounded-md">
                                            ↩️ Kembali
                                        </a>
                                        <input type="submit"
                                            class="ml-5 transform transition duration-500 hover:scale-105 hover:-translate-y-1 bg-green-600 hover:scale-11 hover:bg-green-800 text-white py-3 px-6 rounded-md"
                                            value="📝 Lihat Hasil">
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </form>
            {{-- <footer class="footer bg-white relative border-b-2 border-indigo-700">
                <div class="container mx-auto">
                    <div class="mt-16 border-t-2 border-gray-300 flex flex-col items-center">
                        <div class="sm:w-2/3 text-center py-6">
                            <p class="text-sm text-indigo-700 font-bold mb-2">
                                © {{ date('Y') }} by TI UIN Walisongo
                            </p>
                        </div>
                    </div>
                </div>
            </footer> --}}
        </div>
        <!-- Swiper JS -->
        <script src="{{ asset('js/swiper-bundle.min.js') }}"></script>
        <script>
            var swiper = new Swiper('.mySwiper', {
                pagination: {
                    el: ".swiper-pagination",
                    type: "progressbar",
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        </script>
        @if (session('info'))
            <script>
                $(function() {
                    Swal.fire({
                        icon: 'info',
                        title: '{{ session('info') }}',
                        showConfirmButton: false,
                        timerProgressBar: true,
                        timer: 2000
                    })
                });
            </script>
        @endif
</body>

</html>
