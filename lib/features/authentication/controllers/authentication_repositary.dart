import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitly/features/authentication/exceptions/signup_email_password_failure.dart';
import 'package:fitly/main.dart';
import 'package:fitly/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  static final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady(){
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : () => Get.offAll(() => const Fitly());
  }

  Future<void> phoneAuthentication(String phoneNo) async{
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credentials) async{
          await auth.signInWithCredential(credentials);
          },
        codeSent: (verificationId, resendToken){
            this.verificationId.value = verificationId;
            },
        codeAutoRetrievalTimeout: (verificationId){
            this.verificationId.value = verificationId;
            },
        verificationFailed: (e){
          if(e.code == 'invalid-phone-number'){
            Get.snackbar('Error', 'The provided phone number is not valid');
          }else{
            Get.snackbar('Error', 'Something went wrong. Try again.');
          }
        },

    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials =  await auth.
      signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  void checkInitialScreen() {
    final user = firebaseUser.value;
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() => const Fitly());
    }
  }


  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const Fitly()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION- ${ex.message}');
      throw ex;
    }
    catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<bool> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        print('Login successful');
        return true;
      } else {
        print('Login failed');
        return false;
      }
    } on FirebaseAuthException catch(e) {
      print(e);
      return false;
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async => await auth.signOut();

  Future<void> resetPassword(String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){ print(e);}
    catch(_){}
  }

  Future<UserModel?> fetchUser() async {
    final User? currentUser = auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        UserModel fetchedUser = UserModel(
          name: data['name'] as String,
          email: data['email'] as String,
          avatarUrl: data['avatarUrl'] as String,
          bio: data['bio'] as String,
        );
        update(); // Notify listeners
        return fetchedUser;
      }
    }

    return null;
  }

  addUser(UserModel user) async {
    await db.collection('users').add(user.toJson())
        .then((_) => Get.snackbar('Success', 'Your account has been created!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green))
        .catchError((error) {
      Get.snackbar('Error', 'Something went wrong, Try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await db.collection('users').where('email', isEqualTo: email).get();

    if (snapshot.docs.isEmpty) {
      throw Exception('No user found for email $email');
    }

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).first;
    return userData;
  }


  Future<List<UserModel>> allUsers() async{
    final snapshot = await db.collection('users').get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await db.collection('users').doc(user.id).update(user.toJson());
  }
  

}
