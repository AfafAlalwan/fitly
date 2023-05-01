import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(){
  runApp(MaterialApp(home: Fitly()));
}

class Fitly extends StatefulWidget {
  const Fitly({Key? key}) : super(key: key);

  @override
  State<Fitly> createState() => _FitlyState();
}

class _FitlyState extends State<Fitly> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;

          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            print(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/fitness-outline.svg",
              ),
            ),
            label: 'activity',
          ),
          BottomNavigationBarItem(
            icon:  Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/person-outline.svg",
              ),
            ),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon:  Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/nutrition-outline.svg",
              ),
            ),
            label: 'nutrition',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitly'),
      ),
      body: Center(
        child: Text('This is the Home page'),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('This is the Search page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Widget 1'),
            Text('Widget 2'),
            SvgPicture.asset("assets/icons/fitness-outline.svg"),
          ],
        ),
      ),
    );
  }
}
