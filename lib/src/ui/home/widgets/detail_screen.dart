import 'package:blogit/core/common/ui_helpers.dart';
import 'package:blogit/core/ui/image.dart';
import 'package:blogit/src/data/services/models/blog_model.dart';
import 'package:blogit/src/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';

class BlogDetailScreen extends StatefulWidget {
  final String id;
  final HomeViewModel viewModel;
  const BlogDetailScreen(
      {super.key, required this.id, required this.viewModel});

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  Blog? blog;
  @override
  void initState() {
    _loadBlog();

    super.initState();
  }

  Future<void> _loadBlog() async {
    final loadedBlog = await widget.viewModel.loadWithId(widget.id);
    if (mounted) {
      setState(() {
        blog = loadedBlog;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: blog == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Blog Image
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedImage(
                          imageUrl: blog!.imageURL,
                          width: screenWidth(context),
                          height: screenWidth(context),
                        ),
                      ),
                    ),
                  ),

                  // viewModel.blog Title
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      blog!.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // viewModel.blog Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      maxLines: 100,
                      blog!.content,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Summery",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // viewModel.blog Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      maxLines: 100,
                      blog!.summary,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
