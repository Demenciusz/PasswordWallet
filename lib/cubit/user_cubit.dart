import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bsi/cubit/user_state.dart';
import 'package:bsi/data/w_data.dart';
import 'package:bsi/domain/encrypter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoggedOut());
  WDatabase database = WDatabase();
  void login(String login, String password) {}

  Future<void> register(
      {required String login,
      required String password,
      required bool sha,
      required BuildContext context}) async {
    try {
      if (login.isEmpty || password.isEmpty) {
        throw Exception();
      }
      final users = await database.getAllUsers();
      if (users.any((element) => element.login == login)) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Błąd'),
            content: const Text('Użytkownik z takim loginem już istnieje'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          ),
        );
        throw Exception();
      }
      final salt =
      if (sha) {}
    } catch (e) {
      emit(UserLoggedOut());
    }
  }

  void goToRegister() {
    emit(UserRegistering());
  }

  void goToLogin() {
    emit(UserLoggedOut());
  }
}
