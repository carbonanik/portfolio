import 'package:go_router/go_router.dart';
import 'package:portfolio/features/articles/ui/page/article_list_page.dart';
import 'package:portfolio/features/articles/ui/page/article_open_page.dart';
import 'package:portfolio/features/articles/ui/page/blog_page.dart';
import 'package:portfolio/features/basics/about/about_page.dart';
import 'package:portfolio/features/basics/contact_page.dart';
import 'package:portfolio/features/basics/on_bording_page.dart';
import 'package:portfolio/features/projects/ui/page/work_page.dart';
import 'package:portfolio/features/projects/ui/page/project_detail_page.dart';
import 'package:portfolio/features/articles/ui/page/create_article_page.dart';
import 'package:portfolio/features/projects/models/project.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: OnBoardPage(),
        ),
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AboutPage(),
        ),
      ),
      GoRoute(
        path: '/work',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: WorkPage(),
        ),
      ),
      GoRoute(
        path: '/blog',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: BlogPage(),
        ),
      ),
      GoRoute(
        path: '/contact',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ContactPage(),
        ),
      ),
      GoRoute(
        path: '/articles',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ArticleListPage(),
        ),
      ),
      GoRoute(
        path: '/blog/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: ArticleOpenPage(id: id),
          );
        },
      ),
      GoRoute(
        path: '/project-detail',
        pageBuilder: (context, state) {
          final project = state.extra as Project;
          return NoTransitionPage(
            child: ProjectDetailPage(project: project),
          );
        },
      ),
      GoRoute(
        path: '/create-article',
        pageBuilder: (context, state) => NoTransitionPage(
          child: CreateArticlePage(),
        ),
      ),
    ],
  );
}
