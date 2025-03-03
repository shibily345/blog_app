import 'package:blogit/core/ui/blog_card.dart';
import 'package:blogit/core/ui/error_indicator.dart';
import 'package:blogit/core/ui/search_bar.dart';
import 'package:blogit/routing/routes.dart';
import 'package:blogit/src/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class BlogHomeScreen extends StatelessWidget {
  const BlogHomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Row(
          children: [
            Text(
              "Add Blog",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 236, 100, 100),
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.add,
              color: Colors.redAccent,
              size: 28,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
              color: Color.fromARGB(255, 236, 100, 100), width: 2),
        ),
        elevation: 5,
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
                itemCount: viewModel.blogs.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _customHeaderWidget(context);
                  } else {
                    return BlogCard(blog: viewModel.blogs[index - 1]);
                  }
                },
              ).animate().moveY().fadeIn();
            },
          ),
        ),
      ),
    );
  }

  Widget _customHeaderWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Lottie.asset("assets/lottie/logo.json",
                  repeat: false, height: 80.h, width: 80.h),
              // horizontalSpaceSmall,
              Text(
                "BlogIt",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    context.push(Routes.setting);
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 40,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppSearchBar(),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, bottom: 20),
          //   child: Text(
          //     "Blogs\nFor You",
          //     style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          //   ),
          // ),
        ],
      ),
    );
  }
}
