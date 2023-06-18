<?php

use App\Models\Question;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;

function pagination($arrColumn, $link)
{
    $arr_column = [];
    $arr_column[] = ['data' => 'DT_RowIndex', 'class' => '', 'orderable' => false, 'searchable' => false];

    foreach ($arrColumn as $column => $class) {
        if (is_numeric($column)) {
            $column = $class;
        }

        $arr_column[] = ['data' => $column, 'class' => $class, 'orderable' => strpos($class, 'orderable-false') !== false ? false : true, 'searchable' => strpos($class, 'searchable-false') !== false ? false : true];
    }
?>
    <script>
        $(function() {
            var otable = $('#datatables').DataTable({
                processing: true,
                serverSide: true,
                lengthMenu: [10, 20, 50, 100],
                "language": {
                    processing: '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>'
                },
                "searching": true,
                columns: <?php echo json_encode($arr_column); ?>,
                sDom: "f" + "l" + "t" + "<'dt-toolbar-footer row'<'col-xs-12 col-sm-12'p>>",
            });

            $("#datatables thead th input[type=text]").on('keyup', function(e) {
                var v = $(this).val();

                if (e.keyCode == 13 || v == "") {
                    otable
                        .column($(this).parent().index() + ':visible')
                        .search(this.value)
                        .draw();
                }
            });

            $("#datatables thead th select").on('change', function() {
                otable
                    .column($(this).parent().index() + ':visible')
                    .search(this.value)
                    .draw();
            });
        });
    </script>
<?php
}

function enc($val)
{
    return Crypt::encrypt($val);
}

function dec($val)
{
    return Crypt::decrypt($val);
}

function totalSoal($kepribadian)
{
    return Question::where('type', Str::upper($kepribadian))->count('type') ?? '1';
}

function itunganSoal($nilai)
{
    $P = 0;
    $I = 0;
    $J = 0;
    $E = 0;
    $T = 0;
    $N = 0;
    $S = 0;
    $F = 0;
    $huruf = substr(Str::upper($nilai), 1, 2);
    $angka = substr(Str::upper($nilai), 0, 1);

    if ($huruf == 'P') {
        return $P += $angka;
    }
    if ($huruf == 'I') {
        return $I += $angka;
    }
    if ($huruf == 'J') {
        return $J += $angka;
    }
    if ($huruf == 'E') {
        return $E += $angka;
    }
    if ($huruf == 'T') {
        return $T += $angka;
    }
    if ($huruf == 'N') {
        return $N += $angka;
    }
    if ($huruf == 'S') {
        return $S += $angka;
    }
    if ($huruf == 'F') {
        return $F += $angka;
    }
}

?>
