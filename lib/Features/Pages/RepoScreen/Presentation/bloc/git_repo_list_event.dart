part of 'git_repo_list_bloc.dart';

@immutable
sealed class GitRepoListEvent {}

class FetchGitListsEvent extends GitRepoListEvent {
  final int page;

  FetchGitListsEvent({required this.page});
}
