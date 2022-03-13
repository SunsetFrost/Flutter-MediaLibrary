import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:media_library/bloc/list_bloc.dart';
import 'package:library_repository/library_repository.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/widgets/common_card.dart';
import 'package:media_library/widgets/common_list.dart';
import 'package:media_library/pages/video/routes.dart' as routes;

class VideoListPage extends StatelessWidget {
  const VideoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc(
        libraryRepository:
            LibraryRepository(baseUrl: backendURI, type: APIType.movie),
      )..add(FetchRecommandList()),
      child: Scaffold(
        body: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
          final items = context.read<ListBloc>().state.items;
          return VideoLibrary(
            items: items,
          );
        }),
      ),
    );
  }
}

class VideoLibrary extends StatelessWidget {
  const VideoLibrary({Key? key, required this.items}) : super(key: key);

  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    print('is web' + kIsWeb.toString());
    return Stack(
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
          child: CommonList(
            items: items,
            fetchRecommandList: () {
              context.read<ListBloc>().add(FetchRecommandList());
            },
            fetchSearchList: (searchText) {
              context.read<ListBloc>().add(FetchSearchList(searchText));
            },
            cardBuilder: (context, index) {
              return CommonCard(
                name: items[index].title,
                imagePath: items[index].posterPath,
                aspect: 1.3,
                onClick: () {
                  Navigator.of(context).pushNamed(routes.detailRoute,
                      arguments: routes.DetailArguments(
                        items[index].id,
                        items[index].posterPath,
                      ));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
