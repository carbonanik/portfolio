import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';
import 'package:portfolio/features/articles/ui/widgets/contents/content_base.dart';

import '../editable_content_container.dart';

class ContentImage extends ContentBase {
  final String? path;
  final String? url;

  ContentImage({
    this.path,
    this.url,
  });

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
    Widget content;
    if (path != null) {
      content = Image(
        image: AssetImage(path!),
      );
    } else if (url != null) {
      content = Image(
        image: NetworkImage(url!),
      );
    } else {
      content = Container();
    }

    if (readOnly) {
      return content;
    }

    return EditableContentContainer(
        content: content,
        title: "Image",
        close: () => close?.call(this),
        goUp: goUp != null ? () => goUp.call(this) : null,
        goDown: goDown != null ? () => goDown.call(this) : null,
        contentItemClick: (type) {
          contentItemClick?.call(this, type);
        });
  }
}
