import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class FullscreenVideoPlayer extends StatelessWidget {
  final VideoController controller;
  final Player player;
  final Future<void> Function()  onExitFullscreen;

  const FullscreenVideoPlayer({
    super.key,
    required this.controller,
    required this.player,
    required this.onExitFullscreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Video(
                controller: controller,
                onExitFullscreen: onExitFullscreen, // Callback when exiting full-screen
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: onExitFullscreen, // Trigger the exit action
            ),
          ),
          Positioned(
            child: IconButton(
              iconSize: 50,
              icon: Icon(
                player.state.playing
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill,
                color: Colors.white,
              ),
              onPressed: () {
                if (player.state.playing) {
                  player.pause();
                } else {
                  player.play();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
