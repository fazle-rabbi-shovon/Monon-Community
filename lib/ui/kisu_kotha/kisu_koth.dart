import 'package:flutter/material.dart';

import '../../route/navigation_service.dart';
import '../../util/color_util.dart';
import '../../util/image_util.dart';

class KisuKotha extends StatefulWidget {
  const KisuKotha({super.key});

  @override
  State<KisuKotha> createState() => _KisuKothaState();
}

class _KisuKothaState extends State<KisuKotha> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildAudioFolder(context, "জানবো ও চর্চা করবো", 1),
            _buildAudioFolder(context, "ব্যায়াম বা শরীরচর্চা করি", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioFolder(
      BuildContext context, String title, int folderNumber) {
    return GestureDetector(
      onTap: () {
        if(folderNumber == 1){
          NavigationService.getCurrentState()
              ?.pushNamed('/janbo');
        }else{
          NavigationService.getCurrentState()
              ?.pushNamed('/bayam');
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                ImageUtil.AUDIO_IMAGE, scale: 10.0,), // Replace with your image asset
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text(
        // getTranslated(context, "LEAVE_APPLY"),
        "বুদ্ধিমত্তা ও আবেগ",
        style: TextStyle(
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
