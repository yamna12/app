import 'package:app/classModel/ClassModelUser.dart';
import 'package:app/cubit/states/StatesApp.dart';
import 'package:app/screens/ScerrenHome.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/pofile.dart';
import 'package:app/shered/local/Cash_Helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shered/compnants/Componants.dart';
class CubitApp extends Cubit<AppStates> {
  CubitApp() : super(InisialState());
  static CubitApp get(context) => BlocProvider.of(context);
  UserClassM ? model ;
  int CerrentInex = 0;
  List<Widget> screens = [
    scerrenHome(),
    Profile(uid: 'uid'),
     ];
  List<String> Titels = ['poser un thème', 'Chat ', 'notification ', 'Profile'];
  void ChangeButtomNav(int index) {
    CerrentInex = index;
    emit(ChangeEnButtomNavState());
  }

  void getData(uid) async{
    emit(GetLaoding());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .get()
        .then((value) {
      model= UserClassM.fromJson(value.data()!);
      print(model!.nom);
      emit(GetSucces(uid!));
    })
        .catchError((error){
      print(error.toString());
      emit(GetError (error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool hipassword = true;
  void ChangeVisibility(){
    hipassword = !hipassword;
    suffix = hipassword ? Icons.visibility_outlined :Icons.visibility_off_outlined ;
    emit(ChangesPasswordStates());
  }
  IconData iconData = Icons.person_add_outlined;
  bool isButton =true;

  void ChangeButtonn(){
    isButton =! isButton ;
    iconData = isButton ? Icons.person_add_outlined : Icons.add;
    emit(ChangesButtonStates());
  }
}
