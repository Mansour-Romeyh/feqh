import 'package:feqh/model/data/soundscreens.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:audioplayers/audioplayers.dart';

class FavoritesController extends GetxController {
  final box = GetStorage();
  var favoriteSongs = <Map<String, String>>[].obs;
  late String path;
  late int index;
  late String title;
  List<SoundModel>? data;
  
  static AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  @override
  void onClose() {
    _audioPlayer.stop();
    super.onClose();
  }

  void _loadFavorites() {
    var savedFavorites = box.read('favoriteSongs');
    if (savedFavorites != null) {
      favoriteSongs.assignAll(
        List<Map<String, String>>.from(
          savedFavorites.map((item) => Map<String, String>.from(item))
        )
      );

      if (favoriteSongs.isNotEmpty) {
        path = favoriteSongs.first['path'] ?? '';
        index = int.tryParse(favoriteSongs.first['index'] ?? '0') ?? 0;
        title = favoriteSongs.first['title'] ?? '';
        data?.add(SoundModel(
          favoriteSongs.first['name_ar'] ?? '',
          favoriteSongs.first['name_en'] ?? '',
        ));
      }
    }
  }

  void _saveFavorites() {
    box.write('favoriteSongs', favoriteSongs);
  }

  void removeFavorite(String songName, String title) {
    Map<String, String> favoriteSong = {'name_ar': songName, 'title': title};
    favoriteSongs.removeWhere((element) =>
        element['name_ar'] == favoriteSong['name_ar'] &&
        element['title'] == favoriteSong['title']);
    stopMusic();
    _saveFavorites();
  }

  void clearFavorites() {
    favoriteSongs.clear();
    _saveFavorites();
    stopMusic();
  }

  Future<void> stopMusic() async {
    await _audioPlayer.stop();
    print('تم إيقاف الموسيقى');
  }

  Future<void> playMusicFromAsset(String assetPath) async {
    if (assetPath.isNotEmpty) {
      await _audioPlayer.play(AssetSource(assetPath));
      print('تشغيل الموسيقى من الأصول: $assetPath');
    }
  }
}
