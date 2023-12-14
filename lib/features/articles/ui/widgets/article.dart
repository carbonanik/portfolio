import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/content_base.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/content_title.dart';

class Article {
  final ContentTitle headline;
  final List<ContentBase> contents;

  Article({
    required this.headline,
    required this.contents,
  });

  Widget generateHeadlineView({
    bool readOnly = true,
    final Function(ContentBase)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase)? goUp,
    final void Function(ContentBase)? goDown,
    final void Function(ContentBase, ContentType)? contentItemClick,
  }) {
    return headline.generateView(
      readOnly: readOnly,
      close: close,
      updated: updated,
      goUp: goUp,
      goDown: goDown,
      contentItemClick: contentItemClick,
    );
  }
}
