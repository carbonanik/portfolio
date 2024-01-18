import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';

abstract class ContentBase {
  Widget generateView({
    bool readOnly = true,
    final Function(ContentBase content)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase content)? goUp,
    final void Function(ContentBase content)? goDown,
    final void Function(ContentBase content, ContentType type)? contentItemClick,
    required BuildContext context,
  });
}
