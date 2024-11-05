import 'package:flutter/material.dart';
import 'genre_list.dart';

class GenreComponent extends StatelessWidget {
  final String selectedGenre;
  final Function(String) onGenreSelected;

  const GenreComponent({
    Key? key,
    required this.selectedGenre,
    required this.onGenreSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = selectedGenre == genre;

          return GestureDetector(
            onTap: () => onGenreSelected(genre),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 1.5,
                ),
                color: isSelected
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.transparent,
              ),
              child: Text(
                genre,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
