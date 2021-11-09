import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/VideoDetail.dart';
import 'package:media_library/pages/video/routes.dart';
import 'package:media_library/net/video_data.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      body: FutureBuilder<VideoInfo>(
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
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.video}) : super(key: key);

  final VideoInfo video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                VideoData.getImagePath(relativePath: video.posterPath),
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.7),
        ),
        Container(
          padding: EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  child: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(primary: Colors.white),
                ),
              ),
              Container(
                width: 250,
                height: 300,
                margin: EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //     VideoData.getImagePath(relativePath: video.posterPath),
                  //   ),

                  // ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    VideoData.getImagePath(relativePath: video.posterPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                video.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                video.overview,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(playerRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.play_arrow), Text('播放')],
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 30),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
