import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Duration totalDuration;
  late Duration currentPosition;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/test_monon_video_new.mp4')
      ..initialize().then((_) {
        totalDuration = _controller.value.duration;
        setState(() {}); // Update UI when the video is loaded
      })
      ..addListener(() {
        setState(() {
          currentPosition = _controller.value.position;
        });
      })
      ..setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Self-awareness",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(_controller),
                Positioned(
                  bottom: 30,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(currentPosition),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            _formatDuration(totalDuration),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: currentPosition.inSeconds.toDouble(),
                        max: totalDuration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _controller.seekTo(Duration(seconds: value.toInt()));
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _controller.seekTo(_controller.value.position - Duration(seconds: 10));
                        },
                        icon: Icon(Icons.replay_10, color: Colors.white, size: 36),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _controller.seekTo(_controller.value.position + Duration(seconds: 10));
                        },
                        icon: Icon(Icons.forward_10, color: Colors.white, size: 36),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
              : CircularProgressIndicator(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Self-awareness is your ability to perceive and understand the things that make you who you are",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),

    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  _appbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
      leading: Container(
        child: const Center(),
      ),
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "Video",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      backgroundColor: ColorUtil.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
    );
  }
}
