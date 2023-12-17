import 'package:portfolio/features/articles/models/article.dart';

final articleTagList = [
  "Python",
  "Flutter",
  "Javascript",
  "Linux",
  "Docker",
  "Database",
];

final staticArticles = [
  Article(
    id: "bb176939-c2d5-4584-a9f2-66595632379a",
    title: const TitleContent(text: "Function Decorator Python"),
    tags: ["Python"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "6fe51f87-0376-44ee-944d-3770bd18e690",
    title: const TitleContent(text: "Learn javascript in 10 minutes"),
    tags: ["Javascript"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "11817e01-20ec-441a-8064-853ae2d934b7",
    title: const TitleContent(text: "Build your first Flutter App"),
    tags: ["Flutter"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(text: longText),
      const ImageContent(alt: "image/banner.png"),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "4acdecc5-4044-4c57-8c04-f6dd886fd77d",
    title: const TitleContent(text: "Build a nginx server"),
    tags: ["Linux", "Docker"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "bdd5f35c-9095-4165-b8fd-2f04e427a54c",
    title: const TitleContent(text: "Basic SQLite Database"),
    tags: ["Database"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "bdd5f35c-9095-4165-b8fd-2f04e427a54c",
    title: const TitleContent(text: "25 Basic Linux Commands For Beginners"),
    tags: ["Linux"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "39e309d4-9dcc-469d-be0f-f1ba487efb2a",
    title: const TitleContent(text: "Machine Learning Tutorial in Python"),
    tags: ["Python"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "c8d13c34-2106-49f1-91e2-892a107a40cf",
    title: const TitleContent(text: "Function Decorator Python"),
    tags: ["Python"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "0bc571ab-4fbf-4ff2-8749-8836e948c03f",
    title: const TitleContent(text: "Function Decorator Python"),
    tags: ["Python"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
  Article(
    id: "0cc7afd7-d1b0-4daa-bc8b-70524b020ae5",
    title: const TitleContent(text: "Function Decorator Python"),
    tags: ["python"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const CodeContent(code: sourceCode, language: "python"),
      const ImageContent(alt: "image/banner.png"),
      const TextContent(text: longText),
      const CodeContent(code: sourceCode, language: "python"),
    ],
  ),
];

const String longText = '''
Most modern web applications are powered by a REST API under the hood. That way, developers can separate the front-end code from the back-end logic, and users can interact with the interface dynamically. In this three-part tutorial series, you’re building a REST API with the Flask web framework.

You’ve created a foundation with a basic Flask project and added endpoints, which you’ll connect to a SQLite database. You’re also testing your API with Swagger UI API documentation that you’re building along the way.

After finishing the second part of this series, you’ll move on to the third part, where you’ll extend your REST API with the functionality to add notes to a person.
''';

const sourceCode = """
# config.py 

import pathlib 
import connexion 
from flask_sqlalchemy import SQLAlchemy 
from flask_marshmallow import Marshmallow 

basedir = pathlib.Path(__file__).parent.resolve() 
connex_app = connexion.App(__name__, dir=basedir) 

app = connex_app.app 
app.config["SQLALCHEMY_DATABASE_URI"] = "people.db" 
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False 

db = SQLAlchemy(app) 
ma = Marshmallow(app)
""";
