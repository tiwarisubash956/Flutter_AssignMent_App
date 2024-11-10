import 'package:dartz/dartz.dart';
import 'package:flutterassignmentapp/Core/Error/failure.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Model/GistModel.dart';

abstract class GitRepo {
  Future<Either<Failure, List<GistModel>>> fetchRepoDetil(int page,int per_page);
}
