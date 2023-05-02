import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages.dart';

void main(){
  runApp(MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: "Ysabeau",
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Ysabeau",
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          displayLarge: TextStyle(
            fontFamily: "DancingScript",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.orangeAccent[700],
          ),
          // add more styles as needed...
        ),
      ),
      home: Fitly()));
}

class Fitly extends StatefulWidget {
  const Fitly({Key? key}) : super(key: key);

  @override
  State<Fitly> createState() => _FitlyState();
}

class _FitlyState extends State<Fitly> {
  int _currentIndex = 1;
  List<Color> _iconColors = [Colors.orangeAccent.shade700,
    Colors.orangeAccent, Colors.orangeAccent.shade700]; // initial colors for each icon

  List<Widget> _pages = [
    ActivityPage(),
    NutritionPage(),
    ProfilePage(),
  ];

  PageController _pageController = PageController(initialPage: 1);


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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[700],
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            _iconColors = [Colors.orangeAccent.shade700,
            Colors.orangeAccent.shade700, Colors.orangeAccent.shade700];
            _iconColors[_currentIndex] = Colors.orangeAccent;
           // print(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/fitness-outline.svg",
                color: _iconColors[0],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:  Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/nutrition-outline.svg",
                color: _iconColors[1],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:  Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/person-outline.svg",
                color: _iconColors[2],

              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}


