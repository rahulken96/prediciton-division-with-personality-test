<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">


<head>
    @include('layout.head', ['title' => 'Masuk Pengguna'])

    <link href="{{ asset('css/tailwind.output.css') }}" rel="stylesheet">
    <style>
        .swal2-popup {
            font-size: 0.85rem !important;
        }
    </style>
</head>

<body>
    <div class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900" style="background-image: url({{ asset('images/bg-15.png') }});" aria-label="Illustrations by IRA Design">
        <div class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800">
            <br><br>
            <div class="flex flex-col overflow-y-auto md:flex-row">
                <div class="h-32 md:h-auto md:w-1/2">
                    <img aria-hidden="true" class="object-cover w-full h-full dark:hidden" src="{{ asset('images/undraw_Login_re_4vu2.png') }}" alt="Office" aria-label="Copyright © 2023 Katerina Limpitsouni"/>
                    <img aria-hidden="true" class="hidden object-cover w-full h-full dark:block" src="{{ asset('images/login-office-dark.jpeg') }}" alt="Office" aria-label="Copyright © 2023 Katerina Limpitsouni" />
                </div>
                <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
                    <div class="w-full">
                        <form action="#" method="post" class="login-form">
                            @csrf
                            <h1 class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200">
                                Masuk
                            </h1>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Email</span>
                                <input type="text"
                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    type="text" name="email" class="form-control" placeholder="Email" />
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Password</span>
                                <input
                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    type="password" name="password" class="form-control" placeholder="Password" />
                            </label>

                            <a href="{{ route('home') }}" type="submit"
                                class="w-36 px-4 py-1 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-blue-500 border border-transparent rounded-lg active:bg-blue-500 hover:bg-blue-400 focus:outline-none focus:shadow-outline-blue">
                                Halaman Utama
                            </a>
                            <button type="submit"
                                class="w-44 px-4 py-1 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-green-500 border border-transparent rounded-lg active:bg-green-500 hover:bg-green-400 focus:outline-none focus:shadow-outline-green">
                                Masuk
                            </button>
                        </form>
                        <p class="mt-3 text-sm">Belum punya akun ? <a class="font-small text-blue-600 dark:text-blue-500 hover:underline" href="{{ route('register') }}">Daftar Disini</a> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    @if (session('gagal'))
        <script>
            $(function() {
                Swal.fire({
                    icon: 'error',
                    title: '{{ session('gagal') }}',
                    showConfirmButton: false,
                    timerProgressBar: true,
                    timer: 2000
                })
            });
        </script>
    @endif
    @if(!Auth::check())
        <script>
            Swal.fire({
                icon: 'warning',
                title: 'Harap Masuk Terlebih Dahulu !',
                showConfirmButton: false,
                timerProgressBar: true,
                toast: true,
                position: 'top-start',
                timer: 2000
            });
        </script>
    @endif
</body>

</html>
