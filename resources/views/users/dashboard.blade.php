<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" ang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    @include('layout.head', ['title' => 'Dashboard Pengguna'])
    <link href="{{ asset('css/tailwind.output.css') }}" rel="stylesheet">
    <link href="{{ asset('css/cdn.datatables.net_1.13.4_css_jquery.dataTables.min.css') }}" rel="stylesheet">

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        @include('layout.sidebar')
        <div class="flex flex-col flex-1 w-full">
            @include('layout.navbar')
            <main class="h-full overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Halo, {{ explode(' ', Auth::user()->nama)[0] ?? '' }} !
                    </h2>
                    <!-- Cards -->
                    <div class="grid gap-3 mb-8 md:grid-cols-3 xl:grid-cols-3 border-b border-gray-900/10 pb-10">
                        <!-- Card -->
                        <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                            <div class="p-3 mr-4 text-green-500 dark:text-green-300">
                                <i class="material-icons">assignment</i>
                            </div>
                            <div>
                                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                                    Total Hasil Jawab
                                </p>
                                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                                    {{ $reportCount }}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="w-full overflow-x-auto">
                        <table class="table table-bordered" id="datatables">
                            <thead>
                                <tr>
                                    <th width="5%">No</th>
                                    <th width="25%">MBTI</th>
                                    <th width="25%">Tanggal Tes</th>
                                    <th width="25%">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="{{ asset('js/jquery.dataTables.min.js') }}"></script>
    @php
        $arrColumn = [
            'result' => '',
            'created_at' => '',
            'action' => 'orderable-false searchable-false',
        ];

        pagination($arrColumn, url('/pengguna/dashboard'));
    @endphp
    @include('components.alert-berhasil-gagal')
</body>

</html>
