part of 'gallery_bloc.dart';

@immutable
sealed class GalleryState {}

final class GalleryInitial extends GalleryState {}

final class GalleryImageLoadingState extends GalleryState {}

final class GalleryImageLodedState extends GalleryState {
  final bool hasReachedMax;

  final List<ImageModel> images;

  GalleryImageLodedState({required this.hasReachedMax, required this.images});
}

final class GalleryImageErrorState extends GalleryState {
  final String message;

  GalleryImageErrorState({required this.message});
}
