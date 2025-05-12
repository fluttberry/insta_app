import 'package:flutter/material.dart';
import 'package:insta_app/model/profile_model.dart';
import 'package:insta_app/model/response_post_model.dart';
import 'package:insta_app/repository/post_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ResponsePostModel> posts = [];
  List<ProfileModel> profiles = [];
  List<String> imgs = []; // added by me
  final PostRepository _postRepository = PostRepository();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await _postRepository.getPosts();
    setState(() {});
    for (var post in posts) {
      if (!profiles.map((profile) => profile.id).contains(post.user)) {
        var user = await _postRepository.getUser(post.user);
        if (user != null) {
          profiles.add(user);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[index];
        var user = profiles.firstWhere(
          (profile) => profile.id == post.user,
          orElse:
              () =>
                  ProfileModel(name: '_', nickname: '_', city: '_', image: '_'),
        );
        return Column(
          children: [
            Row(
              children: [
                user.image.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: ClipOval(
                        child: Image.network(
                          user.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    : Icon(Icons.person),
                Text(user.name),
              ],
            ),

            //if (post.image1.isNotEmpty) Image.network(post.image1),
            SizedBox(
              width: double.infinity,
              height: post.getImages(). isEmpty ? 0 : 300,
              child: PageView.builder(
                itemCount: post.getImages().length,
                itemBuilder: (context, index) {
                  post.getImages()[index];
                  return Image.network(post.getImages()[index]);
                },
              ),
            ),
            // Column(
            //   children: [
            //     if (post.image1.isNotEmpty) Image.network(post.image1),

            //     SizedBox(
            //       height: 200,
            //       child: PageView.builder(
            //         itemCount: post.getImages().length,
            //         itemBuilder: (context, index) {
            //           return Image.network(post.getImages()[index]);
            //         },
            //       ),
            //     ),
            //   ],
            // ),

            Text(post.text),
          ],
        );
      },
    );
  }
}
