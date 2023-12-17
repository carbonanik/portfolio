// import 'package:flutter/material.dart';
// import 'package:portfolio/features/articles/ui/widgets/block_type_add.dart';
// import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';
// import 'package:portfolio/util/not_used/skeleton_button.dart';
// import 'package:portfolio/features/articles/ui/widgets/article.dart';
// import 'package:portfolio/features/articles/ui/widgets/contents/content_base.dart';
// import 'package:portfolio/features/articles/ui/widgets/contents/content_code.dart';
// import 'package:portfolio/features/articles/ui/widgets/contents/content_image.dart';
// import 'package:portfolio/features/articles/ui/widgets/contents/content_subtitle.dart';
// import 'package:portfolio/features/articles/ui/widgets/contents/content_text.dart';
// import 'package:portfolio/features/articles/ui/widgets/contents/content_title.dart';
// import 'package:portfolio/features/common/ui/widgets/page_shared_content/text_background.dart';
// import 'package:supercharged/supercharged.dart';
// import 'article_open_page.dart';

// class CreateArticlePage extends StatefulWidget {
//   CreateArticlePage({super.key});
//
//   final Article article = Article(
//     title: ContentTitle(text: "Function Decorator Python"),
//     contents: [
//       ContentSubtitle(text: "✏️ the coder"),
//       ContentText(text: longText),
//       ContentImage(path: "image/banner.png"),
//       ContentCode(code: sourceCode, language: "python"),
//     ],
//   );
//
//   @override
//   State<CreateArticlePage> createState() => _CreateArticlePageState();
// }
//
// class _CreateArticlePageState extends State<CreateArticlePage> {
//   bool readOnly = false;
//
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           const TextBackground(),
//           Row(
//             mainAxisAlignment: screenSize.width > 1200 ? MainAxisAlignment.center : MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: screenSize.width > 1200 ? 800 : screenSize.width - 200,
//                 child: AnimatedList(
//                   key: _listKey,
//                   initialItemCount: widget.article.contents.length + 1, // added 1 for header
//                   itemBuilder: (context, index, animation) {
//                     if (index == 0) {
//                       // generate header first
//                       return widget.article.generateHeadlineView(
//                         readOnly: readOnly,
//                         updated: updated,
//                       );
//                     }
//
//                     final contentIndex = index - 1; // remove the added one
//                     final content = widget.article.contents[contentIndex];
//
//                     return slideIt(
//                       context,
//                       contentIndex,
//                       animation,
//                       content,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           // TopMenuBar(),
//           Positioned(
//               top: 0,
//               right: 0,
//               child: SizedBox(
//                 width: 200,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const SizedBox(height: 150),
//                     BlockTypeAdd(
//                       text: "Header",
//                       onTap: () => add(
//                         ContentTitle(text: "Header"),
//                       ),
//                     ),
//                     BlockTypeAdd(
//                       text: "Subtitle",
//                       onTap: () => add(
//                         ContentSubtitle(text: "Subtitle"),
//                       ),
//                     ),
//                     BlockTypeAdd(
//                       text: "Image",
//                       onTap: () => add(
//                         ContentImage(path: "image/banner.png"),
//                       ),
//                     ),
//                     BlockTypeAdd(
//                       text: "Text",
//                       onTap: () => add(
//                         ContentText(text: longText),
//                       ),
//                     ),
//                     BlockTypeAdd(
//                       text: "Code",
//                       onTap: () => add(
//                         ContentCode(code: sourceCode, language: "python"),
//                       ),
//                     ),
//                   ],
//                 ),
//               )),
//           Positioned(
//             bottom: 30,
//             right: 30,
//             child: Column(
//               children: [
//                 SkeletonButton(
//                     text: "Save Data",
//                     onPressed: () {
//                       // articleView.getUpdatedData();
//                     }),
//                 SkeletonButton(
//                   text: "Edit",
//                   onPressed: () => setState(() {
//                     readOnly = !readOnly;
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void updated(oldObject, newObject) {
//     setState(() {
//       var index = widget.article.contents.indexOf(oldObject);
//       widget.article.contents[index] = newObject;
//     });
//   }
//
//   void updatedHeader() {
//     setState(() {});
//   }
//
//   void close(ContentBase content) {
//     setState(() {
//       var index = widget.article.contents.indexOf(content);
//       widget.article.contents.remove(content);
//
//       removeFromState(index, content);
//     });
//   }
//
//   void add(ContentBase content) {
//     setState(() {
//       widget.article.contents.add(content);
//
//       addToState(widget.article.contents.length - 1);
//     });
//   }
//
//   void insert(ContentBase content, ContentType type) {
//     setState(() {
//       var index = widget.article.contents.indexOf(content);
//       var isLast = index == widget.article.contents.length - 1;
//
//       if (!isLast) {
//         widget.article.contents.insert(
//           index + 1,
//           contentTypeToContent(type),
//         );
//
//         addToState(index + 1);
//       } else {
//         widget.article.contents.add(contentTypeToContent(type));
//
//         addToState(widget.article.contents.length - 1);
//       }
//     });
//   }
//
//   void goUp(ContentBase content) {
//     var index = widget.article.contents.indexOf(content);
//
//     if (index > 0) {
//       var content1 = widget.article.contents.removeAt(index);
//       var content2 = widget.article.contents.removeAt(index - 1);
//
//       removeFromState(index, content1);
//       removeFromState(index - 1, content2);
//
//       widget.article.contents.insert(index - 1, content1);
//       widget.article.contents.insert(index, content2);
//
//       addToState(index - 1);
//       addToState(index);
//
//       setState(() {});
//     }
//   }
//
//   void goDown(ContentBase content) {
//     var index = widget.article.contents.indexOf(content);
//     if (index < widget.article.contents.length - 1) {
//       //
//       var content1 = widget.article.contents.removeAt(index);
//       var content2 = widget.article.contents.removeAt(index);
//
//       widget.article.contents.insert(index, content1);
//       widget.article.contents.insert(index, content2);
//
//       removeFromState(index, content1);
//       removeFromState(index, content2);
//
//       addToState(index);
//       addToState(index);
//
//       setState(() {});
//     }
//   }
//
//   void addToState(int index) {
//     _listKey.currentState?.insertItem(
//       index,
//       duration: 500.milliseconds,
//     );
//   }
//
//   void removeFromState(int index, ContentBase content) {
//     _listKey.currentState?.removeItem(
//       index,
//       duration: 500.milliseconds,
//       (context, animation) => SizeTransition(
//         sizeFactor: animation,
//         child: content.generateView(
//           // readOnly, close, updated, goUp, goDown, insert
//           readOnly: readOnly,
//           close: close,
//           updated: updated,
//           goUp: goUp,
//           goDown: goDown,
//           contentItemClick: insert,
//         ),
//       ),
//     );
//   }
//
//   Widget slideIt(
//     BuildContext context,
//     int index,
//     animation,
//     ContentBase content,
//   ) {
//     final isLastItem = index == widget.article.contents.length - 1;
//     final isFirstItem = index == 0;
//     return SizeTransition(
//       sizeFactor: animation,
//       child: content.generateView(
//         readOnly: readOnly,
//         close: close,
//         updated: updated,
//         goUp: isFirstItem ? null : goUp,
//         goDown: isLastItem ? null : goDown,
//         contentItemClick: insert,
//       ),
//     );
//   }
// }
//
// ContentBase contentTypeToContent(ContentType type) {
//   switch (type) {
//     case ContentType.title:
//       return ContentTitle(text: "Title");
//     case ContentType.subtitle:
//       return ContentSubtitle(text: "Subtitle");
//     case ContentType.image:
//       return ContentImage(path: "image/banner.png");
//     case ContentType.text:
//       return ContentText(text: longText);
//     case ContentType.code:
//       return ContentCode(code: sourceCode, language: "python");
//   }
// }
