<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" ang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    @include('layout.head', ['title' => 'Dashboard Admin'])
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
                        Halo, {{ explode(' ', Auth::user()->nama )[0] ?? '' }} !
                    </h2>
                    <!-- Cards -->
                    <div class="grid gap-3 mb-8 md:grid-cols-2 xl:grid-cols-3">
                        <!-- Card -->
                        <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                            <div class="p-3 mr-4 text-green-500 dark:text-green-300">
                                <i class="material-icons">assignment</i>
                            </div>
                            <div>
                                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                                    Total Laporan Hasil
                                </p>
                                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                                    {{$reportCount}}
                                </p>
                            </div>
                        </div>
                        <!-- Card -->
                        <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                            <div class="p-3 mr-4 text-green-500 dark:text-green-300">
                                <i class="material-icons">quiz</i>
                            </div>
                            <div>
                                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                                    Total Pertanyaan
                                </p>
                                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                                    {{$questionCount}}
                                </p>

                            </div>
                        </div>
                        <!-- Card -->
                        <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                            <div class="p-3 mr-4 text-orange-500 dark:text-orange-300">
                                <i class="material-icons">group</i>
                            </div>
                            <div>
                                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                                    Total Akun Penjawab
                                </p>
                                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                                    {{$userCount}}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    @include('components.alert-berhasil-gagal')
</body>

</html>
