import 'package:blogit/src/ui/home/view_models/home_viewmodel.dart';
import 'package:blogit/src/ui/home/widgets/detail_screen.dart';
import 'package:blogit/src/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            final viewModel = HomeViewModel(
              blogRepository: context.read(),
            );
            return BlogHomeScreen(viewModel: viewModel);
          },
        ),
        GoRoute(
          path: "/blog/:id",
          builder: (context, state) {
            final id = state.pathParameters["id"]!;
            final viewModel = HomeViewModel(
              blogRepository: context.read(),
            );
            return BlogDetailScreen(
              id: id,
              viewModel: viewModel,
            );
          },
        ),
      ],
      redirect: (context, state) {
        final uri = Uri.parse(state.uri.toString());

        if (uri.pathSegments.length == 1 &&
            int.tryParse(uri.pathSegments[0]) != null) {
          return "/blog/${uri.pathSegments[0]}";
        }

        return null;
      },
    );
