import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/models/article.dart';

class ImageContentView extends StatelessWidget {
  const ImageContentView({
    required this.url,
    super.key,
  });

  final ImageContent url;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (url.alt != null) {
      content = Image(
        image: AssetImage(url.alt!),
      );
    } else if (url.url != null) {
      content = Image(
        image: NetworkImage(url.url!),
      );
    } else {
      content = Container();
    }

    return content;
  }
}
