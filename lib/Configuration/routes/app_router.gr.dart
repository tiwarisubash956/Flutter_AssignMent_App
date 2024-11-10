// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutterassignmentapp/Features/Pages/BookMarkScreen/BookMarkScreen.dart'
    as _i1;
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart'
    as _i8;
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Presentation/GalleryScreen.dart'
    as _i4;
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Presentation/ImageFullScreen.dart'
    as _i2;
import 'package:flutterassignmentapp/Features/Pages/HomePage/HomePage.dart'
    as _i3;
import 'package:flutterassignmentapp/Features/Pages/SplashPage/SplashPage.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Bookmarkscreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Bookmarkscreen(),
      );
    },
    FullImageRoute.name: (routeData) {
      final args = routeData.argsAs<FullImageRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.FullImageScreen(
          key: args.key,
          image: args.image,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    PhotoGalleryRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PhotoGalleryPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.Bookmarkscreen]
class Bookmarkscreen extends _i6.PageRouteInfo<void> {
  const Bookmarkscreen({List<_i6.PageRouteInfo>? children})
      : super(
          Bookmarkscreen.name,
          initialChildren: children,
        );

  static const String name = 'Bookmarkscreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FullImageScreen]
class FullImageRoute extends _i6.PageRouteInfo<FullImageRouteArgs> {
  FullImageRoute({
    _i7.Key? key,
    required _i8.ImageModel image,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          FullImageRoute.name,
          args: FullImageRouteArgs(
            key: key,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'FullImageRoute';

  static const _i6.PageInfo<FullImageRouteArgs> page =
      _i6.PageInfo<FullImageRouteArgs>(name);
}

class FullImageRouteArgs {
  const FullImageRouteArgs({
    this.key,
    required this.image,
  });

  final _i7.Key? key;

  final _i8.ImageModel image;

  @override
  String toString() {
    return 'FullImageRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PhotoGalleryPage]
class PhotoGalleryRoute extends _i6.PageRouteInfo<void> {
  const PhotoGalleryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PhotoGalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoGalleryRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
