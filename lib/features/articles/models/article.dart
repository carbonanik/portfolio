class Article {
  final TitleContent title;
  final String author;
  final List<String> tags;
  final List<Content> contents;
  final DateTime publishedAt;

  const Article({
    required this.title,
    required this.author,
    required this.tags,
    required this.contents,
    required this.publishedAt,
  });
}

enum ContentType implements Comparable<ContentType> {
  text(name: "Text"),
  code(name: "Code"),
  image(name: "Image"),
  title(name: "Title");

  const ContentType({
    required this.name,
  });

  final String name;

  @override
  int compareTo(ContentType other) {
    return name.compareTo(other.name);
  }
}

abstract class Content {
  final ContentType type;

  const Content({
    required this.type,
  });
}

class TextContent extends Content {
  final String text;

  const TextContent({
    required this.text,
  }) : super(type: ContentType.text);
}

class CodeContent extends Content {
  final String code;
  final String language;

  const CodeContent({
    required this.code,
    required this.language,
  }) : super(type: ContentType.code);
}

class ImageContent extends Content {
  final String? url;
  final String? alt;

  const ImageContent({
    this.url,
    this.alt,
  }) : super(type: ContentType.image);
}

class TitleContent extends Content {
  final String text;

  const TitleContent({
    required this.text,
  }) : super(type: ContentType.title);
}
