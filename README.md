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

*Dikembangkan dengan menggunakan Flutter.*
