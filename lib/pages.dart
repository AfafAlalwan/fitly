import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'posts.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Text('This is the Activity page'),
      ),
    );
  }
}


class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title:  Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search-outline.svg",
              color: Colors.orangeAccent[700],
            ),

            onPressed: () {
              // functionality to search for people
            },
          ),
        ],
      ),
      body: BlogPage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Text('This is the profile page'),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Center(
        child: Text('This is the profile page'),
      ),
    );
  }
}

