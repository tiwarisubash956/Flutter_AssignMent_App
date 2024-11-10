import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterassignmentapp/Configuration/routes/app_router.gr.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Presentation/bloc/gallery_bloc.dart';

@RoutePage()
class PhotoGalleryPage extends StatefulWidget {
  const PhotoGalleryPage({Key? key}) : super(key: key);

  @override
  State<PhotoGalleryPage> createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  int page = 1;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<GalleryBloc>().add(GalleryImageLoadEvent(page: 1));
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      final bloc = context.read<GalleryBloc>();
      bloc.add(GalleryImageLoadEvent(page: page++));
    }
  }

  @override
  void dispose() {
    // Dispose of the PagingController to release resources
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state is GalleryImageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GalleryImageLodedState) {
            return GridView.builder(
              cacheExtent: 500,
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                final photo = state.images[index];
                return GestureDetector(
                  onDoubleTap: () {
                    context.router.push(FullImageRoute(image: photo));
                  },
                  child: Card(
                    child: CachedNetworkImage(
                      imageUrl: photo.url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Text("Loading Images"),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
            );
          } else if (state is GalleryImageErrorState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
