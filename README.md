# RhythmoTune Music App

RhythmoTune adalah aplikasi pemutar musik yang kaya fitur, dibangun dengan Flutter. Terinspirasi oleh [RhythmoTune Mobile App Concept](https://dribbble.com/shots/24908394-Music-Player-RhythmoTune-Mobile-App-Concept) di Dribbble, RhythmoTune menawarkan antarmuka yang intuitif dan menarik secara visual untuk pengalaman mendengarkan musik yang lebih baik.
![original-c42082fa98ed90c32c77ccd6893f4a7d](https://github.com/user-attachments/assets/346e703a-2bac-4d6b-afd2-44d6e81c80e6)

[RhythmoTune Mobile App Concept](https://github.com/user-attachments/assets/b1f54b8b-4aa9-4efc-a9f4-db19a65f369c)

## Fitur

- **Antarmuka Intuitif**: Desain bersih dan modern terinspirasi oleh tren UI terkini.
- **Pemutaran Musik**: Putar, jeda, lewati, dan acak lagu dengan mudah.
- **Manajemen Playlist**: Buat dan kelola playlist Anda sendiri.
- **Jelajahi Genre**: Eksplorasi musik berdasarkan berbagai genre.
- **Baru Didengarkan**: Lacak riwayat mendengarkan Anda.
- **Fungsi Pencarian**: Temukan lagu dan artis favorit Anda dengan mudah.
- **Desain Responsif**: Dioptimalkan untuk platform mobile dan desktop.

## Demo

Karena demo aplikasi hanya tersedia secara lokal, Anda dapat melihat aplikasi ini beraksi dengan menjalankannya di perangkat Anda sendiri mengikuti proses instalasi di bawah ini. Navigasikan berbagai fitur seperti layar beranda, pemutar musik, dan manajemen playlist langsung di perangkat Anda.

## Proses Instalasi

Pastikan Anda telah menginstal [Flutter](https://flutter.dev/docs/get-started/install) di komputer Anda.

1. **Clone repositori ini:**

   ```bash
   git clone https://github.com/usernameAnda/music_app.git
   ```

2. **Masuk ke direktori proyek:**

   ```bash
   cd music_app
   ```

3. **Instal dependensi:**

   ```bash
   flutter pub get
   ```

4. **Jalankan aplikasi:**

   ```bash
   flutter run
   ```

## Struktur Proyek

### Struktur Folder `lib`

```
lib/
├── core/
│   ├── config/
│   │   └── main.dart
│   ├── global_components/
│   │   ├── AvatarComponent.dart
│   │   ├── BarButtonComponent.dart
│   │   ├── ButtonComponent.dart
│   │   ├── CardComponent.dart
│   │   ├── CustomBottomNavigationBar.dart
│   │   ├── NetworkImageLoader.dart
│   │   └── Typography.dart
│   └── utils/
│       ├── audio_service.dart
│       └── routes_utils.dart
├── data/
│   └── song_models/
│       ├── song_list.dart
│       └── song_model.dart
└── features/
    ├── home_screen/
    │   ├── screen/
    │   │   └── home_screen.dart
    │   └── widget/
    │       ├── genre/
    │       │   ├── genre_component.dart
    │       │   └── genre_list.dart
    │       ├── recently/
    │       │   ├── recently_listened_logic.dart
    │       │   └── recently_listened_widget.dart
    │       └── search/
    │           ├── search_bar.dart
    │           └── search_logic.dart
    ├── on_boarding/
    │   └── start_screen.dart
    └── player_screen/
        ├── screens/
        │   └── player_screen.dart
        └── widget/
            └── funcbutton/
                ├── loop_button.dart
                ├── play_button.dart
                ├── shuffle_button.dart
                ├── skip_next_button.dart
                └── skip_previous_button.dart
```

### Penjelasan

- **core/**: Berisi konfigurasi inti, komponen UI global, dan fungsi utilitas.
- **data/**: Mengelola model data terkait lagu.
- **features/**: Mengemas berbagai fitur aplikasi seperti layar beranda, onboarding, dan layar pemutar.

## Kontribusi

Kontribusi sangat kami apresiasi! Ikuti langkah-langkah berikut untuk berkontribusi:

1. **Fork repositori**
2. **Buat branch baru**

   ```bash
   git checkout -b feature/FiturAnda
   ```

3. **Commit perubahan Anda**

   ```bash
   git commit -m "Menambahkan fitur X"
   ```

4. **Push ke branch**

   ```bash
   git push origin feature/FiturAnda
   ```

5. **Buka Pull Request**

Pastikan kode Anda mengikuti standar pengkodean proyek dan menyertakan pengujian yang relevan.

## Lisensi

Proyek ini dilisensikan di bawah [Lisensi MIT](LICENSE).

---

*Dikembangkan dengan ❤️ menggunakan Flutter.*

# Menyematkan Gambar dan Demo Lokal

### Menyematkan Gambar

Untuk menyematkan gambar yang disimpan secara lokal dalam repositori ke dalam `README.md`, gunakan path relatif ke lokasi gambar tersebut. Pastikan gambar sudah berada di dalam folder proyek dan path-nya benar.

**Contoh:**

```markdown
![Deskripsi Gambar](assets/images/nama_gambar.png)
```

**Langkah-langkah:**

1. **Tambahkan Gambar ke Direktori Assets**

   Letakkan gambar Anda di dalam folder `assets/images/`. Misalnya:

   ```
   assets/
   ├── images/
   │   ├── logo.png
   │   ├── demo_thumbnail.png
   │   └── nama_gambar.png
   └── screenshots/
       ├── home_screen.png
       └── player_screen.png
   ```

2. **Perbarui `pubspec.yaml`**

   Pastikan path gambar sudah ditambahkan di bagian `assets` pada `pubspec.yaml`:

   ```yaml
   flutter:
     assets:
       - assets/images/logo.png
       - assets/images/demo_thumbnail.png
       - assets/screenshots/home_screen.png
       - assets/screenshots/player_screen.png
   ```

### Menyematkan Demo Lokal

Jika demo aplikasi hanya tersedia secara lokal (misalnya, video demo disimpan di dalam repositori), Anda tidak dapat menyematkannya langsung di `README.md`. Namun, Anda dapat memberikan instruksi tentang cara mengakses demo tersebut atau menyertakan video sebagai file yang dapat diunduh.

**Opsi 1: Menyediakan Link ke File Demo**

1. **Tambahkan Video Demo ke Direktori Assets**

   Letakkan video demo, misalnya `demo.mp4`, di dalam folder `assets/videos/`:

   ```
   assets/
   ├── images/
   │   ├── logo.png
   │   ├── demo_thumbnail.png
   ├── screenshots/
   │   ├── home_screen.png
   │   └── player_screen.png
   └── videos/
       └── demo.mp4
   ```

2. **Perbarui `pubspec.yaml`**

   Tambahkan path video di bagian `assets`:

   ```yaml
   flutter:
     assets:
       - assets/images/logo.png
       - assets/images/demo_thumbnail.png
       - assets/screenshots/home_screen.png
       - assets/screenshots/player_screen.png
       - assets/videos/demo.mp4
   ```

3. **Berikan Link ke Video Demo di README.md**

   Anda dapat menambahkan link ke video demo yang dapat diunduh atau diputar secara lokal:

   ```markdown
   ## Demo Lokal

   Untuk melihat demo aplikasi RhythmoTune, jalankan aplikasi ini di perangkat lokal Anda mengikuti proses instalasi di atas. Anda juga dapat memutar video demo yang disediakan di direktori `assets/videos/demo.mp4`.

   **Memutar Video Demo Lokal:**

   1. Buka file `assets/videos/demo.mp4` menggunakan pemutar media favorit Anda.
   2. Tonton video untuk memahami fitur dan alur penggunaan aplikasi.
   ```

**Opsi 2: Menyediakan Panduan Tertulis**

Jika Anda tidak ingin menyertakan file video dalam repositori, Anda bisa memberikan panduan tertulis atau tangkapan layar tambahan yang menjelaskan fitur-fitur utama aplikasi.

```markdown
## Demo Lokal

Untuk melihat demo aplikasi RhythmoTune, jalankan aplikasi ini di perangkat lokal Anda mengikuti proses instalasi di atas. Aplikasi ini memungkinkan Anda untuk:

- **Menjelajahi Genre**: Navigasi melalui berbagai genre musik di layar beranda.
- **Memutar Musik**: Gunakan kontrol pemutaran di layar pemutar untuk memainkan, menjeda, atau melewati lagu.
- **Mengelola Playlist**: Buat dan kelola playlist sesuai preferensi Anda.
- **Melihat Riwayat Mendengarkan**: Lihat lagu-lagu yang baru saja Anda dengarkan di bagian "Baru Didengarkan".
- **Mencari Lagu dan Artis**: Gunakan fitur pencarian untuk menemukan lagu atau artis favorit Anda.

Pastikan untuk mengikuti langkah-langkah instalasi dan menjalankan aplikasi di perangkat Anda untuk melihat semua fitur ini beraksi.
```
