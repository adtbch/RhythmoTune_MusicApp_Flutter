import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:music_app/data/song_models/song_model.dart';
import 'package:music_app/core/global_components/Typography.dart';
import 'package:music_app/core/utils/audio_service.dart';
import '../widget/funcbutton/shuffle_button.dart';
import '../widget/funcbutton/skip_previous_button.dart';
import '../widget/funcbutton/play_button.dart';
import '../widget/funcbutton/skip_next_button.dart';
import '../widget/funcbutton/loop_button.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;

  PlayerScreen({required this.song});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioService _audioService = AudioService();

  late StreamSubscription<Duration> _positionSubscription;
  late StreamSubscription<Duration?> _durationSubscription;
  late StreamSubscription<bool> _playingSubscription;

  Duration currentTime = Duration.zero;
  Duration totalTime = Duration.zero;
  bool isPlaying = false;
  bool isLooping = false;

  @override
  void initState() {
    super.initState();

    // Set up the audio source
    _audioService.setAudio(widget.song.audioFile).then((_) {
      _audioService.play();
    }).catchError((error) {
      print("Error loading audio: $error");
    });

    // Listen to audio position changes
    _positionSubscription = _audioService.positionStream.listen((position) {
      setState(() {
        currentTime = position;
      });
      print("Current position: $position");
    });

    // Listen to duration changes
    _durationSubscription = _audioService.durationStream.listen((duration) {
      setState(() {
        totalTime = duration ?? Duration.zero;
      });
      print("Total duration: $duration");
    });

    // Listen to playing status
    _playingSubscription = _audioService.playingStream.listen((playing) {
      setState(() {
        isPlaying = playing;
      });
      print("Is playing: $playing");
    });
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _durationSubscription.cancel();
    _playingSubscription.cancel();
    _audioService.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (isPlaying) {
      _audioService.pause();
    } else {
      _audioService.play();
    }
  }

  void toggleLoop() {
    setState(() {
      isLooping = !isLooping;
    });
    _audioService.setLoopMode(isLooping);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    double sliderMax = totalTime.inSeconds.toDouble();
    double sliderValue = currentTime.inSeconds.toDouble();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with blur effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.song.albumArt),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Apply blur and solid color overlay
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          // Header with title and back button
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Music Player", style: AppTypography.header),
                    SizedBox(width: 48), // Placeholder for alignment
                  ],
                ),
              ),
              SizedBox(height: 40),
              // Album Art Image below the header
              Center(
                child: Container(
                  width: 240,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.song.albumArt),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Song Title and Artist Name
              Center(
                child: Column(
                  children: [
                    Text(
                      widget.song.title,
                      style: AppTypography.captiontitlebold(Colors.white),
                    ),
                    Text(
                      widget.song.artist,
                      style: AppTypography.captionsubtitle,
                    ),
                  ],
                ),
              ),
              Spacer(), // Push slider and controls to the bottom
              // Time Slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Slider(
                      value: sliderValue.clamp(0, sliderMax),
                      min: 0.0,
                      max: sliderMax,
                      onChanged: (value) async {
                        await _audioService
                            .seek(Duration(seconds: value.toInt()));
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatDuration(currentTime),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          totalTime != Duration.zero
                              ? formatDuration(totalTime)
                              : "--:--",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Space between slider and controls
              // Playback Controls at the Bottom with Shadow and Additional Icons
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(59, 180, 180, 180),
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 50,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ShuffleButton(
                        onShuffle: () {
                          print("Shuffle button pressed");
                        },
                      ),
                      SkipPreviousButton(
                        onSkipPrevious: () {
                          print("Skip Previous button pressed");
                        },
                      ),
                      PlayButton(
                        isPlaying: isPlaying,
                        onTogglePlayPause: togglePlayPause,
                      ),
                      SkipNextButton(
                        onSkipNext: () {
                          print("Skip Next button pressed");
                        },
                      ),
                      LoopButton(
                        onLoop: toggleLoop,
                        isLooping: isLooping,
                      ),
                    ],
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
