import 'package:bloc/bloc.dart';
import 'package:bsi/data/w_data.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  WDatabase _database = WDatabase();
  SignupCubit({required WDatabase database})
      : _database = database,
        super(SignupState.initial());

  void loginChanged(String value) {
    emit(state.copyWith(login: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }
}
