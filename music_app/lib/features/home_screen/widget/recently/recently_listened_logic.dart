import 'package:music_app/data/song_models/song_model.dart';

class RecentlyListenedLogic {
  final List<Song> _recentlyListened = [];

  List<Song> get recentlyListened => List.unmodifiable(_recentlyListened);

  void addSong(Song song) {
    // Remove the song if it already exists to prevent duplicates.
    _recentlyListened
        .removeWhere((s) => s.title == song.title && s.artist == song.artist);

    // Add the song to the top of the list.
    _recentlyListened.insert(0, song);

    // Keep the list to a maximum of 5 songs to reduce memory usage.
    if (_recentlyListened.length > 5) {
      _recentlyListened.removeLast();
    }
  }
}
