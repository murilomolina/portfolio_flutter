import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoManager extends StatefulWidget {
  final String videoPath;
  const VideoManager({super.key, required this.videoPath});

  @override
  State<VideoManager> createState() => _VideoManagerState();
}

class _VideoManagerState extends State<VideoManager> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(widget.videoPath),
      // videoPlayerController: VideoPlayerController.networkUrl(widget.videoPath as Uri),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: FlickVideoWithControls(
        controls: FlickPortraitControls(
          progressBarSettings: FlickProgressBarSettings(
            playedColor: Colors.red, // Cor personalizada da barra de progresso
            handleColor: Colors.red, // Cor personalizada do "handle" (indicador de posição)
          ),
        ),
      ),
    );
  }
}