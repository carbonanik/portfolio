import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/articles/ui/widgets/editable_content_container.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';

import '../../styles.dart';
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
  Widget generateView({
    bool readOnly = true,
    final Function(ContentBase content)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase content)? goUp,
    final void Function(ContentBase content)? goDown,
    final void Function(ContentBase content, ContentType type)? contentItemClick,
    required BuildContext context,
  }) {
    if (readOnly) {
      return Text(text, style: subtitleStyle(context) );
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
        style: subtitleStyle(context) ,
        controller: controller,
        decoration: inputUnderlineStyle(context) ,
        // initialValue: text,
      ),
      title: "Subtitle",
      close: () => close?.call(this),
      goUp: goUp != null ? () => goUp.call(this) : null,
      goDown: goDown != null ? () => goDown.call(this) : null,
      contentItemClick: (type) {
        contentItemClick?.call(this, type);
      },
    );
  }
}
