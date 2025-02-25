import 'package:blogit/src/data/repos/blogs/blogs_repo.dart';
import 'package:blogit/src/data/services/models/blog_model.dart';
import 'package:blogit/utils/command.dart';
import 'package:blogit/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required BlogRepository blogRepository,
  }) : _blogRepository = blogRepository {
    load = Command0(_load)..execute();
  }
  final _log = Logger('HomeViewModel');
  late Command0 load;
  final BlogRepository _blogRepository;

  List<Blog> _blogs = [];
  List<Blog> get blogs => _blogs;

  Blog? _blog;
  Blog? get blog => _blog;

  Future<Result> _load() async {
    try {
      final result = await _blogRepository.getBlogs();
      switch (result) {
        case Ok<List<Blog>>():
          _blogs = result.value;
          _log.fine('Loaded Blogs');
        case Error<List<Blog>>():
          _log.warning('Failed to load Blogs', result.error);
          return result;
      }

      return result;
    } finally {
      notifyListeners();
    }
  }

  Future<Blog?> loadWithId(String id) async {
    try {
      final result = await _blogRepository.getBlogs();

      if (result is Ok<List<Blog>>) {
        final blog = result.value.firstWhere(
          (blog) => blog.id == id,
        );
        _log.fine('Loaded Blogs');
        return blog;
      } else if (result is Error<List<Blog>>) {
        _log.warning('Failed to load Blogs', result.error);
      }

      return null;
    } finally {
      notifyListeners();
    }
  }
}
