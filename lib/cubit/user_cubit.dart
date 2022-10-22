import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoggedOut());

  void userLoggedOut() => emit(UserLoggedOut());
  void userLoggedIn() => emit(UserLoggedIn());
}
