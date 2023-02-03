import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class RadioOnlineProvider extends ChangeNotifier {
  late final AudioPlayer _audioPlayer;
  static const String _url = 'http://uv-stereo.univalle.edu.co:8000/envivo.aac';
  late StreamSubscription<PlayerState> _streamStatus;
  late StreamSubscription _streamStatusError;

  bool _estado = false;
  bool _isLoading = false;
  RadioOnlineProvider() {
    _init();
  }

  set estado(bool value) {
    _estado = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get estado => _estado;
  bool get isLoading => _isLoading;

  void _init() async {
    _audioPlayer = AudioPlayer();
    try {
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(_url),
          tag: MediaItem(
              id: '1',
              title: 'Señal en vivo',
              artist: '105.3 fm',
              artUri: Uri.parse(
                  'http://emisora.univalle.edu.co/wp-content/uploads/2020/01/Sin-título-1-300x180.png'))));
    } on PlayerException catch (_) {
      if (_audioPlayer.playing) {
        await _audioPlayer.stop();
      }
    } catch (e) {
      if (_audioPlayer.playing) {
        await _audioPlayer.stop();
      }
    }

    _streamStatusError = _audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace st) async {
      await _audioPlayer.stop();
    });

    _streamStatus = _audioPlayer.playerStateStream.listen((event) {
      switch (event.processingState) {
        case ProcessingState.loading:
          isLoading = true;
          break;
        case ProcessingState.ready:
          isLoading = false;
          break;
        case ProcessingState.idle:
          isLoading = false;
          break;
        default:
          isLoading = true;
          break;
      }
      estado = event.playing;
    });
  }

  void play() async {
    await _audioPlayer.play();
  }

  void stop() async {
    await _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _streamStatus.cancel();
    _streamStatusError.cancel();
    super.dispose();
  }
}
