import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:library_repository/library_repository.dart';

import 'package:spotify_api/spotify_api.dart';
import 'package:media_library/constants.dart';
import 'package:media_library/utils/cache_data.dart';
import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/pages/music/routes.dart';

class MusicDetail extends StatefulWidget {
  MusicDetail({Key? key, required this.args})
      : _repo = LibraryRepository(baseUrl: backendURI, type: APIType.music),
        super(key: key);

  final DetailArguments args;
  final LibraryRepository _repo;

  @override
  State<MusicDetail> createState() => _MusicDetailState();
}

class _MusicDetailState extends State<MusicDetail> {
  late Future<dynamic> futureTracks;
  List<Track> tracks = [];
  AudioPlayer _audioPlayer = AudioPlayer();
  int _playIndex = 0;
  bool _isPlaying = false;
  bool _isFavored = false;

  @override
  void initState() {
    futureTracks = widget._repo.getDetail(widget.args.album.id);
    // init player
    _audioPlayer = AudioPlayer();

    // init favor
    GlobleCacheData.favorMusics.forEach((element) {
      if (element.id == widget.args.album.id) {
        _isFavored = true;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(trackIndex) async {
    setState(() {
      _playIndex = trackIndex;
    });
    if (tracks[_playIndex].previewUrl != null) {
      await _audioPlayer.setUrl(tracks[_playIndex].previewUrl!);
      _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
    } else {
      // alert don't have online preview
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('预览地址不存在！'),
        ),
      );
    }
  }

  void _pauseAudio() {
    _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void onFavorClick() {
    if (_isFavored) {
      // cancel favor
      GlobleCacheData.favorMusics
          .removeWhere((element) => element.id == widget.args.album.id);
    } else {
      // add favor
      GlobleCacheData.favorMusics.add(widget.args.album);
    }
    GlobleCacheData.saveMusics();
    setState(() {
      _isFavored = !_isFavored;
    });
    print(GlobleCacheData.favorMusics);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20.0,
              bottom: 20.0,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                  color: Colors.black54,
                ),
              ],
            ),
            child: Stack(
              children: [
                Hero(
                  tag: widget.args.album.images[1].url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      args.album.images[1].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Icon(Icons.favorite),
                    onPressed: onFavorClick,
                    style: TextButton.styleFrom(
                        primary: _isFavored ? Colors.red : Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {
                  _isPlaying ? _pauseAudio() : _playAudio(_playIndex);
                },
                icon: Icon(
                  _isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  color: Colors.black54,
                  size: 36.0,
                )),
          ),
          Expanded(
            child: FutureBuilder<dynamic>(
              future: futureTracks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  tracks = snapshot.data!;
                  return DetailPage(
                    tracks: snapshot.data!,
                    playAudio: _playAudio,
                  );
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
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.tracks,
    required this.playAudio,
  }) : super(key: key);

  final List<Track> tracks;
  final Function playAudio;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _trackTapped(index) {
    widget.playAudio(index);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tracks.length,
      itemExtent: 54.0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.tracks[index].name),
          subtitle: Text(widget.tracks[index].artists[0].name),
          onTap: () {
            _trackTapped(index);
          },
        );
      },
    );
  }
}
