import 'package:blogit/src/data/services/models/blog_model.dart';
import 'package:blogit/utils/result.dart';

abstract class BlogRepository {
  Future<Result<List<Blog>>> getBlogs();
}
