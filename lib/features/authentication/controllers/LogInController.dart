import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<bool> loginUser(String email, String password) async{
    return await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

  void logOut(){
    AuthenticationRepository.instance.logout();
  }

  void forgotPassword(String email){
    AuthenticationRepository.instance.resetPassword(email);
  }
}