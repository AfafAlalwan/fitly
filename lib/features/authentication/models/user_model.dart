import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String avatarUrl;
  final String bio;

  const UserModel({this.id, required this.name, required this.email, required this.avatarUrl, required this.bio});

  toJson(){
    return{
      "name": name,
      "email": email,
      "avatarUrl": avatarUrl,
      "bio": bio,

    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return UserModel(
        id: document.id,
        name: data['name'],
        email: data['email'],
        avatarUrl: data['avatarUrl'],
        bio: data['bio']
    );
  }

}

class ProfileController extends GetxController {
  UserModel? user;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    user = await AuthenticationRepository.instance.fetchUser();
    update(); // Notify listeners
  }
}

class UserDetails{
  late String fullName;
  late String password;
  late String email;
  late String phoneNo;
  late String avatarUrl;

}