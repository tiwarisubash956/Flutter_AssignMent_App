import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Presentation/bloc/git_repo_list_bloc.dart';

class RepoScreen extends StatefulWidget {
  const RepoScreen({Key? key}) : super(key: key);

  @override
  State<RepoScreen> createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  int page = 1;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<GitRepoListBloc>().add(FetchGitListsEvent(page: 1));
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      final bloc = context.read<GitRepoListBloc>();
      bloc.add(FetchGitListsEvent(page: page++));
    }
  }

  @override
  void dispose() {
    // Dispose of the PagingController to release resources
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GitRepoListBloc, GitRepoListState>(
        builder: (context, state) {
          if (state is GistLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GistLoadedState) {
            return ListView.builder(
              cacheExtent: 500,
              controller: _scrollController,
              itemCount: state.gists.length,
              itemBuilder: (context, index) {
                final GitrepoList = state.gists[index];
                return Card(
                  child: Container(
                    height: 80,

                    child: ListTile(
                      title: Text(GitrepoList.createdAt.toString()),
                    ),
                  ),
                );
              },
            );
          } else if (state is GistErrorState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
