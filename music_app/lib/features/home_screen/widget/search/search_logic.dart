import 'package:music_app/data/song_models/song_model.dart';

class SearchLogic {
  List<Song> _allSongs = [];
  List<Song> filteredSongs = [];
  String query = '';
  String selectedGenre = 'All';

  SearchLogic(List<Song> songs) {
    _allSongs = songs;
    filteredSongs = List.from(_allSongs);
  }

  void filterSongs(String query) {
    this.query = query;
    _applyFilters();
  }

  void filterByGenre(String genre) {
    selectedGenre = genre;
    _applyFilters();
  }

  void _applyFilters() {
    filteredSongs = _allSongs.where((song) {
      final matchesQuery =
          song.title.toLowerCase().contains(query.toLowerCase()) ||
              song.artist.toLowerCase().contains(query.toLowerCase());

      final matchesGenre =
          selectedGenre == 'All' || song.genre == selectedGenre;

      return matchesQuery && matchesGenre;
    }).toList();
  }
}
