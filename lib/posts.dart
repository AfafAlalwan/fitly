import 'package:fitly/features/authentication/controllers/ProfileDataController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'features/authentication/models/user_model.dart';

class Post {
  final String title;
  final String author;
  final String body;
  final String authorAvatarUrl;

  Post({required this.title, required this.author, required this.body, required this.authorAvatarUrl});
}

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final List<Post> _posts = [];
  final user = Get.find<ProfileController>().user;
  final mockUser = Get.put(ProfileDataController());

  void _addPost(Post post) {
    setState(() {
      _posts.add(post);
    });
  }

  void _showAddPostDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String title = '';
    String author = '';
    String body = '';
    String avatarUrl = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Post',
            style: TextStyle(fontSize: 30),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    validator: (value) => value!.isEmpty ? 'This field is required' : null,
                    onSaved: (value) => title = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Body'),
                    validator: (value) => value!.isEmpty ? 'This field is required' : null,
                    onSaved: (value) => body = value!,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _addPost(Post(
                    title: title,
                    author: mockUser.name, //should be user
                    body: body,
                    authorAvatarUrl: mockUser.avatarUrl,   // should be user
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int index) {
          final post = _posts[index];
          return PostWidget(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddPostDialog(context),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(post.authorAvatarUrl),
              ),
              title: Text(
                post.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                post.author,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 10),
            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
