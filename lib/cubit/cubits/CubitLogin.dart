
import 'package:app/cubit/states/statesLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit([Type ? loginInisialState]) : super (LoginInisialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLaodingState());
    FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email,
        password: password).
    then((value) {
      print(value.user!.uid);
      emit(LoginSucessState(value.user!.uid));
    }).then((error) {
      emit(LoginEroorState(error.toString()));
    });
  }


}