import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/styles.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/code_content_view.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/image_content_view.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/text_content_view.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/title_content_view.dart';

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
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: TitleContentView(title: widget.article.title),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("#${widget.article.tags.join(", #")}",
                style: subtitleStyle(context)),
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
