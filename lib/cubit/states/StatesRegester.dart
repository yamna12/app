abstract  class RegesterStates {}
class AddInisialUserState extends RegesterStates{}
class AddLaodingUserEState extends RegesterStates{}
class AddSucessUserState extends RegesterStates{

}
class AddUserEroorState extends RegesterStates{
  late final String error ;
  AddUserEroorState(this.error);
}
class CreateUserSucessState extends RegesterStates{}
class CreateUserEroorState extends RegesterStates{
  late final String error ;
  CreateUserEroorState(this.error);
}
class ChangesButtonUserStates extends RegesterStates{}