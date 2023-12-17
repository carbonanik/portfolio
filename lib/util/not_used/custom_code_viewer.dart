import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/util/not_used/code_viewer_line.dart';

class CustomCodeViewer extends StatelessWidget {
  const CustomCodeViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sourceCodeLines = sourceCode.split('\n');
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            sourceCodeLines.length,
            (index) => CodeViewerLine(line: sourceCodeLines[index], lineNumber: index + 1),
          ),
        ),
      ),
    );
  }
}

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
