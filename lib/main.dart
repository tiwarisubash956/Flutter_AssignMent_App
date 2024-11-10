import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignmentapp/Configuration/routes/app_router.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Reposstoryimp/GalleryImageRepoimp.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Presentation/bloc/gallery_bloc.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/DataSource/GitRepoDataSource.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Reposstoryimp/GitRepoimp.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Domain/Repository/GitRepo.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Presentation/bloc/git_repo_list_bloc.dart';

import 'Features/Pages/GalleryScreen/Data/DataSource/GalleryImageDataSource.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GalleryBloc(
                galleryimagerepoimp: Galleryimagerepoimp(
                    galleryImageDataSource:
                        GalleryDataSourceimpl(dio: Dio())))),
        BlocProvider(
            create: (context) => GitRepoListBloc(
                gitRepo: GitRepoimpl(
                    gitRepoDataSource: GitRepoDataSourceimpl(dio: Dio()))))
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: appRouter.config()),
    );
  }
}
