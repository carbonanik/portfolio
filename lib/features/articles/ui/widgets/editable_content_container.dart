import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/features/articles/ui/widgets/input_block_title.dart';

class EditableContentContainer extends StatelessWidget {
  final Widget content;
  final String title;
  final VoidCallback? close;
  final void Function()? goUp;
  final void Function()? goDown;
  final bool hideControl;
  final void Function(ContentType) contentItemClick;

  const EditableContentContainer({
    required this.content,
    required this.title,
    required this.close,
    required this.contentItemClick,
    this.goUp,
    this.goDown,
    this.hideControl = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: appColors.foregroundColorDark.withOpacity(.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditableContentTitle(
              text: title,
              close: close,
              contentItemClick: contentItemClick,
              goUp: goUp,
              goDown: goDown,
              hideControl: hideControl,
            ),
            content,
          ],
        ),
      ),
    );
  }
}
