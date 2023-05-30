<!DOCTYPE html>
<html lang="en">

<head>
    @include('layout.head', ['title' => 'Mulai Test'])
    <!--  Swiper's CSS -->
    <link rel="stylesheet" href="{{ asset('css/swiper-bundle.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/custom-radio.css') }}" />
</head>

<body>
    <div class="flex items-center justify-center">
        <div class="container">
            @csrf
            <form action="{{ route('result') }}" method="post">
                @csrf
                <div class="w-full mb-8 mt-5 overflow-hidden ">
                    <div class="w-full overflow-x-auto">
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="flex justify-center w-full h-screen items-center">
                                        <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mr-4 rounded"
                                            href="{{ route('home') }}">Kembali</a>
                                    </div>
                                </div>
                                @php
                                    $begin = 0;
                                    $no = 1;
                                @endphp
                                @for ($i = 0; $i < count($questions) / 3; $i++)
                                    <div class="swiper-slide">
                                        @foreach ($questions->slice($begin, 3) as $question)
                                            <div class="flex justify-center my-4 w-full cursor-pointer">
                                                <div class="flex-row w-1/2">
                                                    <p class="my-3">
                                                        {{ $no++ }}.{{ $question->pertanyaan }}
                                                    </p>
                                                    <label for="" style="color: #00bf4c">Sangat Setuju</label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}" id="{{ $question->type_satu }}" value="5{{ $question->type_satu }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}" id="{{ $question->type_satu }}" value="4{{ $question->type_satu }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}" id="{{ $question->type_satu }}" value="3{{ $question->type_satu }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}" id="{{ $question->type_satu }}" value="2{{ $question->type_satu }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="custom-radio-btn">
                                                        <input type="radio" name="{{ $question->id }}" id="{{ $question->type_satu }}" value="1{{ $question->type_satu }}">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label for="" style="color: #bf0d00" class="ml-3">Sangat Tidak Setuju</label>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    @php
                                        $begin += 3;
                                    @endphp
                                @endfor
                                <div class="swiper-slide">
                                    <div class="flex justify-center h-screen items-center">
                                        <input type="submit" class="transform transition duration-500 hover:scale-105 hover:-translate-y-1 bg-indigo-600 hover:scale-11 hover:bg-indigo-800 text-white py-3 px-6 rounded-md"
                                            value="Lihat hasil">
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </form>
            <footer class="footer bg-white relative border-b-2 border-indigo-700">
                <div class="container mx-auto">
                    <div class="mt-16 border-t-2 border-gray-300 flex flex-col items-center">
                        <div class="sm:w-2/3 text-center py-6">
                            <p class="text-sm text-indigo-700 font-bold mb-2">
                                © {{ date('Y') }} by TI UIN Walisongo
                            </p>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <!-- Swiper JS -->
        <script src="{{ asset('js/swiper-bundle.min.js') }}"></script>
        <script>
            var swiper = new Swiper('.mySwiper', {
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        </script>
</body>

</html>
