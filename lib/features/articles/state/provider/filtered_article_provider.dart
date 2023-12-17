import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/state/provider/article_provider.dart';
import 'package:portfolio/features/articles/state/provider/search_text_provider.dart';
import 'package:portfolio/features/articles/state/provider/selected_tag_provider.dart';

final searchedArticleProvider = StateProvider<List<Article>>((ref) {
  List<Article> articles = ref.read(articleProvider);

  final selectedTag = ref.watch(selectedTagProvider);

  if (selectedTag.isNotEmpty) {
    articles = articles.where((element) => hasCommonElement(element.tags, selectedTag)).toList();
  }

  final searchText = ref.watch(searchTextProvider);

  if (searchText.isNotEmpty) {
    articles = articles.where(
      (element) {
        return element.title.text.trim().toLowerCase().contains(searchText.toLowerCase());
      },
    ).toList();
  }

  return articles;
});

bool hasCommonElement(List<String> list1, List<String> list2) {
  return list1.any((element) => list2.contains(element));
}
