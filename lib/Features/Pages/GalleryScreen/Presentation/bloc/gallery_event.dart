part of 'gallery_bloc.dart';

@immutable
sealed class GalleryEvent {}

final class GalleryImageLoadEvent extends GalleryEvent {
  final int page;

  GalleryImageLoadEvent({required this.page});
}
