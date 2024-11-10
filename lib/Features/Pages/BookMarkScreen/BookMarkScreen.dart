import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterassignmentapp/Features/Pages/BookMarkScreen/BookMarkBloc/Bookmaarkbloc.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';

@RoutePage()

class Bookmarkscreen extends StatefulWidget {
  const Bookmarkscreen({super.key});

  @override
  State<Bookmarkscreen> createState() => _BookmarkscreenState();
}

class _BookmarkscreenState extends State<Bookmarkscreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked Images')),
      body: BlocBuilder<BookmarkBloc, List<ImageModel>>(
        builder: (context, bookmarks) {
          if (bookmarks.isEmpty) {
            return const Center(child: Text('No Bookmarks'));
          }
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final image = bookmarks[index];
              return Image.network(image.url, fit: BoxFit.cover);
            },
          );
        },
      ),
    );
  }
}