<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ResultSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'mbti' => 'ENFJ',
                'penjelasan' => 'Pemimpin yang karismatik dan menginspirasi, mampu memukau pendengarnya. Kreatif, peduli apa kata orang lain, pandai bergaul, menyukai tantangan, dan butuh apresiasi.',
                'profesi' => 'Konsultan, Psikolog, Pengajar, Marketing, Entertainer, Penulis, Motivator',
                'partner' => 'INFP atau ISFP',
                'tokoh_terkenal' => 'Abraham Lincoln, Johnny Depp, Oprah Winfrey, Barack Obama',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ENFP',
                'penjelasan' => 'Semangat yang antusias, kreatif dan bebas bergaul, yang selalu dapat menemukan alasan untuk tersenyum. Ramah, imajinatif, pandai berkomunikasi, dan bisa membaca kebutuhan orang lain.',
                'profesi' => 'Psikolog, Entertainer, Pengajar, Motivator, Presenter, Reporter, MC, Seniman',
                'partner' => 'INTJ atau INFJ',
                'tokoh_terkenal' => 'Bob Dylan, Will Smith, Robin Williams',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ENTJ',
                'penjelasan' => 'Pemimpin yang pemberani, imajinatif, dan berambisi kuat. Selalu menemukan cara atau menciptakan cara melakukan sesuatu.',
                'profesi' => 'Pebisnis, Pengacara, Hakim, Konsultan, Pemimpin Organisasi',
                'partner' => 'INTP atau ISTP',
                'tokoh_terkenal' => 'Aristoteles, Harrison Ford, Franklin D. Roosevelt',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ENTP',
                'penjelasan' => 'Pemikir yang cerdas dan serius yang gatal terhadap tantangan intelektual. Sanggup memecahkan masalah yang menantang. Banyak bicara, fleksibel, dan kurang konsisten.',
                'profesi' => 'Pengacara, Psikolog, Konsultan, Ilmuwan, Aktor, Marketing',
                'partner' => 'INFJ atau INTJ',
                'tokoh_terkenal' => 'Thomas Edison, Walt Disney, Alexander the Great',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ESFJ',
                'penjelasan' => 'Orang yang sangat peduli, sosial dan populer, selalu ingin membantu. Hangat, banyak bicara, membutuhkan keseimbangan, santai, sederhana, teliti, dan rajin merawat apa yang dimiliki.',
                'profesi' => 'Perencana Keuangan, Perawat, Guru, Bidang anak-anak',
                'partner' => 'ISFP atau INFP',
                'tokoh_terkenal' => 'Bill Clinton, Sally Field',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ESFP',
                'penjelasan' => 'Orang yang spontan, bersemangat dan antusias, hidup tidak akan membosankan saat berdekatan dengan mereka. Mudah berteman, ramah, menyenangkan, optimis, ceria, suka menjadi pusat perhatian, menghindari konflik, cepat, dan praktis.',
                'profesi' => 'Entertainer, Seniman, Marketing, Konselor, Desainer, Tour Guide',
                'partner' => 'ISTJ atau ISFJ',
                'tokoh_terkenal' => 'Bill Clinton, Pablo Picasso, Woody Harrelson',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ESTJ',
                'penjelasan' => 'Administrator istimewa, tidak ada duanya dalam mengelola sesuatu atau orang. Praktis, sistematis, disiplin, dan cenderung kaku.',
                'profesi' => 'Militer, Manajer, Polisi, Hakim, Pengacara, Guru, Sales, Auditor, Akuntan',
                'partner' => 'ISTP atau INTP',
                'tokoh_terkenal' => 'George W. Bush, Alec Baldwin',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ESTP',
                'penjelasan' => 'Orang yang cerdas, bersemangat dan sangat tanggap, benar-benar menikmati hidup yang menantang. Spontan, aktif, enerjik, ceplas-ceplos, berkarisma, mudah beradaptasi.',
                'profesi' => 'Marketing, Sales, Polisi, Pebisnis, Pialang Saham',
                'partner' => 'ISFJ atau ISTJ',
                'tokoh_terkenal' => 'Madonna, Donald Trump, Lucille Ball',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'INFJ',
                'penjelasan' => 'Pendiam dan mistis, tetapi idealis yang sangat menginspirasi dan tak kenal lelah. Perhatian, tekun, idealis, visioner. Selalu ingin memahami pola pikir orang lain.',
                'profesi' => 'Pengajar, Psikolog, Dokter, Konselor, Pekerja Sosial, Fotografer, Seniman',
                'partner' => 'ESFP atau ESTP',
                'tokoh_terkenal' => 'Plato, Nelson Mandela, George Harrison(The Beatles), Martin Luther King, Jr.',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'INFP',
                'penjelasan' => 'Orang yang puitis, baik hati dan altruisik, selalu ingin membantu aksi kebaikan. Perhatian dan peka, antusias dan setia, idealis dan perfeksionis, setia kepada prinsip yang digenggam.',
                'profesi' => 'Penulis, Sastrawan, Konselor, Psikolog, Pengajar, Seniman, Pemuka Agama',
                'partner' => 'ENFJ atau ESFJ',
                'tokoh_terkenal' => 'Audrey Hepburn, J. R. R. Tolkien, Putri Diana, William Shakespeare',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'INTJ',
                'penjelasan' => 'Pemikir yang imajinatif dan orisinil. Memiliki motivasi tinggi untuk menjalankan ide-idenya hingga mencapai tujuan. Visioner, mandiri, dan percaya diri, memiliki kemampuan menganalisa yang bagus, skeptis, kritis, logis, dan kadang keras kepala.',
                'profesi' => 'Peneliti, Ilmuan, Insinyur, Teknisi, Hakim, Programmer',
                'partner' => 'ENFP atau ENTP',
                'tokoh_terkenal' => 'John F. Kennedy',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'INTP',
                'penjelasan' => 'Menghargai intelektualitas dan pengetahuan, lebih suka bekerja sendiri, kritis, skeptis, mudah curiga dan pesimis, tidak suka memimpin, dan memiliki minat yang jelas.',
                'profesi' => 'Penulis Buku Teknis, Ahli Forensik, Jaksa, Pengacara, Teknisi',
                'partner' => 'ENTJ atau ESTJ',
                'tokoh_terkenal' => 'Albert Einstein, Charles Darwin, Socrates, J.K. Rowling, C.G. Jung, Sir Isaac Newton',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ISFJ',
                'penjelasan' => 'Pelindung yang sangat berdedikasi dan hangat, selalu siap membela orang yang dicintainya. penuh pertimbangan, serius, ramah, memiliki kemampuan mengorganisasi, detil, dan bisa diandalkan.',
                'profesi' => 'Desainer, Konselor, Penjaga Toko/Perpustakaan, Dunia Perhotelan.',
                'partner' => 'ESFP atau ESTP',
                'tokoh_terkenal' => 'Mother Teresa, Michael Caine, Louisa May Alcott',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ISFP',
                'penjelasan' => 'Seniman yang fleksibel dan mengagumkan, selalu siap menjelajahi dan mengalami hal baru. Berpikiran praktis, menghindari konflik, cenderung tidak mau memimpin, santai.',
                'profesi' => 'Seniman, Desainer, Pekerja Sosial, Psikolog, Guru, Aktor',
                'partner' => 'ESFJ atau ENFJ',
                'tokoh_terkenal' => 'Marilyn Monroe, Barbara Streisand, Paul McCartney, Wolfgang Amadeus Mozart',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ISTJ',
                'penjelasan' => 'Individu yang praktis dan mengutamakan fakta, yang keandalannya tidak dapat diragukan. Serius, senang pada fakta, tekun, pendengar yang baik, memegang aturan.',
                'profesi' => 'Polisi, Hakim, Pengacara, Dokter, Akuntan, Pemimpin Militer',
                'partner' => 'ESFP atau ESTP',
                'tokoh_terkenal' => 'George Washington, Ratu Elizabeth, Henry Ford',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
            [
                'mbti' => 'ISTP',
                'penjelasan' => 'Experimenter yang pemberani dan praktis, menguasai semua jenis alat. Tenang, cenderung kaku, logis, rasional, kritis, percaya diri, pemecah masalah yang baik.',
                'profesi' => 'Polisi, Programmer, Ahli Komputer, Teknisi, Insinyur, Mekanik, Pilot, Atlet',
                'partner' => 'ESTJ atau ENTJ',
                'tokoh_terkenal' => 'Tom Cruise, Clint Eastwood, Keith Richards',
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s'),
            ],
        ];

        DB::table('results')->insert($data);
    }
}
