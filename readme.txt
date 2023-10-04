Halo Semua !!, Aplikasi ini menggunakan 2 framework yang berbeda yaitu (Laravel dan Flask),
maka dari itu kita perlu menjalankan 2 framework tersebut secara bersamaan.
Berikut saya akan memberikan cara menggunakan aplikasi Ini :

[1.] Buatlah file .env dan sesuaikan dengan environment database yang akan digunakan pada Laravel, contoh (Mysql) :


    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=laravel
    DB_USERNAME=root
    DB_PASSWORD=

    *Tambahkan pula "URL_API_FLASK=localhost:8005" dipaling atas file .env nya*

[2.] Setup juga untuk environtment database pada Flask, terletak pada folder venv/main.py

    # ambil data dari db
    host = "localhost"
    database = "mbti_v1"
    username = "root"
    password = ""

[3.] Aktifkan terlebih dahulu Virtual Environment Python nya, dengan cara buka "Terminal -> Terminal yang jenis CMD jangan powerchell",
lalu ketikkan diterminal tersebut dengan cara "venv\Scripts\active". Jika berhasil aktif akan muncul
tulisan (venv) didepan url project seperti dibawah ini:

    "(venv) D:\{nama_komputer}\{folder}\project\prediciton-division-with-personality-test>"

[4.] Setelah itu, jalankan Flask nya dengan perintah "python venv\main.py", tunggu hingga muncul notifikasi
di terminal sebagai berikut :

    * Serving Flask app 'main'
    * Debug mode: on
    WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
    * Running on http://127.0.0.1:8005
    Press CTRL+C to quit
    * Restarting with stat
    * Debugger is active!
    * Debugger PIN: 142-162-649

 Jika berhasil, bukalah url "http://127.0.0.1:8005" di dalam browser dan lihat akan muncul tulisan
    " Terhubung dengan Venv Flask di Laravel. YEAYYY!! ^_^ "

    *PERINGATAN SELAMA PROSES APAPUN TERMINAL UNTUK MENJALAKAN FLASK JANGAN DIMATIKAN*

[5.] Tahap terakhir adalah tinggal menjalankan Laravel nya, yaitu buka TERMINAL BARU lalu ketikkan perintah:
    "php artisan serve"
maka project laravel pun akan berjalan dengan semestinya..

[6.] Selesai.. Aplikasi siap digunakan....
