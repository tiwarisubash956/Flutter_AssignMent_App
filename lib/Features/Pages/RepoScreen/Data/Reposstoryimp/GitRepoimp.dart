import 'package:dartz/dartz.dart';
import 'package:flutterassignmentapp/Core/Error/failure.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/DataSource/GitRepoDataSource.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Model/GistModel.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Domain/Repository/GitRepo.dart';

class GitRepoimpl implements GitRepo {
  final GitRepoDataSource gitRepoDataSource;

  GitRepoimpl({required this.gitRepoDataSource});
  @override
  Future<Either<Failure, List<GistModel>>> fetchRepoDetil(
      int page, int per_page) async {
    try {
      final result =
          await gitRepoDataSource.fetchGitRepoDetailsData(page, per_page);
      return right(result);
    } catch (e) {
      return left(ServerFailure(message: "$e"));
    }
  }
}
