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
      body: Center(
        child: RssBuilder(rssFeed: rssFeed),
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
      itemCount: rssList.length,
      itemExtent: 54.0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(rssList[index].title!),
          subtitle: Text(rssList[index].link!),
          onTap: () {
            launch(rssList[index].link!);
          },
        );
      },
    );
  }
}
