import 'package:bsi/data/w_data.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserLogin extends UserState {
  UserLogin(
    this.user,
    this.list,
  ) {
    visable = {for (var password in list) password.id: false};
  }
  final User user;
  final List<Password> list;
  late Map<int, bool> visable;

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

class UserAddingPass extends UserState {
  UserAddingPass(
    this.user,
    this.list,
  );
  final User user;
  final List<Password> list;
  List<Object?> get props => [user, list];
}

class UserRef extends UserState {
  UserRef(
    this.user,
    this.list,
  );
  final User user;
  final List<Password> list;
  List<Object?> get props => [user, list];
}

class UserChangePass extends UserState {
  UserChangePass(
    this.user,
    this.list,
  );
  final User user;
  final List<Password> list;
  List<Object?> get props => [user, list];
}
