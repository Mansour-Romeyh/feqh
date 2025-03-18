import 'package:feqh/controller/musicplayer.controller.dart';
import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart';
import 'package:feqh/core/const/appimgs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

class MusicPlayerScreen extends StatelessWidget {
  final MusicPlayerController controller = Get.put(MusicPlayerController());

  MusicPlayerScreen({super.key});

  String formatTime(double seconds) {
    int min = (seconds ~/ 60);
    int sec = (seconds % 60).toInt();
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFFDEE),
      appBar: AppBar(
        backgroundColor: Appcolors.brawen,
        iconTheme: IconThemeData(color: Appcolors.whiet),
        title: Text(
          controller.title,
          style: Appfonts.fontname.copyWith(fontSize: 40),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom:15),
        color: Appcolors.brawen,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Slider(
                inactiveColor: Appcolors.brawen,
                activeColor: Appcolors.whiet,
                min: 0,
                max: controller.duration.value > 0 ? controller.duration.value : 1.0,
                value: controller.position.value.clamp(0.0, controller.duration.value),
                onChanged: (value) {
                  controller.seekToPosition(value);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.navigate_before_rounded, size: 55, color: Appcolors.whiet),
                  onPressed: controller.previousTrack,
                ),
                Obx(
                  () => IconButton(
                    color: Appcolors.whiet,
                    icon: Icon(
                      controller.isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      size: 60,
                    ),
                    onPressed: () {
                      if (controller.isPlaying.value) {
                        controller.pauseMusic();
                      } else if (controller.isPaused.value) {
                        controller.resumeMusic();
                      } else {
                        controller.playMusic();
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.navigate_next_rounded, size: 60, color: Appcolors.whiet),
                  onPressed: controller.nextTrack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => IconButton(
                    icon: Icon(
                      controller.isFavorite() ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      size: 30,
                      color: controller.isFavorite() ? Color(0xff3A2044) : Appcolors.whiet,
                    ),
                    onPressed: controller.toggleFavorite,
                  ),
                ),
                Obx(
                  () => IconButton(
                    icon: Icon(
                      controller.isRepeatEnabled.value ? Icons.repeat_rounded : Icons.repeat_one_rounded,
                      size: 30,
                      color: controller.isRepeatEnabled.value ? Color(0xff3A2044) : Appcolors.whiet,
                    ),
                    onPressed: controller.toggleRepeat,
                  ),
                ),
                Obx(
                  () => DropdownButton<double>(
                    value: controller.playbackSpeed.value,
                    dropdownColor: Appcolors.brawen,
                    style: TextStyle(color: Appcolors.whiet),
                    items: [0.5, 1.0, 1.5, 2.0].map((speed) {
                      return DropdownMenuItem<double>(
                        value: speed,
                        child: Text("${speed}x", style: TextStyle(color: Appcolors.whiet)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        controller.setPlaybackSpeed(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(width / 5),
                topLeft: Radius.circular(width / 5),
              ),
              child: Image.asset(
                Appimgs.logo3,
                width: width / 1.2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (controller.currentIndex.value < controller.music.length)
                  Text(
                    "${controller.music[controller.currentIndex.value].name_ar}",
                    style: Appfonts.fontlogo.copyWith(fontSize: width / 14),
                  ),
                if (controller.isPlaying.value)
                  MiniMusicVisualizer(
                    animate: true,
                    color: Color(0xff3A2044),
                    width: 4,
                    height: 15,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}