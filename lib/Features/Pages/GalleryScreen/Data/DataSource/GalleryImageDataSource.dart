import 'package:dio/dio.dart';
import 'package:flutterassignmentapp/Core/Error/exception.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';

abstract class GalleryImageDataSource {
  Future<List<ImageModel>> fetchImageData(int page, int per_page);
}

class GalleryDataSourceimpl implements GalleryImageDataSource {
  final Dio dio;

  GalleryDataSourceimpl({required this.dio});

  @override
  Future<List<ImageModel>> fetchImageData(int page, int per_page) async {
    try {
      final response = await dio.get(
        'https://api.unsplash.com/photos',
        queryParameters: {
          'client_id': '1o1wRXEYpfix7hujcZ6Al5e2TJiBByhNyFchhhagyUM',
          'page': page,
          'per_page': per_page
        },
      );
      // Check headers for rate-limit info

      if (response.statusCode == 200) {
        final List<dynamic> result = response.data;
        return result.map((json) => ImageModel.fromJson(json)).toList();
      } else {
        throw ServerException("Error While fetching image data");
      }
    } on DioException catch (e) {
      throw ServerException("$e");
    }
  }
}
