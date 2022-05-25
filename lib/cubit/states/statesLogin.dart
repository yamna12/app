abstract  class LoginStates {}
class LoginInisialState extends LoginStates{}
class LoginLaodingState extends LoginStates{}
class LoginSucessState extends LoginStates{
  final String uid;

  LoginSucessState(this.uid, );

}
class LoginEroorState extends LoginStates{
  late final String error ;
  LoginEroorState(this.error);
}