import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/text_background.dart';
import 'package:portfolio/common/widget/top_menu_bar.dart';

import '../article_view.dart';

class ArticleOpenPage extends StatelessWidget {
  const ArticleOpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          TextBackground(),
          // ArticleView(article: article, updatedData: (data){}, close: (int ) {  }),
          TopMenuBar(),
        ],
      ),
    );
  }
}

// const article = {
//   "blocks": [
//     {
//       "type": "big_title",
//       "content": "Function Decorator In Python",
//     },
//     {
//       "type": "subtitle",
//       "content": "✏️ the coder",
//     },
//     {
//       "type": "image",
//       "content": {
//         "path": "image/banner.png",
//         "type": "asset",
//       },
//     },
//     {
//       "type": "long_text",
//       "content": longText,
//     },
//     {
//       "type": "code",
//       "content": {
//         "code": sourceCode,
//         "language": "python",
//       },
//     },
//   ]
// };

const String longText = '''
Most modern web applications are powered by a REST API under the hood. That way, developers can separate the front-end code from the back-end logic, and users can interact with the interface dynamically. In this three-part tutorial series, you’re building a REST API with the Flask web framework.

You’ve created a foundation with a basic Flask project and added endpoints, which you’ll connect to a SQLite database. You’re also testing your API with Swagger UI API documentation that you’re building along the way.

In the first part, you used Flask and Connexion to create a REST API providing CRUD operations to an in-memory structure called PEOPLE. By doing so, you learned how the Connexion module helps you build a nice REST API and interactive documentation.
In the second part of this tutorial series, you’ll learn how to:

Write SQL commands in Python
Configure a SQLite database for your Flask project
Use SQLAlchemy to save Python objects to your database
Leverage the Marshmallow library to serialize data
Connect your REST API with your database

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
