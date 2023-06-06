import 'package:fitly/features/authentication/widgets/login_form_widget.dart';
import 'package:fitly/features/authentication/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Fitly', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
              ),
              child: Text('Sign Up', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                // Navigate to the sign-up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupFormWidget()),
                );
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
              ),
              child: Text('Log In', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                // Navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginFormWidget()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}