import 'package:astro_common/src/_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String title,
    required String description,
    required Uri uri,
    required DateTime date,
    required NewsSource source,
    Uri? thumbnail,
    String? author,
  }) = _Article;
}