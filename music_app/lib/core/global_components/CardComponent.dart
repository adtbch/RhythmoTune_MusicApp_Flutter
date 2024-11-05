import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CardComponent extends StatefulWidget {
  final String title;
  final String artist;
  final String albumArt;
  final VoidCallback onTap;
  final bool isLarge;

  const CardComponent({
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.onTap,
    this.isLarge = false,
  });

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  Color backgroundColor = Colors.blueGrey[900]!; // Default background color

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  // Method to generate the dominant color from the album art
  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(widget.albumArt),
    );
    setState(() {
      backgroundColor =
          paletteGenerator.dominantColor?.color ?? Colors.blueGrey[900]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = widget.isLarge ? 400 : 160;
    final double imageHeight =
        widget.isLarge ? 340 : 130; // Adjusted height based on isLarge
    final double fontSizeTitle = widget.isLarge ? 30 : 16;
    final double fontSizeArtist = widget.isLarge ? 20 : 12;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: widget.isLarge ? 0 : 10.0),
        decoration: BoxDecoration(
          color: backgroundColor, // Dynamic background color based on album art
          borderRadius: widget.isLarge
              ? BorderRadius.circular(50)
              : BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Height adjusts to content
            children: [
              // Gambar album dengan padding berbeda berdasarkan isLarge
              Padding(
                padding: widget.isLarge
                    ? const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0)
                    : const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: ClipRRect(
                  borderRadius: widget.isLarge
                      ? BorderRadius.circular(40)
                      : BorderRadius.circular(15),
                  child: Image.asset(
                    widget.albumArt,
                    width: double.infinity,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Text overlay di bawah gambar
              Padding(
                padding: widget.isLarge
                    ? const EdgeInsets.all(20.0)
                    : const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.artist,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: fontSizeArtist,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
