import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/Video.dart';
import 'package:media_library/net/video_data.dart';
import 'package:media_library/pages/video/routes.dart' as routes;
import 'package:media_library/widgets/common_card.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  late ScrollController _scrollController;
  late Future<List<Video>> _videos;
  bool isLoadingData = false;

  @override
  void initState() {
    super.initState();
    _videos = VideoData.getVideoList();
    _scrollController = ScrollController()..addListener(_scrollListener);
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

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
              future: _videos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildGrid(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Icon(Icons.error),
                  );
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

  Widget _buildGrid(List<Video> videos) {
    return RefreshIndicator(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.55,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return _buildGridItem(videos[index], context);
        },
      ),
      onRefresh: _refreshData,
    );
  }

  Widget _buildGridItem(Video video, BuildContext context) {
    return CommonCard(
      name: video.title,
      imagePath: VideoData.getImagePath(video.posterPath),
      onClick: () => {
        Navigator.of(context).pushNamed(routes.detailRoute,
            arguments: routes.DetailArguments(video.id)),
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 100.0 &&
        isLoadingData == false) {
      _loadMoreData();
    }
  }

  // pull top to refresh content
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    print('refresh invoke');
  }

  // pull bottom to load more
  void _loadMoreData() async {
    setState(() {
      print('start loading');
      isLoadingData = true;
    });
    List<Video> data = await VideoData.getVideoList();
    setState(() {
      print('end loading');
      _videos = VideoData.getVideoList(page: 2);
      isLoadingData = false;
    });
  }
}
