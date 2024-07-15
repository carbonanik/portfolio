import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/models/article.dart';

class ArticleItemView extends StatelessWidget {
  final Article article;

  const ArticleItemView({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 200,
            child: Image(image: AssetImage(article.featuredImage))),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title.text,
              style: TextStyle(
                fontFamily: "Cabin",
                fontSize: 33,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 1000,
              child: Text(
                "I’m a software engineer specializing in building (and occasionally designing) "
                "exceptional digital experiences. Currently, I’m focused on building accessible, "
                "human-centered products.",
                maxLines: 4,
                style: TextStyle(
                    fontFamily: "Cabin",
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.inversePrimary
                    // height: 2
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              article.publishedAt.toString(),
              style: TextStyle(
                  fontFamily: "IBMPlexMono",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        )
      ],
    );
  }
}
