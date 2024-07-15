// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    ArticleListPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticleListPage(),
      );
    },
    ArticleOpenPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ArticleOpenPageRouteArgs>(
          orElse: () =>
              ArticleOpenPageRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticleOpenPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    BlogPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogPage(),
      );
    },
    ContactPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactPage(),
      );
    },
    CreateArticlePageRoute.name: (routeData) {
      final args = routeData.argsAs<CreateArticlePageRouteArgs>(
          orElse: () => const CreateArticlePageRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateArticlePage(key: args.key),
      );
    },
    OnBoardPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardPage(),
      );
    },
    WorkPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkPage(),
      );
    },
  };
}

/// generated route for
/// [AboutPage]
class AboutPageRoute extends PageRouteInfo<void> {
  const AboutPageRoute({List<PageRouteInfo>? children})
      : super(
          AboutPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArticleListPage]
class ArticleListPageRoute extends PageRouteInfo<void> {
  const ArticleListPageRoute({List<PageRouteInfo>? children})
      : super(
          ArticleListPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleListPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArticleOpenPage]
class ArticleOpenPageRoute extends PageRouteInfo<ArticleOpenPageRouteArgs> {
  ArticleOpenPageRoute({
    required String id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ArticleOpenPageRoute.name,
          args: ArticleOpenPageRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ArticleOpenPageRoute';

  static const PageInfo<ArticleOpenPageRouteArgs> page =
      PageInfo<ArticleOpenPageRouteArgs>(name);
}

class ArticleOpenPageRouteArgs {
  const ArticleOpenPageRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'ArticleOpenPageRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [BlogPage]
class BlogPageRoute extends PageRouteInfo<void> {
  const BlogPageRoute({List<PageRouteInfo>? children})
      : super(
          BlogPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactPage]
class ContactPageRoute extends PageRouteInfo<void> {
  const ContactPageRoute({List<PageRouteInfo>? children})
      : super(
          ContactPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateArticlePage]
class CreateArticlePageRoute extends PageRouteInfo<CreateArticlePageRouteArgs> {
  CreateArticlePageRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateArticlePageRoute.name,
          args: CreateArticlePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateArticlePageRoute';

  static const PageInfo<CreateArticlePageRouteArgs> page =
      PageInfo<CreateArticlePageRouteArgs>(name);
}

class CreateArticlePageRouteArgs {
  const CreateArticlePageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateArticlePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [OnBoardPage]
class OnBoardPageRoute extends PageRouteInfo<void> {
  const OnBoardPageRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkPage]
class WorkPageRoute extends PageRouteInfo<void> {
  const WorkPageRoute({List<PageRouteInfo>? children})
      : super(
          WorkPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
