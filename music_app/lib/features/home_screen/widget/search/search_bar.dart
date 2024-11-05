import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Color searchIconColor;
  final Function(String) onChanged;

  const SearchBar({
    Key? key,
    required this.searchIconColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search for a song',
          hintStyle: TextStyle(color: searchIconColor),
          suffixIcon: Icon(Icons.search, color: searchIconColor),
          filled: true,
          fillColor: Color.fromARGB(32, 132, 137, 235),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
