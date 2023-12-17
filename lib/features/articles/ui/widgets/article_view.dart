import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/styles.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/code_content_view.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/image_content_view.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/text_content_view.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/title_content_view.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

class ArticleView extends StatefulWidget {
  final Article article;

  const ArticleView({
    super.key,
    required this.article,
  });

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final needExtraPadding = width > 1000;
    return Padding(
      padding: EdgeInsets.only(
        top: 120,
        left: needExtraPadding ? (width - 1000) / 2 : 30,
        right: needExtraPadding ? (width - 1000) / 2 : 30,
      ),
      child: DynMouseScroll(
        // durationMS: 500,
        // scrollSpeed: 4.4,
        // animationCurve: Curves.easeOutQuart,
        builder: (context, controller, physics) => ListView(
          controller: controller,
          physics: physics,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TitleContentView(title: widget.article.title),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("#${widget.article.tags.join(", #")}", style: subtitleStyle),
            ),
            ...List.generate(
              widget.article.contents.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: contentToView(widget.article.contents[index]),
              ),
            )
          ],
        ),
      ),

      // ListView.builder(
      //   controller: _scrollController,
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: widget.article.contents.length + 1,
      //   itemBuilder: (context, index) {
      //     if (index == 0) {
      //       return Padding(
      //         padding: const EdgeInsets.only(bottom: 30),
      //         child: TitleContentView(title: widget.article.title),
      //       );
      //     }
      //     return Padding(
      //       padding: const EdgeInsets.only(bottom: 20),
      //       child: contentToView(widget.article.contents[index - 1]),
      //     );
      //   },
      // ),
    );
  }

  Widget contentToView(Content content) {
    switch (content.type) {
      case ContentType.text:
        return TextContentView(textContent: content as TextContent);
      case ContentType.code:
        return CodeContentView(code: content as CodeContent);
      case ContentType.image:
        return ImageContentView(url: content as ImageContent);
      case ContentType.title:
        return TitleContentView(title: content as TitleContent);
    }
  }
}
