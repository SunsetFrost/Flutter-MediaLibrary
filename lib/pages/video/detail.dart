import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/VideoDetail.dart';
import 'package:media_library/pages/video/routes.dart';
import 'package:media_library/net/video_data.dart';
import 'package:media_library/utils/cache_data.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key, required this.args}) : super(key: key);

  final DetailArguments args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<VideoInfo>(
        future: VideoData.getVideoDetail(args.id),
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
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.video}) : super(key: key);

  final VideoInfo video;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavored = false;

  @override
  void initState() {
    GlobleCacheData.favorVideos.forEach((element) {
      if (element.id == widget.video.id) {
        _isFavored = true;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                VideoData.getImagePath(widget.video.posterPath),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Icon(Icons.chevron_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(primary: Colors.white),
                  ),
                  TextButton(
                    child: Icon(Icons.favorite),
                    onPressed: () {
                      if (_isFavored) {
                        // cancel favor
                        GlobleCacheData.favorVideos.removeWhere(
                            (element) => element.id == widget.video.id);
                        GlobleCacheData.saveVideos();
                      } else {
                        // add favor
                        GlobleCacheData.favorVideos.add(widget.video);
                      }
                      GlobleCacheData.saveVideos();
                      print(GlobleCacheData.favorVideos);
                      setState(() {
                        _isFavored = !_isFavored;
                      });
                    },
                    style: TextButton.styleFrom(
                        primary: _isFavored ? Colors.red : Colors.white),
                  ),
                ],
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
                    VideoData.getImagePath(widget.video.posterPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                widget.video.title,
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
                widget.video.overview,
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
                  Navigator.of(context).pushNamed(playerRoute,
                      arguments: DetailArguments(widget.video.id));
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
