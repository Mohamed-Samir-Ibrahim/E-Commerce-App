abstract class ProfileTabStates {}

class ProfileTabInitialState extends ProfileTabStates{}

class GetUserDataInitialState extends ProfileTabStates{}
class GetUserDataSuccessState extends ProfileTabStates{}
class FailedToGetUserDataState extends ProfileTabStates{
  String error;
  FailedToGetUserDataState({required this.error});
}

class ChangePasswordSuccessState extends ProfileTabStates{}
class ChangePasswordLoadingState extends ProfileTabStates{}
class ChangePasswordWithFailureState extends ProfileTabStates{
  String error;

  ChangePasswordWithFailureState(this.error);
}

class UpdateUserDataSuccessState extends ProfileTabStates{}
class UpdateUserDataLoadingState extends ProfileTabStates{}
class UpdateUserDataWithFailureState extends ProfileTabStates{
  String error;

  UpdateUserDataWithFailureState(this.error);
}