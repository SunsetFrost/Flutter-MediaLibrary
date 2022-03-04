import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:moviedb_api/moviedb_api.dart';
import 'package:media_library/constants.dart';
import 'package:media_library/widgets/sword_paint.dart';

class Player extends StatelessWidget {
  Player({Key? key, required this.id})
      : _client = MoviedbAPIClient(baseUrl: backendURI),
        super(key: key);

  final String id;
  final MoviedbAPIClient _client;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 16 * 9,
      child: FutureBuilder<List<dynamic>>(
          future: _client.getVideoTrailer(id),
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
          }),
    );
  }
}

class TrailerPlayer extends StatefulWidget {
  TrailerPlayer({Key? key, required this.trailer}) : super(key: key);

  final List<dynamic> trailer;

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailer[0].key,
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
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.amber,
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        actionsPadding: EdgeInsets.all(0.0),
        bufferIndicator: SwordLoading(
          loadColor: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
