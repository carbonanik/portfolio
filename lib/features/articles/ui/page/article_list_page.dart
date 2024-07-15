import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/features/articles/ui/widgets/article_item_view.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/text_background.dart';

import '../../data_source/article_static_data.dart';

@RoutePage()
class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const TextBackground(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  ...staticArticles.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(ArticleOpenPageRoute(id: e.id));
                            print('tapped');
                          },
                          child: ArticleItemView(article: e)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
