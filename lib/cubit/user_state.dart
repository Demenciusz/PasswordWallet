import 'package:bsi/data/w_data.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserLogin extends UserState {
  UserLogin(
    this.user,
    this.list,
  );
  final User user;
  final List<Password> list;
  @override
  List<Object?> get props => [user, list];
}

class UserRegistering extends UserState {
  UserRegistering();
  @override
  List<Object?> get props => [];
}

class UserLoggedOut extends UserState {
  UserLoggedOut();
  List<Object?> get props => [];
}
