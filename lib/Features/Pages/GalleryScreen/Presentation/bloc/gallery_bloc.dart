import 'package:bloc/bloc.dart';
import 'package:flutterassignmentapp/Core/Error/failure.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Reposstoryimp/GalleryImageRepoimp.dart';
import 'package:meta/meta.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  // ignore: non_constant_identifier_names
  final int per_page = 6;
  final Galleryimagerepoimp galleryimagerepoimp;
  GalleryBloc({required this.galleryimagerepoimp}) : super(GalleryInitial()) {
    on<GalleryEvent>((event, emit) async {
      if (event is GalleryImageLoadEvent) {
        try {
          final currentState = state;
          List<ImageModel> oldPhotos = [];
          if (currentState is GalleryImageLodedState) {
            oldPhotos = currentState.images;
          }

          final failureorSucces = await galleryimagerepoimp.fetchGalleryimages(
              event.page, per_page);
          failureorSucces.fold(
              (failure) => emit(GalleryImageErrorState(
                  message: ((failure as ServerFailure).message))), (success) {
            final newphotos = [...oldPhotos, ...success];
            emit(GalleryImageLodedState(
                images: newphotos, hasReachedMax: success.isEmpty));
          });
        } catch (e) {
          emit(GalleryImageErrorState(message: "$e"));
        }
      }
    });
  }
}
