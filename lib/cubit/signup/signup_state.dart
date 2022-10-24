part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState {
  final String login;
  final String password;
  final SignupStatus status;
  SignupState(
      {required this.login, required this.password, required this.status});

  factory SignupState.initial() {
    return SignupState(login: '', password: '', status: SignupStatus.initial);
  }

  SignupState copyWith({
    String? login,
    String? password,
    SignupStatus? status,
  }) {
    return SignupState(
      login: login ?? this.login,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [login, password, status];
}

class SignupInitial extends SignupState {}
