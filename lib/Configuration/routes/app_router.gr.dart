// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Presentation/ImageFullScreen.dart'
    as _i1;
import 'package:flutterassignmentapp/Features/Pages/HomePage/HomePage.dart'
    as _i2;
import 'package:flutterassignmentapp/Features/Pages/SplashPage/SplashPage.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    FullImageRoute.name: (routeData) {
      final args = routeData.argsAs<FullImageRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.FullImageScreen(
          key: args.key,
          imageUrl: args.imageUrl,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    Splashpage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Splashpage(),
      );
    },
  };
}

/// generated route for
/// [_i1.FullImageScreen]
class FullImageRoute extends _i4.PageRouteInfo<FullImageRouteArgs> {
  FullImageRoute({
    _i5.Key? key,
    required String imageUrl,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          FullImageRoute.name,
          args: FullImageRouteArgs(
            key: key,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'FullImageRoute';

  static const _i4.PageInfo<FullImageRouteArgs> page =
      _i4.PageInfo<FullImageRouteArgs>(name);
}

class FullImageRouteArgs {
  const FullImageRouteArgs({
    this.key,
    required this.imageUrl,
  });

  final _i5.Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'FullImageRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Splashpage]
class Splashpage extends _i4.PageRouteInfo<void> {
  const Splashpage({List<_i4.PageRouteInfo>? children})
      : super(
          Splashpage.name,
          initialChildren: children,
        );

  static const String name = 'Splashpage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
