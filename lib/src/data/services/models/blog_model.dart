import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_model.freezed.dart';
part 'blog_model.g.dart';

@freezed
class Blog with _$Blog {
  const factory Blog({
    required String id,
    required String title,
    required String imageURL,
    required String summary,
    required String content,
    required String deeplink,
  }) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}
