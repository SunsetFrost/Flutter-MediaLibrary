import 'package:flutter/material.dart';

import 'package:pokemon/widgets/sword_paint.dart';
import 'package:pokemon/model/VideoDetail.dart';
import 'package:pokemon/pages/video/routes.dart';
import 'package:pokemon/net/video_data.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<VideoInfo>(
          future: VideoData.getVideoDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DetailPage(video: snapshot.data!);
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
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.video}) : super(key: key);

  final VideoInfo video;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(video.overview));
  }
}
