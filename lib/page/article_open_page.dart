import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/text_background.dart';
import 'package:portfolio/common/widget/top_menu_bar.dart';

class ArticleOpenPage extends StatelessWidget {
  const ArticleOpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          TextBackground(),
          // ArticleView(
          //   updatedHeader: () {
          //
          //   },
          //   updated: ,
          //   article: ,
          //   close: ,
          // ),
          TopMenuBar(),
        ],
      ),
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
