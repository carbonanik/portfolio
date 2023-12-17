import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/articles/data_source/article_static_data.dart';

final tagProvider = Provider<List<String>>((ref) => articleTagList);