<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" ang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    @include('layout.head', ['title' => 'Admin'])
    <link href="{{ asset('css/tailwind.output.css') }}" rel="stylesheet">
    <link href="{{ asset('css/cdn.datatables.net_1.13.4_css_jquery.dataTables.min.css') }}" rel="stylesheet">
</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        @include('layout.sidebar')
        <div class="flex flex-col flex-1 w-full">
            @include('layout.navbar')
            <main class="h-full overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                        Laporan Hasil Penjawab
                    </h2>
                    <div class="w-full overflow-x-auto">
                        <table class="table table-bordered" id="datatables">
                            <thead>
                                <tr>
                                    <th width="5%">No</th>
                                    <th width="20%">Nama</th>
                                    <th width="20%">Email</th>
                                    <th width="15%">Tipe MBTI</th>
                                    <th width="25%">Tanggal Tes</th>
                                    <th width="15%">Action</th>
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
        'nama' => '',
        'email' => '',
        'result' => '',
        'created_at' => '',
        'action' => 'orderable-false searchable-false',
    ];

    pagination($arrColumn, url('/admin/hasil'));
    @endphp
    @include('components.alert-berhasil-gagal')
</body>
</html>
