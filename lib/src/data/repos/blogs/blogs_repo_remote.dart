import 'package:blogit/src/data/services/firebase/firebase_services.dart';
import 'package:blogit/src/data/services/models/blog_model.dart';
import 'package:blogit/utils/result.dart';

import 'blogs_repo.dart';

class BlogRepositoryRemote implements BlogRepository {
  BlogRepositoryRemote({
    required FirebaseServices firebaseServices,
  }) : _firebaseServices = firebaseServices;

  final FirebaseServices _firebaseServices;

  @override
  Future<Result<List<Blog>>> getBlogs() async {
    final result = await _firebaseServices.getBlogsFromFirestore();
    if (result is Ok<List<Blog>>) {}
    return result;
  }
}
