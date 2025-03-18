import 'package:feqh/controller/favoritecontroller.dart';
import 'package:feqh/core/const/Appfonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المفضلة",
          style: Appfonts.fontname,
        ),
      ),
      body: GetX<FavoritesController>(
        init: FavoritesController(),
        builder: (controller) {
          var favoriteSongs = controller.favoriteSongs;

          if (favoriteSongs.isEmpty) {
            return Center(
              child: Text(
                "لا توجد أغاني مفضلة",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: favoriteSongs.length,
            itemBuilder: (context, index) {
              var song = favoriteSongs[index];
              String songName = song['name_ar'] ?? 'اسم غير محدد';
              String songName_en = song['name_en'] ?? 'اسم غير محدد';
              String songTitle = song['title'] ?? 'عنوان غير محدد';
              String songPath = song['path'] ?? '';
              int songIndex = int.tryParse(song['index'] ?? '0') ?? 0;

              return Card(
                color: Colors.grey[300],
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  title: Text(
                    songTitle,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    songName,
                    style: Appfonts.fontlogo.copyWith(fontSize: 18),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                        onPressed: () {
                          controller.removeFavorite(songName, songTitle);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.play_arrow, color: Colors.green),
                        onPressed: () {
                          if (songPath.isNotEmpty) {
                            controller.playMusicFromAsset('${songPath}$songName_en');
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.stop, color: Colors.orange),
                        onPressed: () {
                          controller.stopMusic();
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    print("تشغيل الأغنية: $songTitle");
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
