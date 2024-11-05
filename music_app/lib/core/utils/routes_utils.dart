import 'package:flutter/material.dart';
import '../../features/on_boarding/start_screen.dart'; // Mengimpor halaman login
import '../../features/home_screen/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Menampilkan halaman login pertama kali
      routes: {
        '/': (context) => StartScreen(), // Halaman login
        '/home': (context) => HomeScreen(), // Halaman utama setelah login
      },
    );
  }
}
