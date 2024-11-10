import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignmentapp/Features/Pages/BookMarkScreen/BookMarkBloc/Bookmaarkbloc.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';
import 'package:photo_view/photo_view.dart';

@RoutePage()
class FullImageScreen extends StatelessWidget {
  final ImageModel image;

  const FullImageScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookmarkBloc = context.read<BookmarkBloc>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<BookmarkBloc, List<ImageModel>>(
            builder: (context, bookmarks) {
              final isBookmarked = bookmarks.any((i) => i.id == image.id);
              return IconButton(
                icon:
                    Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                onPressed: () {
                  if (isBookmarked) {
                    bookmarkBloc.removeBookmark(image.id);
                  } else {
                    bookmarkBloc.addBookmark(image);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: PhotoView(
        imageProvider: NetworkImage(image.url),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
