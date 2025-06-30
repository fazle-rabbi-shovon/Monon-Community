import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../route/navigation_service.dart';
import '../../services/activity_service.dart';
import '../../util/color_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class WrittenDocumentsPlayer extends StatefulWidget {
  final String title;
  final String url;
  final int index;

  const WrittenDocumentsPlayer({
    Key? key,
    required this.title,
    required this.url,
    required this.index
  }) : super(key: key);

  @override
  State<WrittenDocumentsPlayer> createState() => _WrittenDocumentsPlayerState();
}

class _WrittenDocumentsPlayerState extends State<WrittenDocumentsPlayer> {
  late VideoPlayerController _controller;
  bool _isControlsVisible = true;
  bool _isInitialized = false;
  Duration watchedDuration = Duration.zero;
  bool hasSavedToFirebase = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
           _isInitialized = true;
        });
      });
    _controller.addListener(() {
      setState(() {});
    });

    _controller.addListener(() {
      if (_controller.value.isPlaying && _isInitialized) {
        watchedDuration = _controller.value.position;

        if (!hasSavedToFirebase && watchedDuration >= const Duration(seconds: 30)) {
          hasSavedToFirebase = true;
          _saveVideoWatchedToFirebase();
        }
      }

      setState(() {});
    });

  }

  Future<void> _saveVideoWatchedToFirebase() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final now = DateTime.now();
    final formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    final docRef = FirebaseFirestore.instance
        .collection('kisu_kotha')
        .doc(uid)
        .collection(formattedDate)
        .doc(widget.title); // Using video title as unique doc

    await docRef.set({
      "দেখা হয়েছে": "হ্যাঁ",
      "watchedAt": FieldValue.serverTimestamp(),
    });

    /// ✅ Mark kisu_kotha activity complete locally in Hive
    await ActivityService().markCompleted('kisu_kotha', widget.index);
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
            const SizedBox(height: 24),
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: _isInitialized
                ? GestureDetector(
                  onTap: _toggleControls,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      if (_isControlsVisible)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.fast_rewind, size: 36, color: ColorUtil.mainColor),
                              onPressed: () {
                                _controller.seekTo(_controller.value.position - const Duration(seconds: 10));
                              },
                            ),
                            IconButton(
                              iconSize: 48,
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
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
                            IconButton(
                              icon: const Icon(Icons.fast_forward, size: 36, color: ColorUtil.mainColor),
                              onPressed: () {
                                _controller.seekTo(_controller.value.position + const Duration(seconds: 10));
                              },
                            ),
                          ],
                        ),
                      if (_isControlsVisible) ...[
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
                    ],
                  ),
                ) :
                const Center(child: CircularProgressIndicator()),
              ),
            const SizedBox(height: 10),
            Slider(
              value: _isInitialized
                  ? _controller.value.position.inSeconds.toDouble()
                  : 0,
              min: 0,
              max: _isInitialized
                  ? _controller.value.duration.inSeconds.toDouble()
                  : 1,
              onChanged: _isInitialized
                  ? (value) {
                _controller.seekTo(Duration(seconds: value.toInt()));
              }
                  : null,
              activeColor: ColorUtil.mainColor,
              inactiveColor: Colors.grey,
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
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          NavigationService.getCurrentState()?.pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            NavigationService.getCurrentState()?.pop();
          },
        ),
      ],
    );
  }
}
