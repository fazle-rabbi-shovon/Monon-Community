import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../route/navigation_service.dart';
import '../../util/color_util.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String url;
  final String imagePath;
  final String duration;

  const VideoPlayerScreen({
    Key? key,
    required this.title,
    required this.url,
    required this.imagePath,
    required this.duration,
  }) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isControlsVisible = true;
  bool _wasPlayingBeforeHide = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(Duration position) {
    final minutes = position.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = position.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _toggleControls() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(widget.title, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            _controller.value.isInitialized
                ? GestureDetector(
              onTap: _toggleControls,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    if (_isControlsVisible)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!_controller.value.isPlaying)
                            IconButton(
                              icon: const Icon(Icons.fast_rewind, size: 36, color: ColorUtil.mainColor),
                              onPressed: () {
                                _controller.seekTo(
                                  _controller.value.position - const Duration(seconds: 10),
                                );
                              },
                            ),
                          IconButton(
                            iconSize: 48,
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle,
                              color: ColorUtil.mainColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                          if (!_controller.value.isPlaying)
                            IconButton(
                              icon: const Icon(Icons.fast_forward, size: 36, color: ColorUtil.mainColor),
                              onPressed: () {
                                _controller.seekTo(
                                  _controller.value.position + const Duration(seconds: 10),
                                );
                              },
                            ),
                        ],
                      ),
                    Positioned(
                      bottom: 8,
                      left: 12,
                      child: Text(
                        _formatTime(_controller.value.position),
                        style: const TextStyle(color: ColorUtil.mainColor, fontSize: 12),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 12,
                      child: Text(
                        _formatTime(_controller.value.duration),
                        style: const TextStyle(color: ColorUtil.mainColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            )
                : const CircularProgressIndicator(),
            Slider(
              value: _controller.value.position.inSeconds.toDouble(),
              min: 0,
              max: _controller.value.duration.inSeconds.toDouble(),
              onChanged: (value) {
                _controller.seekTo(Duration(seconds: value.toInt()));
              },
              activeColor: ColorUtil.mainColor,
              inactiveColor: Colors.grey,
            ),
            const SizedBox(height: 10),
            const Text(
              "Self-awareness is your ability to perceive and understand the things that make you who you are",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 18)),
      centerTitle: true,
      backgroundColor: ColorUtil.primary,
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
    );
  }
}
