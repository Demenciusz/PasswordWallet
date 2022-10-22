part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserLoggedIn extends UserState {}

class UserLoggedOut extends UserState {}
