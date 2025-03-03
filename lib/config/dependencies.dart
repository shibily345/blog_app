import 'package:blogit/src/data/repos/blogs/blogs_repo.dart';
import 'package:blogit/src/data/repos/blogs/blogs_repo_remote.dart';
import 'package:blogit/src/data/services/firebase/firebase_services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersRemote {
  return [
    Provider(
      create: (context) => FirebaseServices(),
    ),
    Provider(
      create: (context) =>
          BlogRepositoryRemote(firebaseServices: context.read())
              as BlogRepository,
    ),
  ];
}
