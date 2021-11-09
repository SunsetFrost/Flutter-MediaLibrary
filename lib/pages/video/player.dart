import 'package:flutter/material.dart';

import 'package:media_library/widgets/video_player.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayerScreen(),
    );
  }
}
