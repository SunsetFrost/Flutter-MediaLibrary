import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/widgets/common_card.dart';

import 'package:media_library/model/MusicAlbum.dart';
import 'package:media_library/net/music_data.dart';
import 'package:media_library/pages/music/routes.dart' as routes;

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.0, -1.0),
                end: const Alignment(0.0, 0.6),
                colors: <Color>[
                  const Color(0xFF3F3F3F),
                  const Color(0xFF181818)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: FutureBuilder<List<Album>>(
              future: MusicData.getAlbumList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MusicGrid(albums: snapshot.data!);
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

class MusicGrid extends StatelessWidget {
  const MusicGrid({Key? key, required this.albums}) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return CommonCard(
            name: albums[index].name,
            imagePath: albums[index].images[1].url,
            onClick: () => {
              Navigator.of(context).pushNamed(
                routes.detailRoute,
                arguments: routes.DetailArguments(
                  albums[index].id,
                  albums[index].images[1].url,
                ),
              ),
            },
          );
        });
  }
}
