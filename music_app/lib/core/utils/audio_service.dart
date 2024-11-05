import 'package:just_audio/just_audio.dart';
import 'dart:async';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Stream yang memberikan posisi audio saat ini
  Stream<Duration> get positionStream => _audioPlayer.positionStream;
  // Stream yang memberikan durasi total audio
  Stream<Duration?> get durationStream => _audioPlayer.durationStream;
  // Stream yang memberikan status playing atau tidak
  Stream<bool> get playingStream => _audioPlayer.playingStream;

  Future<void> setAudio(String assetPath) async {
    try {
      await _audioPlayer.setAsset(assetPath);
      print("Audio asset loaded successfully: $assetPath");
    } catch (e) {
      print("Error loading audio asset: $e");
    }
  }

  Future<void> play() async {
    try {
      await _audioPlayer.play();
      print("Audio playback started");
    } catch (e) {
      print("Error starting playback: $e");
    }
  }

  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
      print("Audio playback paused");
    } catch (e) {
      print("Error pausing playback: $e");
    }
  }

  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
      print("Seek to position: $position");
    } catch (e) {
      print("Error seeking audio: $e");
    }
  }

  Future<void> setLoopMode(bool isLooping) async {
    try {
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
      print("Loop mode set to: ${isLooping ? "ON" : "OFF"}");
    } catch (e) {
      print("Error setting loop mode: $e");
    }
  }

  void dispose() {
    _audioPlayer.dispose();
    print("AudioPlayer disposed");
  }
}
