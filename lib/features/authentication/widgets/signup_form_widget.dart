import 'package:fitly/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitly/features/authentication/controllers/SignUpController.dart';

class SignupFormWidget extends StatelessWidget {
  String tFullName = 'Full Name';
  String tEmail = 'Email';
  String tPassword = 'Password';
  String tPhoneNo = 'Phone Number';
  double tFormHeight = 20;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding:  EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: InputDecoration(
                labelText: tFullName,
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: tEmail,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: tPassword,
                prefixIcon: Icon(Icons.lock_outline),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: InputDecoration(
                labelText: tPhoneNo,
                prefixIcon: Icon(Icons.phone_outlined),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: tFormHeight),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, perform sign up logic
                  SignUpController.instance.
                  registerUser(controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}