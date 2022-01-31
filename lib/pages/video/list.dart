import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:media_library/bloc/list_bloc.dart';
import 'package:library_repository/library_repository.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/pages/video/routes.dart' as routes;
import 'package:media_library/widgets/common_card.dart';
import 'package:media_library/widgets/search_filter.dart';

class VideoListPage extends StatelessWidget {
  const VideoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // create: (_) => VideoBloc()..add(VideoFetchPopular()),
      // create: (_) => ListBloc(libraryRepository: libraryRepository),
      child: Center(child: Text('refactor')),
    );
  }
}

// class VideoList extends StatefulWidget {
//   const VideoList({Key? key}) : super(key: key);

//   @override
//   State<VideoList> createState() => _VideoListState();
// }

// class _VideoListState extends State<VideoList> {
//   late ScrollController _scrollController;
//   String searchText = '';
//   Map<String, String> params = {};

//   static const filterData = {
//     'sort': ['popular', 'release', 'vote'],
//     'type': ['all', 'r', 'nc-17'],
//   };

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController()..addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VideoBloc, VideoState>(builder: (context, state) {
//       switch (state.status) {
//         case VideoStatus.failure:
//           return Center(
//             child: Icon(Icons.error, color: Colors.white),
//           );
//         case VideoStatus.success:
//           return Scaffold(
//             body: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: RadialGradient(
//                       colors: [Color(0xFF3F3F3F), Color(0xFF181818)],
//                       center: Alignment(0.6, -0.3),
//                     ),
//                   ),
//                 ),
//                 Container(
//                     padding: EdgeInsets.only(
//                         top: MediaQuery.of(context).padding.top),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         VideoSearchForm(
//                           searchCallback: onSearchCallback,
//                         ),
//                         SearchFilter(
//                           filterData: filterData,
//                           onFilterSelected: (val) {
//                             setState(() {
//                               params = val;
//                             });
//                             onFilterCallback(val);
//                           },
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Expanded(
//                           child: _VideoGrid(
//                             videos: state.videos,
//                             scrollController: _scrollController,
//                           ),
//                         ),
//                       ],
//                     )),
//               ],
//             ),
//           );
//         default:
//           return const Center(
//             child: SwordLoading(
//               loadColor: Colors.white,
//               size: 60,
//             ),
//           );
//       }
//     });
//   }

//   void _scrollListener() {
//     if (_isBottom) {
//       /// search text is null, fetch popular movies
//       /// isn't null, fetch search movies
//       if (searchText == '') {
//         context.read<VideoBloc>().add(VideoFetchPopular(params: params));
//       } else {
//         context.read<VideoBloc>().add(VideoFetchSearch(searchText));
//       }
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }

//   void onSearchCallback(String? query) {
//     setState(() {
//       searchText = query!;
//     });
//     if (query == '') {
//       context.read<VideoBloc>().add(VideoFetchPopular(params: params));
//     } else {
//       context.read<VideoBloc>().add(VideoFetchSearch(query!));
//     }
//   }

//   void onFilterCallback(Map<String, String>? params) {
//     if (searchText == '') {
//       context.read<VideoBloc>().add(VideoFetchPopular(params: params));
//     } else {
//       context.read<VideoBloc>().add(VideoFetchSearch(searchText));
//     }
//   }
// }

// class _VideoGrid extends StatelessWidget {
//   const _VideoGrid(
//       {Key? key, required this.videos, required this.scrollController})
//       : super(key: key);

//   final List<Video> videos;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
//       controller: scrollController,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20.0,
//         childAspectRatio: 0.55,
//       ),
//       itemCount: videos.length,
//       itemBuilder: (context, index) {
//         return _VideoGridItem(video: videos[index]);
//       },
//     );
//   }
// }

// class _VideoGridItem extends StatelessWidget {
//   const _VideoGridItem({Key? key, required this.video}) : super(key: key);

//   final Video video;

//   @override
//   Widget build(BuildContext context) {
//     return CommonCard(
//       name: video.title,
//       imagePath: VideoData.getImagePath(video.posterPath),
//       aspect: 1.3,
//       // onClick: () => {
//       //   Navigator.of(context).pushNamed(routes.detailRoute,
//       //       arguments: routes.DetailArguments(video.id)),
//       // },
//     );
//   }
// }

// class VideoSearchForm extends StatefulWidget {
//   const VideoSearchForm({Key? key, required this.searchCallback})
//       : super(key: key);

//   final Function(String?) searchCallback;

//   @override
//   _VideoSearchFormState createState() => _VideoSearchFormState();
// }

// class _VideoSearchFormState extends State<VideoSearchForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.0),
//       child: Form(
//         key: _formKey,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Expanded(
//               child: TextFormField(
//                 cursorColor: Colors.white,
//                 style: TextStyle(color: Color(0xff9ca3af), fontSize: 14.0),
//                 decoration: const InputDecoration(
//                   hintText: '请输入搜索的电影名',
//                   hintStyle:
//                       TextStyle(color: Color(0xff9ca3af), fontSize: 14.0),
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(16))),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(width: 0.0),
//                     borderRadius: const BorderRadius.all(Radius.circular(16)),
//                   ),
//                   filled: true,
//                   fillColor: Color(0xFF3F3F3F),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Color(0xffe5e7eb),
//                   ),
//                 ),
//                 // validator: (String? value) {
//                 //   if (value == null || value.isEmpty) {
//                 //     return '请输入名称';
//                 //   }
//                 //   return null;
//                 // },
//                 onSaved: (String? value) {
//                   widget.searchCallback(value);
//                 },
//                 onEditingComplete: () {
//                   _formKey.currentState!.save();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
