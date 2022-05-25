import 'dart:async';
import 'package:app/screens/home.dart';
import 'package:app/screens/login.dart';
import 'package:app/shered/compnants/Componants.dart';
import 'package:app/shered/constans/Constans.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    Widget widget;
    if(uid==null){
      widget = Conecter();
    }else{
      widget =HomePage(uid: 'uid');
    }
    super.initState();
    Timer(const Duration(seconds:3),(){
      navigateAndFinish(context,widget);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Expanded(
              flex: 1,
              child: Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('assets/images/logo.png'),
                    ),
                  )
              ),
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}