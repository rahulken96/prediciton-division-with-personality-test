<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" ang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    @include('layout.head', ['title' => 'Admin'])
    <link href="{{ asset('css/Chart.min.css') }}" rel="stylesheet">
    <script src="{{ asset('js/Chart.min.js') }}"></script>
    <script src="{{ asset('js/charts-lines.js') }}" defer></script>
    <script src="{{ asset('js/charts-pie.js') }}" defer></script>
    <link href="{{ asset('css/tailwind.output.css') }}" rel="stylesheet">
    {{-- @livewireStyles --}}
</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        @include('layout.sidebar')
        <div class="flex flex-col flex-1 w-full">
            @include('layout.navbar')
            <main class="h-full overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Dashboard
                    </h2>
                    <!-- Cards -->
                    <div class="grid gap-3 mb-8 md:grid-cols-3 xl:grid-cols-3">
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
                    </div>
                    {{-- <div class="w-full overflow-x-auto">
                        <livewire:reports-table searchable="nama, result" />
                    </div> --}}
                </div>
            </main>
        </div>
    </div>
    {{-- @livewireScripts --}}
</body>

</html>
