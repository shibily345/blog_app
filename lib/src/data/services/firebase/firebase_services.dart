import 'package:blogit/src/data/services/models/blog_model.dart';
import 'package:blogit/utils/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  Future<Result<List<Blog>>> getBlogsFromFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final snapshot = await firestore.collection("blogs").get();

      if (snapshot.docs.isNotEmpty) {
        final blogs = snapshot.docs.map((doc) {
          return Blog.fromJson(doc.data());
        }).toList();

        return Result.ok(blogs);
      } else {
        return Result.error(Exception("No blogs found"));
      }
    } on FirebaseException catch (error) {
      return Result.error(error);
    }
  }
}
