import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/widgets/article_view.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';

Article mocArticle = Article(
  title: const TitleContent(text: "Function Decorator Python"),
  tags: ["python"],
  author: "✏️ the coder",
  publishedAt: DateTime.now(),
  contents: [
    // const ImageContent(alt: "image/banner.png"),
    // const TextContent(text: longText),
    const CodeContent(code: sourceCode, language: "python"),
    const ImageContent(alt: "image/banner.png"),
    const TextContent(text: longText),
    const CodeContent(code: sourceCode, language: "python"),
  ],
);

@RoutePage()
class ArticleOpenPage extends StatelessWidget {
  final Article? article;

  const ArticleOpenPage({
    this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      menuItem: 'Blog',
      children: [
        ArticleView(article: article ?? mocArticle),
      ],
    );
  }
}

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
