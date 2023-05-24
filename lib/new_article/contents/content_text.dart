import 'package:flutter/material.dart';
import 'package:portfolio/common/styles.dart';
import 'package:portfolio/common/widget/editable_content_container.dart';
import 'package:portfolio/common/widget/input_block_title.dart';

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
  Widget generateView(
    bool readOnly,
    final Function(ContentBase)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase)? goUp,
    final void Function(ContentBase)? goDown,
    final void Function(ContentBase, ContentType)? contentItemClick,
  ) {
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
