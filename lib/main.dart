import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';
import 'package:fitly/features/authentication/widgets/signup_form_widget.dart';
import 'package:fitly/welcome.dart';
import 'package:fitly/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'features/authentication/models/user_model.dart';
import 'pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';


void initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  Get.put(AuthenticationRepository.instance);
  Get.put(ProfileController());

}
// Charcoal Color.fromRGBO(38, 70, 83, 1.0)
// Persian green Color.fromRGBO(42, 157, 143, 1.0)
// Saffron Color.fromRGBO(233, 196, 106, 1.0)
// Sandy brown Color.fromRGBO
// (244, 162, 97, 1.0)
// burnt sienna Colors.orangeAccent[700]

void main(){

  initializeFirebase();
  runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color.fromRGBO(38, 70, 83, 1.0), // Set your primary color
          secondary: Color.fromRGBO(244, 162, 97, 1.0), // Set your secondary color

          // Define other custom colors as needed
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: "Ysabeau",
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Ysabeau",
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: TextStyle(
            fontFamily: "DancingScript",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.orangeAccent[700],
          ),
          titleLarge: TextStyle(
            fontFamily: "DancingScript",
            fontSize: 100,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.orangeAccent[700],
          ),
          // add more styles as needed...
        ),
      ),
      home: const WidgetTree()));

}
class Fitly extends StatefulWidget {
  const Fitly({Key? key}) : super(key: key);

  @override
  State<Fitly> createState() => _FitlyState();
}

class _FitlyState extends State<Fitly> {
  int _currentIndex = 1;
  List<Color> _iconColors = [
    Colors.orangeAccent.shade700,
    Colors.orangeAccent,
    Colors.orangeAccent.shade700
  ]; // initial colors for each icon

  List<Widget> _pages = [
    ActivityPage(), // Change this to your StatefulWidget
    NutritionPage(), // Change this to your StatefulWidget
    ProfilePage(), // Change this to your StatefulWidget
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
            _iconColors = [
              Colors.orangeAccent.shade700,
              Colors.orangeAccent.shade700,
              Colors.orangeAccent.shade700
            ];
            _iconColors[_currentIndex] = Colors.orangeAccent;
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
            icon: Container(
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
            icon: Container(
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


