import 'package:app/classModel/ClassModelUser.dart';
import 'package:app/cubit/states/StatesRegester.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResgesterCubit extends Cubit<RegesterStates>
{
  ResgesterCubit() : super((AddInisialUserState()));

  static ResgesterCubit get(context) => BlocProvider.of(context);
  void AddUser({

    required String nom,
    required String prenom,
    required String email,
    required String password,

  }) {
    print('hiiiiiiiiiiiiii');
    emit(AddLaodingUserEState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password).then((value) {
      User(  uid:value.user!.uid, nom: nom,
          prenom: prenom,
          email: email);
    }
    ).catchError((error) {
      emit(AddUserEroorState(error.toString()));
    });
  }
  void User({
    required String uid,
    required String nom,
    required String prenom,
    required String email,

  }) {
    UserClassM model = UserClassM(
        uid: uid,
        nom: nom,
        prenom: prenom,
        email: email,
        image: 'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
        cover: 'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',

    );
    FirebaseFirestore.instance.collection('user').doc(uid)
        .set(model.Tomap1())
        .then((value) {
      emit(CreateUserSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserEroorState(error.toString()));
    });
  }




}