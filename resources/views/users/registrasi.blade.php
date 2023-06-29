<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">


<head>
    @include('layout.head', ['title' => 'Daftar Pengguna'])

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
                <div class="mx-8 mb-10 grid grid-cols-2 gap-x-8 gap-y-6 sm:grid-cols-4">
                    <div class="col-span-2 sm:col-span-4">
                        <label for="nama" class="block text-sm font-medium leading-6 text-gray-900">Nama</label>
                        <div class="mt-2">
                            <input type="text" name="nama" id="nama" autocomplete="off"
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="Masukkan nama" value="{{ old('nama') }}" required>
                            @error('nama')
                                <span class="mt-2 text-red-600 text-sm" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    <div class="col-span-2 sm:col-span-4">
                        <label for="noHP" class="block text-sm font-medium leading-6 text-gray-900">No. HP /
                            WA</label>
                        <div class="mt-2">
                            <input type="text" name="noHP" id="noHP" autocomplete="family-name"
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="Cth: 08123456789" value="{{ old('noHP') }}" min="12" required>
                            @error('noHP')
                                <span class="mt-2 text-red-600 text-sm" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    <div class="col-span-2 sm:col-span-4">
                        <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email</label>
                        <div class="mt-2">
                            <input type="text" name="email" id="email" autocomplete="off"
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="Masukkan email" value="{{ old('email') }}" required>
                            @error('email')
                                <span class="mt-2 text-red-600 text-sm" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>

                    <div class="col-span-2 sm:col-span-4">
                        <label for="password" class="block text-sm font-medium leading-6 text-gray-900">
                            Password
                        </label>
                        <div class="mt-2">
                            <input type="password" name="password" id="password" autocomplete="family-name"
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="Masukkan password" required>
                            @error('password')
                                <span class="mt-2 text-red-600 text-sm" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                </div>

                <button type="submit" class="w-1/2 sm:w-3/4 px-3 py-2 mx-28 text-sm font-medium leading-5 text-center text-white shadow-sm transition-colors duration-150 bg-green-500 border border-transparent rounded-lg active:bg-green-500 hover:bg-green-400 focus:outline-none focus:shadow-outline-green">
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
