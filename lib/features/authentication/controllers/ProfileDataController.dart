import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';
import 'package:fitly/features/authentication/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileDataController extends GetxController {
  static ProfileDataController get instance => Get.find();

  final authRepo = Get.put(AuthenticationRepository());

  final avatarUrl = 'https://images.pexels.com/photos/1547248/pexels-photo-1547248.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  final name = 'Eric Williams';
  final email = 'eric.williams@hotmail.com';
  final followers = 3500;
  final location = 'Texas';
  final bio =
      'Certified Personal Trainer 🏋️‍♂️\nPassionate about helping you achieve your fitness goals! 🌟\nCustomized training programs | Expert guidance | Positive energy ✨\nLet\'s level up your fitness game together! Join me on this journey. 🙌\n#FitnessMotivation #HealthyLifestyle #PersonalTrainer';

  Future<UserModel> getUserData() async {
    final email = authRepo.firebaseUser.value?.email;
    if (email != null) {
      return authRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Something went wrong.');
      return Future.error('No user email found');
    }
  }


  Future<List<UserModel>> getAllUsers() async => await authRepo.allUsers();

  updateRecord(UserModel user) async {
    await authRepo.updateUserRecord(user);
  }
}