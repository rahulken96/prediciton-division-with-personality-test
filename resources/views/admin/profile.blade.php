<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" ang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    @include('layout.head', ['title' => 'Profil Admin'])
    <link href="{{ asset('css/tailwind.output.css') }}" rel="stylesheet">
</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        @include('layout.sidebar')
        <div class="flex flex-col flex-1 w-full">
            @include('layout.navbar')
            <main class="h-full overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Profil Pribadi
                    </h2>
                    <form action="{{ route('admin.profile_update') }}" method="post" class="login-form">
                        @csrf
                        @method('PUT')
                        <div class="p-auto">
                            <div class="mt-5 grid grid-cols-2 gap-x-6 gap-y-8 sm:grid-cols-4">
                                <div class="col-span-2 sm:col-span-4">
                                    <label for="nama"
                                        class="block text-sm font-medium leading-6 text-gray-900">Nama</label>
                                    <div class="mt-2">
                                        <input type="text" name="nama" id="nama" autocomplete="off"
                                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                            value="{{ old('nama', $data->nama) }}" placeholder="Masukkan nama">
                                        @error('nama')
                                            <span class="mt-2 text-red-600 text-sm" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-span-2 sm:col-span-4">
                                    <label for="noHP" class="block text-sm font-medium leading-6 text-gray-900">No. HP / WA</label>
                                    <div class="mt-2">
                                        <input type="text" name="noHP" id="noHP" autocomplete="family-name"
                                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                            value="{{ old('noHP', $data->noHP) }}" placeholder="Cth: 08123456789" min="12">
                                        @error('noHP')
                                            <span class="mt-2 text-red-600 text-sm" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-span-2 sm:col-span-4">
                                    <label for="email"
                                        class="block text-sm font-medium leading-6 text-gray-900">Email</label>
                                    <div class="mt-2">
                                        <input type="text" name="email" id="email" autocomplete="off"
                                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                            value="{{ old('email', $data->email) }}" placeholder="Masukkan email">
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
                                            placeholder="Masukkan password">
                                        @error('password')
                                            <span class="mt-2 text-red-600 text-sm" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-10 mb-5 flex items-center justify-start gap-x-6">
                            <button type="submit"
                                class="rounded-md bg-green-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600">Ubah
                                Data</button>
                        </div>
                        <span class="text-red-400 text-xs pb-5" role="alert">
                            <strong>{{ '*Kosongkan password jika tidak ingin diubah.' }} <br> {{ '*Ubah email jika sudah yakin, karena akan mempengaruhi ketika akan masuk /' }} <i>{{ ' login ' }}</i>   {{ 'akun.' }}</strong>
                        </span>
                    </form>
                </div>
            </main>
        </div>
    </div>
    @include('components.alert-berhasil-gagal')
</body>

</html>
