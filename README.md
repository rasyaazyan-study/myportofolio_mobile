# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Nama: Rasya Azyan Kautsar

### TUGAS INDIVIDU 7

1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

Widget tree adalah logical representation dari widget yang ada di UI. Widget yang paling atas disebut root, widget yang berada lebih atas ddan membungkus widget lain disebut root, sedangkan yang di bawahnya disebut child. Child adalah stateless widget yang menerima deskripsi dari Parent (stateful widget) tanpa mengubah apapun.

(source: Materi PBP 09 - Intro to Dart & Flutter (Scele))

2. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

MaterialApp widget adalah root widget yang menginisialisasi aplikasi dan membungkus seluruh komponen aplikasi dengan panduan Material Design. Ini berfungsi mengatur tema, navigasi, dan konfigurasi global lainnya, serta memfasilitasi penggunaan widget Material seperti Scaffold.

Fungsi MaterialApp:
a. Mengatur tema aplikasi.
b. Membantu navigasi dan routing antar halaman.
c. Membuat judul aplikasi yang muncul di task manager.

MaterialApp biasanya digunakan sebagai root widget karena dapat mengatur tema seluruh aplikasi secara bersamaan, dan ada MaterialApp prebuilt yang bisa langsung digunakan.

(source: https://medium.com/@adtyase/mobile-app-materialapp-widget-e901f317dc0c (Medium), Materi PBP 10 - Layouts and Forms)

3. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

Terdapat beberapa perbedaan StatelessWidget dan StatefulWidget. Dimana StatelessWidget tidak punya state, sehingga tidak dapat diubah sendiri, dan hanya berubah ketika parentnya diubah. Sedangkan StatefulWidget bisa berubah selama aplikasi berjalan, dan punya class State pendamping yang menyimpan kondisi saat ini.

StatelessWidget dipakai ketika elemen tidak perlu diubah, dan dapat dihubungkan ke data dari parent. StatefulWidget digunakan ketika tampilan perlu berubah selama aplikasi berjalan, seperti ketika button dihover/ditekan.

(source: Materi PBP 09 - Intro to Dart & Flutter (Scele))

4. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

BuildContext adalah sebuah parameter di metode build. Dengan BuildContext, sebuah widget bisa mengambil data dari widget di atasnya dalam widget tree. Jadi widget tidak perlu menyalin data tema ke setiap child.

(Source: https://www.coddykit.com/id/courses/flutter/basic-page-navigation-1151040)

5. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

a. Hot reload: memasukkan perubahan kode ke VM dan membangun ulang widget tree. App state tetap tersimpan, dan tidak menjalankan main() serta initState() lagi.
b. Hot restart: memasukkan perubahan kode lalu menjalankan ulang Flutter app. App state akan hilang.

Kita harus melakukan hot restart ketika perubahan dijalankkan di main() atau initState(), karena keduanya tidak dijalankan pada saat melakukan hot reload.

(source: Materi PBP 09 - Intro to Dart & Flutter (Scele))

#AI Disclosure
Dalam mengerjakan Tugas Individu 7, saya TIDAK MENGGUNAKAN bantuan kecerdasan buatan (AI). Seluruh progres pengerjaan yang dilakukan hanya mengacu pada informasi yang diberikan pada website (pbp.cs.ui.ac.id). Beberapa sumber referensi saya lampirkan di bawah:
1. https://pbp.cs.ui.ac.id/tutorial/tutorial-8.html (Tutorial 8 PBP)
2. https://pbp.cs.ui.ac.id/assignments/individual/tugas-7.html (Tugas Individu 7 PBP)

### TUGAS INDIVIDU 8

1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.

Method push() menambahkan route baru ke dalam stack route yang dikelola oleh Navigator. Method push() membuat route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

Method pushReplacement() menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.

Method pop() menghapus route yang sedang ditampilkan kepada pengguna (atau dalam kata lain, route yang berada pada paling atas stack) dari stack route yang dikelola oleh Navigator. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke route yang berada di bawahnya pada stack yang dikelola Navigator.

Untuk membuka formulir dari kartu aksi, kita bisa menggunakan Navigator.push() dengan MaterialPageRoute. Opsi Home Drawer menggunakan Navigator.pushReplacement(), sehingga pada saat ditekan, maka stack route saat ini akan langsung diganti dengan route yang baru.

(source: https://pbp.cs.ui.ac.id/tutorial/tutorial-9.html)

2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

Scaffold menjadi rumah untuk appBar, drawer, dan body, sehingga setiap halaman dapat menggunakan Scaffold yang sama. AppBar digunakan untuk menampilkan header di bagian atas layar, yang juga menjadi rumah untuk icon Drawer. Drawer figunakan untuk menampilkan menu navigasi yang sama di setiap halaman, sehingga user dapat berpindah dari halaman saat ini ke halaman lainnya. Dengan menggunakan ketiga widget ini pada setiap halaman, posisi judul, tombol menu, dan area konten akan selalu konsisten, sehingga pengguna tidak kebingungan ketika berpindah halaman.

Contoh (dari main.dart):
appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white)
      ),

Note: Warna yang digunakan pada AppBar di halaman utama dan halaman formulir sama.

3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

Pada ExperienceFormPage, tata letak yang dipilih adalah Form yang berisi SingleChildScrollView, Column, dan setiap field dibungkus dengan Padding. Column dipilih karena field pada formulir diisi secara berurutan dari atas ke bawah. CrossAxisAlignment.start juga digunakan agar semua elemen rata ke kiri dan tampilannya rapi. Widget Form dipilih sebagai pembungkus karena Form dapat mengelompokkan seluruh field sekaligus, sehingga validasi semua field dapat dijalankan bersamaan melalui satu GlobalKey.

Widget pengatur jarak berperan agar tampilan formulir tidak terlalu padat. Pada formulir ini, setiap field dibungkus dengan Padding berukuran EdgeInsets.all(8.0), sehingga ada jarak antara field dengan tepi layar dan antara satu field dengan field lainnya. Tanpa jarak tersebut, field akan menempel pada tepi layar dan berdempetan satu sama lain, sehingga sulit dibaca dan sulit disentuh dengan tepat.

Widget penggulir berperan ketika viewport terbatas. Karena formulir berisi banyak field, total tingginya bisa melebihi tinggi layar, terutama pada layar kecil atau ketika keyboard sedang terbuka dan menutupi sebagian layar. Column secara default tidak dapat di-scroll, sehingga konten yang melebihi layar akan terpotong dan menyebabkan overflow. Oleh karena itu, Column dibungkus dengan SingleChildScrollView agar seluruh isi formulir tetap dapat di-scroll dan semua field serta tombol Save tetap dapat dijangkau. Selain itu, ScrollViewKeyboardDismissBehavior.onDrag membuat keyboard otomatis tertutup ketika layar digeser, sehingga pengguna mendapatkan ruang layar yang lebih luas.

4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

GlobalKey<FormState> digunakan pada widget Form untuk mengakses state dalam form dari luar Form, misalnya dari tombol Simpan. Validator adalah function pada setiap TextFormField yang memeriksa input pengguna. Sedangkan method validate() dipanggil untuk menjalankan seluruh validator yang ada di dalam form secara bersamaan. 

Sebagai contoh nilai yang ditolak, pada experience_form di field Certificate Link, pengguna mengisi "sertifikat.com" tanpa awalan http:// atau https://. nilai tersebut akan ditolak oleh fungsi _isValidUrl dan form menampilkan pesan "Format URL tidak valid (awali dengan http:// atau https://)".

Memilih jenis input atau papan ketik saja tidak cukup karena keduanya berpengaruh pada tampilan keyboard, bukan isi data yang dimasukkan. Pada field Certificate Link, keyboardType sudah diatur menjadi TextInputType.url, tetapi pengguna tetap bisa mengetik teks sembarang seperti abc atau menempelkan teks yang formatnya salah dari clipboard. Begitu juga pada field tanggal yang sudah dibuat readOnly dan dipilih lewat date picker, pengguna masih dapat memilih tanggal selesai yang lebih awal daripada tanggal mulai, karena date picker tidak peduli hubungan antar kedua field. Oleh karena itu, validator tetap diperlukan untuk memastikan data tidak kosong, formatnya benar, dan masuk akal sebelum disimpan.

#AI DISCLOSURE
Saya Rasya Azyan Kautsar, NPM 2506538981, dengan ini menyatakan MENGGUNAKAN bantuan kecerdasan buatan (AI) dengan model Claude Sonnet 5.5 untuk membuat sebagian widget yang terdapat pada file experience_form.dart, sepert untuk membantu mengubah isi validator pada bagian Institution, membantu menyusun Dropdown Experience, Start Date, End Date, Certificate Link dan Tombol Save. Seluruh hasil yang diberikan saya coba pahami penggunaannya berdasarkan tutorial yang diberikan sebelumnya, sehingga seluruh hasil yang saya kumpulkan pada Tugas ini dapat dipertanggungjawabkan sepenuhnya.