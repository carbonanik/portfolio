import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/common/widget/editable_content_container.dart';
import 'package:portfolio/common/widget/input_block_title.dart';

import '../../common/styles.dart';
import 'content_base.dart';

class ContentSubtitle extends ContentBase {
  final String text;
  TextEditingController? controller;
  ContentSubtitle({
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
      return Text(text, style: subtitleStyle);
    }

    return EditableContentContainer(
        content: TextField(
          onChanged: (value) {
            updated?.call(
              this,
              ContentSubtitle(
                text: value,
                controller: controller,
              ),
            );
          },
          maxLines: 5000,
          minLines: 1,
          style: subtitleStyle,
          controller: controller,
          decoration: inputUnderlineStyle,

          // initialValue: text,
        ),
        title: "Subtitle",
        close: () => close?.call(this),
        goUp: goUp != null ? () => goUp.call(this) : null,
        goDown: goDown != null ? () => goDown.call(this) : null,
        contentItemClick: (type) {
          contentItemClick?.call(this, type);
        });
  }
}
