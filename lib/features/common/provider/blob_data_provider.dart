import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/common/provider/notifier/blob_data_notifier.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';

final blobDataProvider = StateNotifierProvider<BlobDataNotifier, BlobHoverData>((ref) => BlobDataNotifier());
