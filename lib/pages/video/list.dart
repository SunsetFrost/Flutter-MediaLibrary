import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/Video.dart';
import 'package:media_library/net/video_data.dart';
import 'package:media_library/pages/video/routes.dart' as routes;
import 'package:media_library/widgets/common_card.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xFF3F3F3F), Color(0xFF181818)],
                center: Alignment(0.6, -0.3),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: FutureBuilder<List<Video>>(
              future: VideoData.getVideoList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return VideoGrid(videos: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Icon(Icons.error);
                }
                return const Center(
                  child: SwordLoading(
                    loadColor: Colors.white,
                    size: 60,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoGrid extends StatelessWidget {
  const VideoGrid({Key? key, required this.videos}) : super(key: key);

  final List<Video> videos;

  @override
  Widget build(BuildContext context) {
    // void onClick = () {
    //             Navigator.of(context).pushNamed(routes.detailRoute,
    //                 arguments: routes.DetailArguments(videos[index].id));
    // }

    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.55,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return CommonCard(
            name: videos[index].title,
            imagePath: VideoData.getImagePath(videos[index].posterPath),
            onClick: () => {
              Navigator.of(context).pushNamed(routes.detailRoute,
                  arguments: routes.DetailArguments(videos[index].id)),
            },
          );
        });
  }
}
