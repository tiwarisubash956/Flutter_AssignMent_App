import 'package:dartz/dartz.dart';
import 'package:flutterassignmentapp/Core/Error/failure.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/DataSource/GalleryImageDataSource.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Domain/Repository/GalleryimagesRepo.dart';

class Galleryimagerepoimp implements Galleryimagesrepo {
  final GalleryImageDataSource galleryImageDataSource;

  Galleryimagerepoimp({required this.galleryImageDataSource});
  @override
  Future<Either<Failure, List<ImageModel>>> fetchGalleryimages(
      int page, int per_page) async {
    try {
      final result =
          await galleryImageDataSource.fetchImageData(page, per_page);
      return right(result);
    } catch (e) {
      return left(ServerFailure(message: "$e"));
    }
  }
}
