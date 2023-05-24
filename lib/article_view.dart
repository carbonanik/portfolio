import 'package:flutter/material.dart';
import 'package:portfolio/new_article/article.dart';
import 'package:portfolio/new_article/contents/content_base.dart';

class ArticleView extends StatefulWidget {
  final Article article;
  final bool readOnly;
  final Function(ContentBase oldObject, ContentBase newObject) updated;
  final Function() updatedHeader;
  final Function(ContentBase) close;
  final void Function(ContentBase)? goUp;
  final void Function(ContentBase)? goDown;

  const ArticleView({
    Key? key,
    required this.article,
    required this.updated,
    required this.updatedHeader,
    required this.close,
    this.goUp,
    this.goDown,
    this.readOnly = true,
  }) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 1040,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              // widget.article
              //     .generateHeadlineView(widget.readOnly, widget.updatedHeader),
              Expanded(
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: widget.article.length,
                  itemBuilder: (context, index, animation) {
                    final isLastItem = index == widget.article.length - 1;
                    final isFirstItem = index == 0;
                    final content = widget.article[index];

                    return content.generateView(
                      widget.readOnly,
                      widget.close,
                      widget.updated,
                      isFirstItem ? null : widget.goUp,
                      isLastItem ? null : widget.goDown,
                      (p0, p1) {},
                    );
                  },
                ),
              ),
              // ...widget.article.mapIndexed((index, content) {}),
            ],
          ),
        ),
      ],
    );
  }
}
