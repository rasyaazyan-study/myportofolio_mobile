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

#TUGAS INDIVIDU 1

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