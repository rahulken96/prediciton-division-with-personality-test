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
    <div class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900"
        style="background-image: url({{ asset('images/bg-15.png') }});" aria-label="Illustrations by IRA Design">
        <div class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800">
            <br><br>
            <form action="/daftar" method="post" class="login-form">
                @csrf
                <div class="flex flex-col overflow-y-auto md:flex-row">
                    <div class="flex items-center justify-center p-6 sm:p-6 md:w-1/2">
                        <div class="w-full">
                            <h1 class="mb-2 text-xl font-semibold text-gray-700 dark:text-gray-200">Daftar</h1>
                            @csrf
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Nama</span>
                                <input type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    type="text" name="nama" class="form-control" placeholder="Nama" autocomplete="off" required>
                                @error('nama')
                                    <span class="invalid-feedback text-red-500" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">No HP</span>
                                <input type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    type="text" name="noHP" class="form-control" placeholder="No. HP" autocomplete="off" required>
                                @error('noHP')
                                    <span class="invalid-feedback text-red-500" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </label>
                        </div>
                    </div>
                    <div class="flex items-center justify-center p-6 sm:p-6 md:w-1/2">
                        <div class="w-full">
                            <label class="block mt-12 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Email</span>
                                <input type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    type="text" name="email" class="form-control" placeholder="Email" autocomplete="off" required/>
                                @error('email')
                                    <span class="invalid-feedback text-red-500" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Password</span>
                                <input type="password" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    type="text" name="password" class="form-control" placeholder="Password" required/>
                                @error('password')
                                    <span class="invalid-feedback text-red-500" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </label>
                        </div>
                    </div>
                </div>
                <button type="submit" class="w-3/4 px-2 py-2 mx-28 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-green-500 border border-transparent rounded-lg active:bg-green-500 hover:bg-green-400 focus:outline-none focus:shadow-outline-green">
                    Daftar
                </button>
                <p class="mt-3 p-3 text-sm">Sudah punya akun ? <a class="font-small text-blue-600 dark:text-blue-500 hover:underline" href="{{ route('login') }}">Masuk</a> </p>
            </form>
        </div>
    </div>
    @if (session('gagal'))
        <script>
            $(function() {
                Swal.fire({
                    icon: 'success',
                    title: '{{ session('gagal') }}',
                    showConfirmButton: false,
                    timerProgressBar: true,
                    timer: 2000
                })
            });
        </script>
    @endif
</body>

</html>
