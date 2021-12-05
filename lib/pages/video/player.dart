import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/widgets/video_player.dart';
import 'package:media_library/model/VideoTrailer.dart';
import 'package:media_library/net/video_data.dart';
import 'package:media_library/pages/video/routes.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            VideoPlayerScreen(),
            FutureBuilder<VideoTrailer>(
                future: VideoData.getVideoTrailer(args.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TrailerPlayer(trailer: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(
                      child: SwordLoading(
                    loadColor: Colors.white,
                    size: 60,
                  ));
                })
          ],
        ),
      ),
    );
  }
}

class TrailerPlayer extends StatefulWidget {
  TrailerPlayer({Key? key, required this.trailer}) : super(key: key);

  final VideoTrailer trailer;

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailer.key,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
    );
  }
}
