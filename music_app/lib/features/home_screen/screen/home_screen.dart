import 'package:flutter/material.dart';
import 'package:music_app/features/player_screen/screens/player_screen.dart';
import 'package:music_app/core/global_components/AvatarComponent.dart';
import 'package:music_app/core/global_components/CardComponent.dart'
    as global_card;
import 'package:music_app/core/global_components/Typography.dart';
import 'package:music_app/core/global_components/CustomBottomNavigationBar.dart';
import 'package:music_app/data/song_models/song_list.dart';
import 'package:music_app/data/song_models/song_model.dart';
import 'package:music_app/features/home_screen/widget/search/search_bar.dart'
    as custom;
import 'package:music_app/features/home_screen/widget/search/search_logic.dart';
import 'package:music_app/features/home_screen/widget/genre/genre_component.dart'
    as genre;
import 'package:music_app/features/home_screen/widget/recently/recently_listened_logic.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final Color searchIconColor = const Color.fromARGB(255, 207, 207, 207);
  late final SearchLogic searchLogic = SearchLogic(list_song);
  final RecentlyListenedLogic recentlyListenedLogic = RecentlyListenedLogic();

  Color? dominantColor;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _filterSongs(String query) {
    setState(() {
      searchLogic.filterSongs(query);
    });
  }

  void _onGenreSelected(String genre) {
    setState(() {
      searchLogic.filterByGenre(genre);
    });
  }

  void _playSong(Song song) async {
    await _getDominantColor(song.albumArt);
    recentlyListenedLogic.addSong(song);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayerScreen(song: song),
      ),
    ).then((_) {
      setState(() {}); // Refresh the UI when coming back from PlayerScreen.
    });
  }

  Future<void> _getDominantColor(String imagePath) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(11, 14, 21, 255),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header and Search
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hello, Molly Hunter!',
                            style: AppTypography.header),
                        AvatarComponent(imagePath: 'assets/photos/profile.jpg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  custom.SearchBar(
                    searchIconColor: searchIconColor,
                    onChanged: _filterSongs,
                  ),
                  SizedBox(height: 20),
                  genre.GenreComponent(
                    selectedGenre: searchLogic.selectedGenre,
                    onGenreSelected: _onGenreSelected,
                  ),
                  if (searchLogic.query.isEmpty) ...[
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        searchLogic.selectedGenre != 'All'
                            ? 'Popular Songs in ${searchLogic.selectedGenre}'
                            : 'Popular Songs',
                        style: AppTypography.subHeader,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 20),

              // Display the list of songs based on search or genre selection
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: searchLogic.filteredSongs.length,
                  itemBuilder: (context, index) {
                    final song = searchLogic.filteredSongs[index];
                    return global_card.CardComponent(
                      title: song.title,
                      artist: song.artist,
                      albumArt: song.albumArt,
                      onTap: () => _playSong(song),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),

              // Display the Recently Listened section with a larger song card
              if (recentlyListenedLogic.recentlyListened.isNotEmpty &&
                  searchLogic.query.isEmpty &&
                  searchLogic.selectedGenre == 'All') ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Recently Listened',
                    style: AppTypography.subHeader,
                  ),
                ),
                SizedBox(height: 20),
                // Display the single recently listened song with a blurred background
                global_card.CardComponent(
                  title: recentlyListenedLogic.recentlyListened.first.title,
                  artist: recentlyListenedLogic.recentlyListened.first.artist,
                  albumArt:
                      recentlyListenedLogic.recentlyListened.first.albumArt,
                  onTap: () =>
                      _playSong(recentlyListenedLogic.recentlyListened.first),
                  isLarge: true,
                ),
              ],
              SizedBox(
                  height:
                      20), // Tambahkan jarak di bawah untuk scrolling nyaman
            ],
          ),
        ),
      ),
    );
  }
}
