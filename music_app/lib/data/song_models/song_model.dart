// lib/data/song_models/song_model.dart
class Song {
  final String title;
  final String artist;
  final String albumArt;
  final String genre;
  final String audioFile; // Path relatif tanpa 'assets/'

  Song({
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.genre,
    required this.audioFile,
  });
}
