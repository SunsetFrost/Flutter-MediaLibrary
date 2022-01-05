import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/utils/cache_data.dart';
import 'package:media_library/net/video_data.dart';
import 'package:media_library/pages/video/routes.dart';
import 'package:media_library/model/VideoDetail.dart';
import 'package:media_library/pages/video/player.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key, required this.args}) : super(key: key);

  final DetailArguments args;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VideoInfo>(
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      VideoData.getImagePath(this.widget.video.posterPath)),
                  fit: BoxFit.cover,
                  // add opacity
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.srcOver),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Player(id: widget.video.id.toString()),
                    Container(
                      width: 155,
                      height: 232,
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 32.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(20),
                          //   child: Image.network(
                          //     VideoData.getImagePath(
                          //         this.widget.video.posterPath),
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          /// Poster
                          Hero(
                            tag: 'Poster' + widget.video.title,
                            child: Image.network(
                              VideoData.getImagePath(
                                  this.widget.video.posterPath),
                              fit: BoxFit.cover,
                            ),
                          ),

                          /// favor
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              child: Icon(Icons.favorite),
                              onPressed: () {
                                if (_isFavored) {
                                  // cancel favor
                                  GlobleCacheData.favorVideos.removeWhere(
                                      (element) =>
                                          element.id == widget.video.id);
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
                                  primary:
                                      _isFavored ? Colors.red : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Text(
                            widget.video.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '评分: ' + widget.video.voteAverage.toString(),
                                style: _getInlineTextStyle(),
                              ),
                              Text(
                                '发行日期: ' + widget.video.releaseDate,
                                style: _getInlineTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.video.overview,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pushNamed(playerRoute,
                    //         arguments: DetailArguments(widget.video.id));
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [Icon(Icons.play_arrow), Text('播放')],
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     fixedSize: Size(100, 30),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _getInlineTextStyle() => TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
