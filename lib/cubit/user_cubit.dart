import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bsi/cubit/user_state.dart';
import 'package:bsi/data/w_data.dart';
import 'package:bsi/domain/encrypter.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:bsi/domain/encrypter.dart';
import 'package:bsi/constant.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoggedOut());

  WDatabase database = WDatabase();

  Future<void> login({
    required String login,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final user = await database.getUserByLogin(login);
      print('mam usera');
      String zm;
      if (user.sha) {
        zm = Encrypter.makeSha('${user.salt}$pepper$password');
        print('sha');
        print(zm);
      } else {
        zm = Encrypter.makeHMAC(password, user.salt);
        print('hmac');
      }

      if (user.passwordH != zm) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ERROR'),
            content: const Text('Wrong login or password'),
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
      print('pass');
      final passwords = await database.getAllUserPasswords(user.id);
      print('pass cor');
      emit(UserLogin(user, passwords));
      print(UserCubit());
    } catch (e) {
      print('no nie działa');
    }
  }

  Future<void> register({
    required String login,
    required String password,
    required bool sha,
    required BuildContext context,
  }) async {
    try {
      if (login.isEmpty || password.isEmpty) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ERROR'),
            content: const Text('Login or password is epmty'),
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
      final users = await database.getAllUsers();

      if (users.any((element) => element.login == login)) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ERROR'),
            content: const Text('A user with such login already exists'),
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
      String zm;
      final salt = Encrypter.generateSalt();
      if (sha) {
        zm = Encrypter.makeSha('$salt$pepper$password');
        print(zm);
      } else {
        zm = Encrypter.makeHMAC(password, salt);
      }
      final comp = UsersCompanion(
        login: Value(login),
        passwordH: Value(zm),
        salt: Value(salt),
        sha: Value(sha),
      );
      await database.addUser(comp);

      emit(UserLoggedOut());
    } catch (e) {
      print('cos sie zjebało');
    }
  }

  Future<void> goToRegister() async {
    emit(UserRegistering());
  }

  Future<void> goToLogin() async {
    emit(UserLoggedOut());
  }
}
