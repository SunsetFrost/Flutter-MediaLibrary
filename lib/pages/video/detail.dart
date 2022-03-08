import 'package:flutter/material.dart';
import 'package:library_repository/library_repository.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/utils/cache_data.dart';
import 'package:media_library/pages/video/routes.dart';
import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/pages/video/player.dart';

class VideoDetail extends StatelessWidget {
  VideoDetail({Key? key, required this.args})
      : _repo = LibraryRepository(baseUrl: backendURI, type: APIType.movie),
        super(key: key);

  final DetailArguments args;
  final LibraryRepository _repo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _repo.getDetail(args.id.toString()),
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

  final Video video;

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

  void onFavorClick() {
    if (_isFavored) {
      // cancel favor
      GlobleCacheData.favorVideos
          .removeWhere((element) => element.id == widget.video.id);
      GlobleCacheData.saveVideos();
    } else {
      // add favor
      GlobleCacheData.favorVideos.add(widget.video);
    }
    GlobleCacheData.saveVideos();
    setState(() {
      _isFavored = !_isFavored;
    });
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
                  image: NetworkImage(this.widget.video.posterPath),
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
                          // Poster
                          Hero(
                              tag: widget.video.posterPath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  this.widget.video.posterPath,
                                  fit: BoxFit.cover,
                                ),
                              )),

                          // favor
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              child: Icon(Icons.favorite),
                              onPressed: onFavorClick,
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
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 16.0,
                                  ),
                                  Text(
                                    widget.video.voteAverage.toString(),
                                    style: _getInlineTextStyle(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.grey,
                                    size: 16.0,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    widget.video.releaseDate,
                                    style: _getInlineTextStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.video.overview,
                            textAlign: TextAlign.left,
                            style: _getInlineTextStyle(),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
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
      color: Colors.grey[350],
      fontSize: 14,
    );

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.text,
    this.color = Colors.grey,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
