import 'package:fitly/features/authentication/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitly/features/authentication/controllers/SignUpController.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    Key? key,
}) : super(key : key);

  final String tFullName = 'Full Name';
  final String tEmail = 'Email';
  final String tPassword = 'Password';
  final String tPhoneNo = 'Phone Number';
  final double tFormHeight = 50;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Fitly', style: Theme.of(context).textTheme.displayLarge),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(height: tFormHeight - 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                      ),
                      child: Text('Sign Up'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final user = UserModel(
                              name: controller.fullName.text.trim(),
                              email: controller.email.text.trim(),
                              avatarUrl: 'https://i.pinimg.com/564x/be/80/75/be8075c3043965030d69e8bccf2b5c5c.jpg',
                              bio: 'Write Something about yourself...');

                          SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),
                          );
                          SignUpController.instance.createUser(user);
                        //  SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );



  }
}