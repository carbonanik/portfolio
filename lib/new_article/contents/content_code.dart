import 'dart:io';

import 'package:flutter/material.dart';
import 'package:highlight/languages/python.dart';
import 'package:portfolio/common/widget/input_block_title.dart';
import 'package:portfolio/new_article/contents/content_text.dart';

import '../../common/widget/code_editor.dart';
import '../../common/widget/editable_content_container.dart';
import 'content_base.dart';

class ContentCode extends ContentBase {
  final String code;
  final String language;
  ContentCode({
    required this.code,
    required this.language,
  });

  @override
  Widget generateView(
    bool readOnly,
    final Function(ContentBase)? close,
    final Function(ContentBase oldObject, ContentBase newObject)? updated,
    final void Function(ContentBase)? goUp,
    final void Function(ContentBase)? goDown,
    final void Function(ContentBase, ContentType)? contentItemClick,
  ) {
    Widget content = CodeEditor(
      source: code,
      language: python,
      readOnly: readOnly,
      onChanged: (value) {
        ContentCode newObject = ContentCode(code: value, language: language);
        updated?.call(this, newObject);
      },
    );

    if (readOnly) {
      return content;
    }
    return EditableContentContainer(
      content: content,
      title: "Code",
      close: () => close?.call(this),
      goUp: goUp != null ? () => goUp.call(this) : null,
      goDown: goDown != null ? () => goDown.call(this) : null,
      contentItemClick: (type) {
        contentItemClick?.call(this, type);
      },
    );
  }
}
