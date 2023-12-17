import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/data_source/article_static_data.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/widgets/article_view.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';

@RoutePage()
class ArticleOpenPage extends StatelessWidget {
  final String id;

  const ArticleOpenPage({
    @PathParam('id') required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      menuItem: 'Blog',
      children: [
        ArticleView(article: staticArticles.firstWhere((element) => element.id == id)),
      ],
    );
  }
}
