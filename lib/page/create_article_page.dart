import 'package:flutter/material.dart';
import 'package:portfolio/block_type_add.dart';
import 'package:portfolio/common/widget/input_block_title.dart';
import 'package:portfolio/common/widget/skeleton_button.dart';
import 'package:portfolio/new_article/article.dart';
import 'package:portfolio/new_article/contents/content_base.dart';
import 'package:portfolio/new_article/contents/content_code.dart';
import 'package:portfolio/new_article/contents/content_image.dart';
import 'package:portfolio/new_article/contents/content_text.dart';
import 'package:portfolio/new_article/contents/content_title.dart';

import '../new_article/contents/content_subtitle.dart';
import 'article_open_page.dart';
import '../article_view.dart';
import '../common/widget/text_background.dart';

class CreateArticlePage extends StatefulWidget {
  CreateArticlePage({Key? key}) : super(key: key);

  final Article article = Article.initial(
    headline: "Function Decorator Python",
    contents: [
      ContentText(text: longText),
      ContentSubtitle(text: "✏️ the coder"),
      ContentSubtitle(text: "✏️ the coder 2"),
      // ContentImage(path: "image/banner.png"),
      ContentCode(code: sourceCode, language: "python"),
    ],
  );

  @override
  State<CreateArticlePage> createState() => _CreateArticlePageState();
}

class _CreateArticlePageState extends State<CreateArticlePage> {
  bool readOnly = false;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    // final articleView = ArticleView(
    //   article: widget.article,
    //   readOnly: readOnly,
    //   updated: (oldObject, newObject) {
    //     var index = widget.article.indexOf(oldObject);
    //     widget.article[index] = newObject;
    //     setState(() {});
    //   },
    //   updatedHeader: () {
    //     setState(() {});
    //   },
    //   close: (content) {
    //     setState(() {
    //       widget.article.remove(content);
    //     });
    //   },
    //   goUp: (content) {
    //     setState(() {
    //       var index = widget.article.indexOf(content);
    //       if (index > 0) {
    //         widget.article.insert(index - 1, widget.article.removeAt(index));
    //       }
    //     });
    //   },
    //   goDown: (content) {
    //     setState(() {
    //       var index = widget.article.indexOf(content);
    //       if (index < widget.article.length - 1) {
    //         widget.article.insert(index + 1, widget.article.removeAt(index));
    //       }
    //     });
    //   },
    // );

    return Scaffold(
      body: Stack(
        children: [
          const TextBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // articleView,
              Expanded(
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: widget.article.length,
                  itemBuilder: (context, index, animation) {
                    final content = widget.article[index];

                    return slideIt(
                      context,
                      index,
                      animation,
                      content,
                    );
                  },
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 150),
                    BlockTypeAdd(
                      text: "Header",
                      onTap: () => add(
                        ContentTitle(text: "Header"),
                      ),
                    ),
                    BlockTypeAdd(
                      text: "Subtitle",
                      onTap: () => add(
                        ContentSubtitle(text: "Subtitle"),
                      ),
                    ),
                    BlockTypeAdd(
                      text: "Image",
                      onTap: () => add(
                        ContentImage(path: "image/banner.png"),
                      ),
                    ),
                    BlockTypeAdd(
                      text: "Text",
                      onTap: () => add(
                        ContentText(text: longText),
                      ),
                    ),
                    BlockTypeAdd(
                      text: "Code",
                      onTap: () => add(
                        ContentCode(code: sourceCode, language: "python"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // TopMenuBar(),
          Positioned(
            bottom: 30,
            right: 30,
            child: Column(
              children: [
                SkeletonButton(
                    text: "Save Data",
                    onPressed: () {
                      // articleView.getUpdatedData();
                    }),
                SkeletonButton(
                  text: "Edit",
                  onPressed: () => setState(() {
                    readOnly = !readOnly;
                  }),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape:
                        MaterialStateProperty.all(const BeveledRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      // Despite referencing circles and radii, this means "make all corners 4.0".
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(16.0)),
                    )),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Button",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void updated(oldObject, newObject) {
    setState(() {
      var index = widget.article.indexOf(oldObject);
      widget.article[index] = newObject;
    });
  }

  void updatedHeader() {
    setState(() {});
  }

  void close(ContentBase content) {
    setState(() {
      var index = widget.article.indexOf(content);
      widget.article.remove(content);

      removeFromState(index, content);
    });
  }

  void add(ContentBase content) {
    setState(() {
      widget.article.add(content);

      addToState(widget.article.length - 1);
    });
  }

  void insert(ContentBase content, ContentType type) {
    setState(() {
      var index = widget.article.indexOf(content);
      var isLast = index == widget.article.length - 1;

      if (!isLast) {
        widget.article.insert(
          index + 1,
          contentTypeToContent(type),
        );

        addToState(index + 1);
      } else {
        widget.article.add(contentTypeToContent(type));

        addToState(widget.article.length - 1);
      }
    });
  }

  void goUp(ContentBase content) {
    var index = widget.article.indexOf(content);

    if (index > 0) {
      var content1 = widget.article.removeAt(index);
      var content2 = widget.article.removeAt(index - 1);

      removeFromState(index, content1);
      removeFromState(index - 1, content2);

      widget.article.insert(index - 1, content1);
      widget.article.insert(index, content2);

      addToState(index - 1);
      addToState(index);

      setState(() {});
    }
  }

  void goDown(ContentBase content) {
    var index = widget.article.indexOf(content);
    if (index < widget.article.length - 1) {
      //
      var content1 = widget.article.removeAt(index);
      var content2 = widget.article.removeAt(index);

      widget.article.insert(index, content1);
      widget.article.insert(index, content2);

      removeFromState(index, content1);
      removeFromState(index, content2);

      addToState(index);
      addToState(index);

      setState(() {});
    }
  }

  void addToState(int index) {
    _listKey.currentState?.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  void removeFromState(int index, ContentBase content) {
    _listKey.currentState?.removeItem(
      index,
      duration: const Duration(milliseconds: 500),
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: content.generateView(
            readOnly, close, updated, goUp, goDown, insert),
      ),
    );
  }

  Widget slideIt(
    BuildContext context,
    int index,
    animation,
    ContentBase content,
  ) {
    final isLastItem = index == widget.article.length - 1;
    final isFirstItem = index == 0;
    return SizeTransition(
      sizeFactor: animation,
      child: content.generateView(
        readOnly,
        close,
        updated,
        isFirstItem ? null : goUp,
        isLastItem ? null : goDown,
        insert,
      ),
    );
  }
}

ContentBase contentTypeToContent(ContentType type) {
  switch (type) {
    case ContentType.title:
      return ContentTitle(text: "Title");
    case ContentType.subtitle:
      return ContentSubtitle(text: "Subtitle");
    case ContentType.image:
      return ContentImage(path: "image/banner.png");
    case ContentType.text:
      return ContentText(text: longText);
    case ContentType.code:
      return ContentCode(code: sourceCode, language: "python");
  }
}
