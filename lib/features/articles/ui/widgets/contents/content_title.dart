import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/articles/ui/styles.dart';
import 'package:portfolio/features/articles/ui/widgets/editable_content_container.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';

import 'content_base.dart';




class ContentTitle extends ContentBase {
  final String text;
  TextEditingController? controller;

  ContentTitle({
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
      return Text(text, style: bigTitleTwo);
    }

      bool mainTitle = false;
      if (close == null && goUp == null && goDown == null && contentItemClick == null) {
        mainTitle = true;
      }

    return mainTitle
        ? TextField(
            onChanged: (value) {
              updated?.call(
                this,
                ContentTitle(
                  text: value,
                  controller: controller,
                ),
              );
            },
            maxLines: 5000,
            minLines: 1,
            style: bigTitleTwo,
            controller: controller,
            decoration: inputUnderlineStyle,
          )
        : EditableContentContainer(
            content: TextField(
              onChanged: (value) {
                updated?.call(
                  this,
                  ContentTitle(
                    text: value,
                    controller: controller,
                  ),
                );
              },
              maxLines: 5000,
              minLines: 1,
              style: bigTitleTwo,
              controller: controller,
              decoration: inputUnderlineStyle,
            ),
            title: "Title",
            close: () => close?.call(this),
            goUp: goUp != null ? () => goUp.call(this) : null,
            goDown: goDown != null ? () => goDown.call(this) : null,
            contentItemClick: (type) {
              contentItemClick?.call(this, type);
            });
  }
}
