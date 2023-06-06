import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'features/authentication/controllers/LogInController.dart';
import 'features/authentication/controllers/ProfileDataController.dart';
import 'features/authentication/controllers/authentication_repositary.dart';
import 'features/authentication/models/user_model.dart';
import 'posts.dart';
import 'package:get/get.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}
class _ActivityPageState extends State<ActivityPage> {
  int _steps = 0;
  int _calories = 0;
  double _weightGoal = 0.0;
  List<String> _meals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search-outline.svg",
              color: Colors.orangeAccent[700],
            ),
            onPressed: () {
              // TODO: Implement search bar functionality here
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.directions_walk),
            title: Text('Steps: $_steps'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // TODO: Implement steps tracking functionality here
                setState(() {
                  _steps++;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text('Weight goal: $_weightGoal kg'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // TODO: Implement goal tracking functionality here
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('Calories: $_calories kcal'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // TODO: Implement calorie counting functionality here
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.apple),
            title: Text('Meals today:'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // TODO: Implement meal entry functionality here
              },
            ),
          ),
          ..._meals.map((meal) => ListTile(
            title: Text(meal),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _meals.removeWhere((element) => element == meal);
                });
              },
            ),
          )).toList(),
        ],
      ),
    );
  }
}



class NutritionPage extends StatefulWidget {
  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
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
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(LoginController());
  final profileData = Get.put(ProfileDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title:  Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => controller.logOut(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 16),
                _buildAvatar(),
                SizedBox(height: 16),
                _buildName(),
                SizedBox(height: 8),
                _buildEmail(),
                SizedBox(height: 8),
                _buildLocation(),
                SizedBox(height: 8),
                _buildFollowerCount(),
                SizedBox(height: 24),
                _buildBio(),
                SizedBox(height: 24),
                _buildEditButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.orangeAccent]
        ),
      ),
      padding: EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(profileData.avatarUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      profileData.name,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[700],
      ),
    );
  }

  Widget _buildEmail() {
    return Text(
      profileData.email,
      style: TextStyle(
        fontSize: 18,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildLocation() {
    return Text(
      "Location: ${profileData.location}",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildFollowerCount() {
    return Text(
      "Followers: ${profileData.followers}",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildBio() {
    return Text(
      profileData.bio,  // Assuming profileData has bio property
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle edit profile logic
      },
      child: Text('Edit Profile'),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey[700], // background
        onPrimary: Colors.white, // foreground
      ),
    );
  }
}
//CAUSING FIRESTORE ERRORS SO I COMMENTED IT OUT

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
//
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final controller = Get.find<LoginController>();
//   final profileController = Get.find<ProfileDataController>();
//
//   @override
//   void initState() {
//     super.initState();
//     profileController.getUserData().then((value) {
//       print('getUserData returned: $value');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[700],
//         title: Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white),
//             onPressed: () => controller.logOut(),
//           ),
//         ],
//       ),
//       body: FutureBuilder<UserModel>(
//         future: profileController.getUserData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('No data'));
//           }
//           if(snapshot.hasData){
//             UserModel profileData = snapshot.data as UserModel;
//             return SingleChildScrollView(
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(height: 16),
//                      // _buildAvatar(profileData.avatarUrl),
//                       SizedBox(height: 16),
//                       _buildName(profileData.name),
//                       SizedBox(height: 8),
//                       _buildEmail(profileData.email),
//                       SizedBox(height: 8),
//                       _buildBio(profileData.bio),
//                       SizedBox(height: 24),
//                       _buildEditButton(),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           // Add return statement for unspecified state
//           return SizedBox.shrink();
//         },
//       ),
//     );
//   }
//
//
//   Widget _buildAvatar(String avatarUrl) {
//     return Container(
//       width: 120,
//       height: 120,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blueGrey, Colors.orangeAccent]
//         ),
//       ),
//       padding: EdgeInsets.all(3),
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//             image: NetworkImage(avatarUrl),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildName(String name) {
//     return Text(
//       name,
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Colors.blueGrey[700],
//       ),
//     );
//   }
//
//   Widget _buildEmail(String email) {
//     return Text(
//       email,
//       style: TextStyle(
//         fontSize: 18,
//         color: Colors.grey[700],
//       ),
//     );
//   }
//
//   Widget _buildBio(String bio) {
//     return Text(
//       bio,
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.grey[700],
//       ),
//     );
//   }
//
//
//   Widget _buildLocation() {
//     return Text(
//       "Location: Istanbul",
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.grey[700],
//       ),
//     );
//   }
//
//   Widget _buildFollowerCount() {
//     return Text(
//       "Followers: 0",
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.grey[700],
//       ),
//     );
//   }
//
//
//
//   Widget _buildEditButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Handle edit profile logic
//       },
//       child: Text('Edit Profile'),
//       style: ElevatedButton.styleFrom(
//         primary: Colors.blueGrey[700], // background
//         onPrimary: Colors.white, // foreground
//       ),
//     );
//   }
// }
//
//
//

