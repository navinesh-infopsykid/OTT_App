import 'dart:async';
import 'package:Zera/OTT%20home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'OTT login.dart';
import 'OTT.dart';




class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: AnimatedSplashScreen(
          duration: 2000,
          backgroundColor: Colors.black,
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 700,
          splash: "assets/images/JM9R.gif", 
          nextScreen: StreamBuilder<User?>(
            stream:FirebaseAuth.instance.authStateChanges() ,
            builder: (context,AsyncSnapshot<User?> snapshot){
              if(snapshot.hasData && snapshot.data !=null){
                return const OTT();
              }
              else if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              return loginott();
            },
          ),
       ),
    );

  }
}
