abstract class AppStates{}

class InisialState extends AppStates{}
class ChangeButtomNavState extends AppStates{}
class LogoutSuccessState extends AppStates{
}
class GetSucces extends AppStates{
  final String etid;

  GetSucces(this.etid);

}
class GetLaoding extends AppStates{}
class GetError extends AppStates{
  late final String error ;
  GetError(this.error);
}
class LogoutErrorState extends AppStates{
  late final String error ;
  LogoutErrorState(this.error);
}
class ChangeEnButtomNavState extends AppStates{}
class ChangesButtonStates extends AppStates{}
class ChangesPasswordStates extends AppStates{}