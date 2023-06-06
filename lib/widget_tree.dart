import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitly/main.dart';
import 'package:fitly/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';

class WidgetTree extends StatefulWidget{
  const WidgetTree ({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => WidgetTreeState();
}

class WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const Fitly();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}