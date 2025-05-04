import 'package:flutter/material.dart';
import 'package:insta_app/model/response_post_model.dart';
import 'package:insta_app/repository/post_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ResponsePostModel> posts = [];
  final PostRepository _postRepository = PostRepository();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await _postRepository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(posts[index].text),
            if ((posts[index].image1.isNotEmpty))
              Image.network(posts[index].image1),
          ],
        );
      },
    );
  }
}
