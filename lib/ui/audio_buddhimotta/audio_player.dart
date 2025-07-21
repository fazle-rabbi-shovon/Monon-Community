import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../route/navigation_service.dart';
import '../../services/activity_service.dart';
import '../../util/color_util.dart';
import 'audio_widget.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.title,
    required this.url,
    required this.imagePath,
    required this.duration,
    required this.type,
    required this.index,
  });

  final String title;
  final String url;
  final String imagePath;
  final String duration;
  final String type;
  final int index;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  bool isLoading = true;
  Duration listenedDuration = Duration.zero;
  bool hasSavedToFirebase = false;

  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  final List<Widget> _eiWidgets = [
    AudioWidgets.emotionalIntelligenceInfo,
    AudioWidgets.selfAwarenessWidget,
    AudioWidgets.selfRegulationWidget,
    AudioWidgets.motivationWidget,
    AudioWidgets.empathyWidget,
    AudioWidgets.socialSkillsWidget,
  ];

  final List<Widget> _emotionWidgets = [
    AudioWidgets.anxietyWidget,
    AudioWidgets.fearWidget,
    AudioWidgets.angerWidget,
    AudioWidgets.sadnessWidget,
    AudioWidgets.disgustWidget,
    AudioWidgets.joyWidget,
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.setUrl(widget.url).then((_) {
      setState(() {
        _duration = _audioPlayer.duration ?? Duration.zero;
      });
    });

    _audioPlayer.positionStream.listen((pos) {
      setState(() => _position = pos);
    });

    _audioPlayer.positionStream.listen((pos) {
      setState(() => _position = pos);

      listenedDuration = pos;

      if (!hasSavedToFirebase &&
          listenedDuration >= const Duration(seconds: 70)) {
        hasSavedToFirebase = true;
        _saveAudioListenedToFirebase();
      }
    });
  }

  Future<void> _saveAudioListenedToFirebase() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final now = DateTime.now();
    final formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    final docRef = FirebaseFirestore.instance
        .collection('buddhimotta_o_abeg')
        .doc(uid)
        .collection(formattedDate)
        .doc(widget.title);

    await docRef.set({
      "শুনেছে": "হ্যাঁ",
      "listenedAt": FieldValue.serverTimestamp(),
    });

    /// ✅ Mark buddhimotta1/buddhimotta2 activity complete locally in Hive
    await ActivityService().markCompleted(widget.type, widget.index);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatTime(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Image.asset(widget.imagePath, height: 180),
              const SizedBox(height: 30),
              // Slider
              Slider(
                activeColor: ColorUtil.mainColor,
                inactiveColor: Colors.grey,
                value: _position.inSeconds.toDouble(),
                min: 0,
                max: _duration.inSeconds.toDouble(),
                onChanged: (value) async {
                  final newPosition = Duration(seconds: value.toInt());
                  await _audioPlayer.seek(newPosition);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatTime(_position),
                      style: const TextStyle(fontSize: 12)),
                  Text(_formatTime(_duration),
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 10),

              // Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.fast_rewind,
                      size: 36, color: ColorUtil.mainColor),
                  IconButton(
                    iconSize: 48,
                    color: ColorUtil.mainColor,
                    icon: StreamBuilder<PlayerState>(
                      stream: _audioPlayer.playerStateStream,
                      builder: (context, snapshot) {
                        final playerState = snapshot.data;
                        final playing = playerState?.playing;
                        final processingState = playerState?.processingState;

                        if (playing != true) {
                          return const Icon(Icons.play_circle_fill);
                        } else if (processingState != ProcessingState.completed) {
                          return const Icon(Icons.pause_circle_filled);
                        } else {
                          return const Icon(Icons.replay_circle_filled);
                        }
                      },
                    ),
                    onPressed: () {
                      if (_audioPlayer.playing) {
                        _audioPlayer.pause();
                      } else {
                        _audioPlayer.play();
                      }
                    },
                  ),
                  const Icon(Icons.fast_forward,
                      size: 36, color: ColorUtil.mainColor),
                ],
              ),
              const SizedBox(height: 10),
              (widget.type == "buddhimotta1")? _eiWidgets[widget.index] : _emotionWidgets[widget.index],
            ],
          ),
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: Text(
        // getTranslated(context, "LEAVE_APPLY"),
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
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
