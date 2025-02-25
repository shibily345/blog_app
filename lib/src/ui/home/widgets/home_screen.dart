import 'package:blogit/core/ui/blog_card.dart';
import 'package:blogit/core/ui/error_indicator.dart';
import 'package:blogit/routing/routes.dart';
import 'package:blogit/src/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlogHomeScreen extends StatelessWidget {
  const BlogHomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Blog It",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  context.push(Routes.setting);
                },
                icon: Icon(Icons.settings))
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: ListenableBuilder(
          listenable: viewModel.load,
          builder: (context, child) {
            if (viewModel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (viewModel.load.error) {
              return ErrorIndicator(
                title: "Error Loading",
                label: "Try Again",
                onPressed: viewModel.load.execute,
              );
            }

            return child!;
          },
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              return ListView.builder(
                itemCount: viewModel.blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return BlogCard(blog: viewModel.blogs[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
