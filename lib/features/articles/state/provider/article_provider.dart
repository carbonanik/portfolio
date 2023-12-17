import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/articles/data_source/article_static_data.dart';
import 'package:portfolio/features/articles/models/article.dart';

final articleProvider = Provider.autoDispose<List<Article>>((ref) {
  return staticArticles;
});
