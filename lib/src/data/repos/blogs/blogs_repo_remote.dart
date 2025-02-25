import 'package:blogit/src/data/services/firebase/firebase_services.dart';
import 'package:blogit/src/data/services/models/blog_model.dart';
import 'package:blogit/utils/result.dart';

import 'blogs_repo.dart';

class BlogRepositoryRemote implements BlogRepository {
  BlogRepositoryRemote({
    required FirebaseServices firebaseServices,
  }) : _firebaseServices = firebaseServices;

  final FirebaseServices _firebaseServices;

  // List<Blog>? _cachedData;

  @override
  Future<Result<List<Blog>>> getBlogs() async {
    // if (_cachedData == null) {
    // No cached data, request blogs from API
    final result = await _firebaseServices.getBlogsFromFirestore();
    if (result is Ok<List<Blog>>) {
      // Store data in cache
      // _cachedData = result.value;
    }
    return result;
    // } else {
    //   // Return cached data if available
    //   return Result.ok(_cachedData!);
    // }
  }
}
