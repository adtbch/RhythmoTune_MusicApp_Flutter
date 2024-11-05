import 'package:flutter/material.dart';
import 'package:music_app/core/global_components/Typography.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Latar belakang gambar penuh
          Image.asset(
            'assets/photos/background.jpg', // Ganti dengan gambar latar belakang yang kamu miliki
            fit: BoxFit.cover,
          ),
          // Gradien warna biru gelap dari bawah ke atas
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color.fromARGB(255, 4, 4, 4),
                  const Color.fromARGB(0, 1, 21, 52),
                ],
                stops: [0.25, 0.6],
              ),
            ),
          ),
          // Lapisan semi-transparan untuk teks terlihat jelas
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Konten utama
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Tipografi menarik di atas tombol
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dive Into Your',
                      textAlign: TextAlign.left,
                      style:
                          AppTypography.h1(Colors.white).copyWith(height: 0.8),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'RhythmoTune',
                            style: AppTypography.h1(Colors.orange),
                          ),
                          TextSpan(
                            text: '.',
                            style: AppTypography.h1(Colors.white),
                          ),
                        ],
                      ),
                    ), // Berikan sedikit jarak setelah teks
                    Text(
                        'experience seamless music enjoyment, crafted for every moment.',
                        textAlign: TextAlign.left,
                        style: AppTypography.body(
                            Color.fromARGB(122, 255, 255, 255))),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // Tombol di bagian paling bawah
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      // Aksi ketika tombol ditekan
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Start Explore',
                        style: AppTypography.captiontitlebold(Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Tambahkan halaman ini ke main.dart atau rute aplikasi anda
// Navigator.pushReplacementNamed(context, '/home') mengacu pada halaman beranda aplikasi anda.
