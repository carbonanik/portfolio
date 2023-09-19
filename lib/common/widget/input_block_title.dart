import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/new_article/contents/content_title.dart';

class EditableContentTitle extends StatelessWidget {
  final String text;
  final VoidCallback? close;
  final void Function()? goUp;
  final void Function()? goDown;
  final bool hideControl;
  final void Function(ContentType) contentItemClick;

  const EditableContentTitle({
    required this.text,
    required this.close,
    required this.contentItemClick,
    this.goUp,
    this.goDown,
    this.hideControl = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (!hideControl)
                    GestureDetector(
                      onTap: goUp,
                      child: Icon(
                        Icons.arrow_upward,
                        color: goUp != null
                            ? foregroundColorDark
                            : foregroundColorDark.withOpacity(.3),
                        size: 32,
                      ),
                    ),
                  const SizedBox(width: 8),
                  if (!hideControl)
                    GestureDetector(
                      onTap: () {
                        goDown?.call();
                      },
                      child: Icon(
                        Icons.arrow_downward,
                        color: goDown != null
                            ? foregroundColorDark
                            : foregroundColorDark.withOpacity(.3),
                        size: 32,
                      ),
                    ),
                  if (!hideControl) const SizedBox(width: 16),
                  Text(
                    text,
                    style: const TextStyle(
                      fontFamily: "Cabin",
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ],
              ),
              if (!hideControl)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showFloatingMenu(context, contentItemClick);
                      },
                      child: const Icon(
                        Icons.add,
                        color: foregroundColorDark,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: close,
                      child: const Icon(
                        Icons.close,
                        color: foregroundColorDark,
                        size: 32,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const Divider(
          color: foregroundColorDark,
        )
      ],
    );
  }

  void showFloatingMenu(
      BuildContext context, void Function(ContentType) contentItemClick) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    showMenu(
      context: context,
      color: backgroundColor,
      position: RelativeRect.fromLTRB(
        offset.dx + size.width - 400,
        offset.dy,
        offset.dx + button.size.width,
        offset.dy + button.size.height,
      ),
      items: [
        PopupMenuItem(
            child: const Text('Title'),
            onTap: () {
              contentItemClick(ContentType.title);
            }),
        PopupMenuItem(
            child: const Text('Subtitle'),
            onTap: () {
              contentItemClick(ContentType.subtitle);
            }),
        PopupMenuItem(
            child: const Text('Image'),
            onTap: () {
              contentItemClick(ContentType.image);
            }),
        PopupMenuItem(
            child: const Text('Text'),
            onTap: () {
              contentItemClick(ContentType.text);
            }),
        PopupMenuItem(
            child: const Text('Code'),
            onTap: () {
              contentItemClick(ContentType.code);
            }),
        // Add more PopupMenuItems as needed
      ],
    );
  }
}

enum ContentType {
  title,
  subtitle,
  image,
  text,
  code,
}
