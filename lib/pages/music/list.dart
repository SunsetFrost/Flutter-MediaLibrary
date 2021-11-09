import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/model/MusicAlbum.dart';
import 'package:media_library/net/music_data.dart';
import 'package:media_library/pages/music/routes.dart' as routes;

class MusicList extends StatelessWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(routes.detailRoute,
                  arguments:
                      routes.DetailArguments(int.parse(albums[index].id)));
            },
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(albums[index].images[1].url),
                          fit: BoxFit.contain),
                    )),
                Text(
                  albums[index].name,
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
