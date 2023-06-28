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
@if (session('info'))
    <script>
        $(function() {
            Swal.fire({
                icon: 'info',
                title: '{{ session('info') }}',
                showConfirmButton: false,
                timerProgressBar: true,
                timer: 2000
            })
        });
    </script>
@endif
