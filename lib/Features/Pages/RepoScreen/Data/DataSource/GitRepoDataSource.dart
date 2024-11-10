import 'package:dio/dio.dart';
import 'package:flutterassignmentapp/Core/Error/exception.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Model/GistModel.dart';

abstract class GitRepoDataSource {
  Future<List<GistModel>> fetchGitRepoDetailsData(int page, int per_page);
}

class GitRepoDataSourceimpl implements GitRepoDataSource {
  final Dio dio;

  GitRepoDataSourceimpl({required this.dio});

  @override
  Future<List<GistModel>> fetchGitRepoDetailsData(
      int page, int per_page) async {
    try {
      final response = await dio.get(
        'https://api.github.com/gists/public',
        queryParameters: {'page': page, 'per_page': per_page},
      );
      print(response.data);
      // Check headers for rate-limit info

      if (response.statusCode == 200) {
        final List<dynamic> result = response.data;
        return result.map((json) => GistModel.fromJson(json)).toList();
        
      } else {
        throw ServerException("Error While fetching image data");
      }
    } on DioException catch (e) {
      throw ServerException("$e");
    }
  }
}
