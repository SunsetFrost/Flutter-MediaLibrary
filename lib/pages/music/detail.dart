import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/MusicTrack.dart';
import 'package:media_library/net/music_data.dart';

class MusicDetail extends StatelessWidget {
  const MusicDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Track>>(
        future: MusicData.getTrackList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DetailPage(tracks: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
              child: SwordLoading(
            loadColor: Colors.white,
            size: 60,
          ));
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.tracks}) : super(key: key);

  final List<Track> tracks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tracks[index].name),
          subtitle: Text(tracks[index].artists[0].name),
        );
      },
    );
  }
}
