import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/page/article_open_page.dart';
import 'package:portfolio/features/articles/ui/page/blog_page.dart';
import 'package:portfolio/features/basics/about/about_page.dart';
import 'package:portfolio/features/basics/contact_page.dart';
import 'package:portfolio/features/basics/on_bording_page.dart';
import 'package:portfolio/features/projects/ui/page/work_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>  const RouteType.custom();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: OnBoardPageRoute.page,
        ),
        AutoRoute(
          path: '/about',
          page: AboutPageRoute.page,
        ),
        AutoRoute(
          path: '/work',
          page: WorkPageRoute.page,
        ),
        AutoRoute(
          path: '/blog',
          page: BlogPageRoute.page,
        ),
        AutoRoute(
          path: '/contact',
          page: ContactPageRoute.page,
        ),
        AutoRoute(
          path: '/article/:id',
          page: ArticleOpenPageRoute.page,
        )
      ];
}
