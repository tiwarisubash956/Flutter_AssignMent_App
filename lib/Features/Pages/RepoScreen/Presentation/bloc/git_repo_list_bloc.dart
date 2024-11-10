import 'package:bloc/bloc.dart';
import 'package:flutterassignmentapp/Core/Error/failure.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Model/GistModel.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Reposstoryimp/GitRepoimp.dart';
import 'package:meta/meta.dart';

part 'git_repo_list_event.dart';
part 'git_repo_list_state.dart';

class GitRepoListBloc extends Bloc<GitRepoListEvent, GitRepoListState> {
  final GitRepoimpl gitRepo;
  final int per_page = 30;
  GitRepoListBloc({required this.gitRepo}) : super(GitRepoListInitial()) {
    on<GitRepoListEvent>((event, emit) async {
      if (event is FetchGitListsEvent) {
        try {
          final currentState = state;
          List<GistModel> oldList = [];
          if (currentState is GistLoadedState) {
            oldList = currentState.gists;
          }

          final failureorSucces =
              await gitRepo.fetchRepoDetil(event.page, per_page);
          failureorSucces.fold(
              (failure) =>
                  emit(GistErrorState(((failure as ServerFailure).message))),
              (success) {
            final newlist = [...oldList, ...success];
            emit(GistLoadedState(newlist, success.isEmpty));
          });
        } catch (e) {
          emit(GistErrorState("$e"));
        }
      }
    });
  }
}
