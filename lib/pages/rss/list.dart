import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rss_api/rss_api.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/widgets/sword_paint.dart';

class RssPage extends StatefulWidget {
  RssPage({Key? key})
      : rssAPIClient = RssAPIClient(baseUrl: rssURI),
        super(key: key);

  final RssAPIClient rssAPIClient;

  @override
  State<RssPage> createState() => _RssPageState();
}

class _RssPageState extends State<RssPage> {
  late Future<RssFeed> rssFeed;
  final String initRssPath = '/gcores/category/news';

  @override
  void initState() {
    setState(() {
      rssFeed = widget.rssAPIClient.getRssObject(initRssPath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              cursorColor: Color(0xff9ca3af),
              style: TextStyle(color: Color(0xff9ca3af), fontSize: 14.0),
              decoration: InputDecoration(
                hintText: '请输入Rss路径',
                hintStyle: TextStyle(color: Color(0xff9ca3af), fontSize: 14.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                filled: true,
                // fillColor: widget.color,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffe5e7eb),
                ),
              ),
              onSubmitted: (String? value) {
                setState(() {
                  rssFeed = widget.rssAPIClient.getRssObject(value!);
                });
              },
            ),
          ),
          Expanded(
            child: RssBuilder(rssFeed: rssFeed),
          )
        ],
      ),
      floatingActionButton: Ink(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.lightBlue,
        ),
        child: IconButton(
          onPressed: (() {
            launch('https://docs.rsshub.app/new-media.html');
          }),
          icon: Icon(Icons.hub_rounded),
          color: Colors.amber,
        ),
      ),
    );
  }
}

class RssBuilder extends StatelessWidget {
  const RssBuilder({Key? key, required this.rssFeed}) : super(key: key);

  final Future<RssFeed> rssFeed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RssFeed>(
      future: rssFeed,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RssList(rssList: snapshot.data!.items!);
        }
        return const Center(
          child: SwordLoading(
            loadColor: Colors.blueAccent,
            size: 60,
          ),
        );
      },
    );
  }
}

class RssList extends StatelessWidget {
  const RssList({Key? key, required this.rssList}) : super(key: key);

  final List<RssItem> rssList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: rssList.length,
      itemExtent: 80.0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(rssList[index].title!),
          subtitle: Text(rssList[index].link!),
          focusColor: Colors.grey[400],
          onTap: () {
            launch(rssList[index].link!);
          },
        );
      },
    );
  }
}
