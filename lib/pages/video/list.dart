import 'package:flutter/material.dart';

import 'package:pokemon/widgets/sword_paint.dart';
import 'package:pokemon/model/Video.dart';
import 'package:pokemon/net/video_data.dart';
import 'package:pokemon/pages/video/routes.dart' as routes;

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
        padding: EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(routes.detailRoute,
                  arguments: routes.DetailArguments(videos[index].id));
            },
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * 1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/' +
                                videos[index].posterPath,
                          ),
                          fit: BoxFit.contain),
                    )),
                Text(
                  videos[index].title,
                  overflow: TextOverflow.ellipsis,
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
