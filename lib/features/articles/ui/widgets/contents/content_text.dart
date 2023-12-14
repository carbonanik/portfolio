import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/styles.dart';
import 'package:portfolio/features/articles/ui/widgets/editable_content_container.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';

import 'content_base.dart';

class ContentText extends ContentBase {
  final String text;
  TextEditingController? controller;

  ContentText({
    required this.text,
    this.controller,
  }) {
    controller ??= TextEditingController(text: text);
  }

  @override
  Widget generateView({
    bool readOnly = true,
    final Function(ContentBase content)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase content)? goUp,
    final void Function(ContentBase content)? goDown,
    final void Function(ContentBase content, ContentType type)? contentItemClick,
  }) {
    if (readOnly) {
      return Text(text, style: basicStyle);
    }

    return EditableContentContainer(
        content: TextField(
          onChanged: (value) {
            updated?.call(
              this,
              ContentText(
                text: value,
                controller: controller,
              ),
            );
          },
          maxLines: 5000,
          minLines: 1,
          style: basicStyle,
          controller: controller,
          decoration: inputUnderlineStyle,
        ),
        title: "Text",
        close: () => close?.call(this),
        goUp: goUp != null ? () => goUp.call(this) : null,
        goDown: goDown != null ? () => goDown.call(this) : null,
        contentItemClick: (type) {
          contentItemClick?.call(this, type);
        });
  }
}
