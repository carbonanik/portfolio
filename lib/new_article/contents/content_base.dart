import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/input_block_title.dart';

abstract class ContentBase {
  Widget generateView(
    bool readOnly,
    final Function(ContentBase)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase)? goUp,
    final void Function(ContentBase)? goDown,
    final void Function(ContentBase, ContentType)? contentItemClick,
  );
}
