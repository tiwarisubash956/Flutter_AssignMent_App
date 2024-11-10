part of 'git_repo_list_bloc.dart';

@immutable
sealed class GitRepoListState {}

final class GitRepoListInitial extends GitRepoListState {}

// GistBloc State

class GistLoadingState extends GitRepoListState {}

class GistLoadedState extends GitRepoListState {
  final bool hasReachedMax;

  final List<GistModel> gists;

  GistLoadedState(this.gists, this.hasReachedMax);
}

class GistErrorState extends GitRepoListState {
  final String message;

  GistErrorState(this.message);
}
