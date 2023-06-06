import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';
import 'package:fitly/features/authentication/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final avatarUrl = TextEditingController();

  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  void createUser(UserModel user) async {
    await AuthenticationRepository.instance.addUser(user);
  }

  void phoneAuthentication(phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }


}