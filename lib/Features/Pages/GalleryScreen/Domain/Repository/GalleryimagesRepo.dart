import 'package:dartz/dartz.dart';
import 'package:flutterassignmentapp/Core/Error/failure.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';

abstract class Galleryimagesrepo {
  Future<Either<Failure, List<ImageModel>>> fetchGalleryimages(int page,int per_page);
}
