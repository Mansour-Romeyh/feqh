import 'package:feqh/model/data/soundscreens.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_storage/get_storage.dart';

class MusicPlayerController extends GetxController {
  static AudioPlayer player = AudioPlayer();
  final box = GetStorage();
  
  var isPlaying = false.obs;
  var isPaused = false.obs;
  var position = 0.0.obs;
  var duration = 0.0.obs;
  var currentIndex = 0.obs;
  var isPrevPressed = false.obs;
  var isNextPressed = false.obs;
  var favoriteSongs = <Map<String, String>>[].obs;
  var playbackSpeed = 1.0.obs;

  late String title;
  late String path;
  late List<SoundModel> music;
  var isRepeatEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    currentIndex.value = int.tryParse(Get.arguments['index'].toString()) ?? 0;
    music = Get.arguments['data'];
    title = Get.arguments['title'];
    path = Get.arguments['path'];

    _loadFavorites();
    _setupAudioContext();
    _setupListeners();
    playMusic();
  }

  void _loadFavorites() {
    List? savedFavorites = box.read<List>('favoriteSongs');
    if (savedFavorites != null) {
      favoriteSongs.assignAll(savedFavorites.map((e) => Map<String, String>.from(e)).toList());
    }
  }

  void _saveFavorites() {
    box.write('favoriteSongs', favoriteSongs);
  }

  void toggleFavorite() {
   String currentSongEn = music[currentIndex.value].name_en;
   String currentSongTitle = title;

   Map<String, String> favoriteSong = {
      'name_ar': music[currentIndex.value].name_ar,
      'name_en': currentSongEn,
      'title': currentSongTitle,
      'path': path, 
      'index': currentIndex.value.toString()
   };

   if (favoriteSongs.any((song) => song['name_en'] == currentSongEn && song['title'] == currentSongTitle)) {
      favoriteSongs.removeWhere((song) => song['name_en'] == currentSongEn && song['title'] == currentSongTitle);
   } else {
      favoriteSongs.add(favoriteSong);
   }

   _saveFavorites();
}

bool isFavorite() {
   return favoriteSongs.any((song) => song['name_en'] == music[currentIndex.value].name_en && song['title'] == title);
}


  void _setupAudioContext() async {
    await player.setAudioContext(
      AudioContext(
        android: AudioContextAndroid(
          isSpeakerphoneOn: false,
          stayAwake: true,
          contentType: AndroidContentType.music,
          usageType: AndroidUsageType.media,
          audioFocus: AndroidAudioFocus.gain,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playback,
          options: {AVAudioSessionOptions.duckOthers}, 
        ),
      ),
    );
  }

  void _setupListeners() {
    player.onDurationChanged.listen((Duration d) {
      if (d.inSeconds > 0) {
        duration.value = d.inSeconds.toDouble();
      }
    });

    player.onPositionChanged.listen((Duration p) {
      if (p.inSeconds.toDouble() <= duration.value) {
        position.value = p.inSeconds.toDouble();
      }
    });

    player.onPlayerComplete.listen((_) async {
      isPlaying.value = false;
      if (isRepeatEnabled.value) {
        await playMusic();
      } else if (currentIndex.value < music.length - 1) {
        playbackSpeed.value = 1.0;
        await nextTrack();
      } else {
        stopMusic();
      }
    });
  }

  void setPlaybackSpeed(double speed) async {
    playbackSpeed.value = speed;
    await player.setPlaybackRate(playbackSpeed.value);
  }

  Future<void> playMusic() async {
    if (currentIndex.value < 0 || currentIndex.value >= music.length) {
      stopMusic();
      return;
    }

    if (isPaused.value) {
      resumeMusic();
    } else {
      await player.stop();
      await Future.delayed(Duration(milliseconds: 300)); 
      position.value = 0.0;
      duration.value = 0.0;

      String sourcePath = '$path${music[currentIndex.value].name_en}';
      print("Playing: $sourcePath");

      try {
        await player.setSource(AssetSource(sourcePath));
        await Future.delayed(Duration(milliseconds: 100)); 
        await player.setPlaybackRate(playbackSpeed.value);
        await player.resume();
        isPlaying.value = true;
        isPaused.value = false;
      } catch (e) {
        print("Error playing file: $e");
      }
    }
  }

  void pauseMusic() async {
    await player.pause();
    isPlaying.value = false;
    isPaused.value = true;
  }

  void resumeMusic() async {
    await player.resume();
    isPlaying.value = true;
    isPaused.value = false;
  }

  void stopMusic() async {
    await player.stop();
    isPlaying.value = false;
    isPaused.value = false;
    position.value = 0.0;
  }

  Future<void> previousTrack() async {
    if (currentIndex.value > 0) {
      isPrevPressed.value = true;
      await Future.delayed(Duration(milliseconds: 150));
      isPrevPressed.value = false;
      currentIndex.value--;
      await playMusic();
    }
  }

  Future<void> nextTrack() async {
    if (currentIndex.value < music.length - 1) {
      isNextPressed.value = true;
      await Future.delayed(Duration(milliseconds: 150));
      isNextPressed.value = false;
      currentIndex.value++;
      playbackSpeed.value = 1.0; 
      await playMusic();
    } else {
      stopMusic();
    }
  }

  void toggleRepeat() {
    isRepeatEnabled.value = !isRepeatEnabled.value;
  }

  void seekToPosition(double seconds) async {
    await player.seek(Duration(seconds: seconds.toInt()));
    position.value = seconds;
  }

  @override
  void onClose() {
    player.stop();
    super.onClose();
  }
}
