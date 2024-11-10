import 'package:auto_route/auto_route.dart';
import 'package:flutterassignmentapp/Features/Pages/SplashPage/SplashPage.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(page: FullImageRoute.page),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: PhotoGalleryRoute.page),
        AutoRoute(page: RepoRoute.page)
      ];
}
