import 'package:flutter/material.dart';

class Post {
  final String title;
  final String author;
  final String body;

  Post({required this.title, required this.author, required this.body});
}

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final List<Post> _posts = [
    Post(
      title: "10 Foods you should eat everyday",
      author: "Jane Doe",
      body: "These foods include leafy greens, berries, nuts and seeds, whole grains, fatty fish, legumes, tomatoes, cruciferous vegetables, spices and herbs, and low-fat dairy products. The article explains the nutritional benefits of each food and how they can contribute to a healthy lifestyle. By incorporating these foods into your daily diet, you can improve your overall health and reduce your risk of chronic diseases.",
    ),
    Post(
      title: "Post Title 2",
      author: "Author Name 2",
      body: "post body",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int index) {
          final post = _posts[index];
          return PostWidget(post: post);
        },
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.body, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 8.0),
          Text(post.title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 4.0),
          Text(post.author, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}