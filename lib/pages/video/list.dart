import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/Video.dart';
import 'package:media_library/net/video_data.dart';
import 'package:media_library/pages/video/routes.dart' as routes;

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
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(routes.detailRoute,
                  arguments: routes.DetailArguments(videos[index].id));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * 1.4,
                    margin: EdgeInsets.only(bottom: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(VideoData.getImagePath(
                              relativePath: videos[index].posterPath)),
                          fit: BoxFit.fill),
                    )),
                Text(
                  videos[index].title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          );
          // Container(
          //   width: MediaQuery.of(context).size.width / 3.8,
          //   color: Colors.blueAccent,
          //   child: Text(index.toString()),
          // );
        });
  }
}
