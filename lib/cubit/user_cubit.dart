import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bsi/constant.dart';
import 'package:bsi/cubit/user_state.dart';
import 'package:bsi/data/w_data.dart';
import 'package:bsi/domain/encrypter.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get_ip_address/get_ip_address.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoggedOut());

  User? get userData {
    if (state is UserLogin) {
      return (state as UserLogin).user;
    } else if (state is UserAddingPass) {
      return (state as UserAddingPass).user;
    } else if (state is UserRef) {
      return (state as UserRef).user;
    } else if (state is UserChangePass) {
      return (state as UserChangePass).user;
    }
    return null;
  }

  List<Password>? get userList {
    if (state is UserLogin) {
      return (state as UserLogin).list;
    } else if (state is UserAddingPass) {
      return (state as UserAddingPass).list;
    }
    return null;
  }

  WDatabase database = WDatabase();
  Future<void> resetIp() async {
    final ipAddress = IpAddress(type: RequestType.json);
    final dynamic data = await ipAddress.getIpAddress();
    await database.changeLoginIpS(data['ip'].toString());
  }

  Future<void> login({
    required String login,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final user = await database.getUserByLogin(login);
      final ipAddress = IpAddress(type: RequestType.json);
      final dynamic data = await ipAddress.getIpAddress();
      late LoginIp loginIp;
      try {
        loginIp = await database.getIpAddressByIp(data['ip'].toString());
      } catch (e) {
        throw Exception('Nie udało się pobrać pobrać obiektu ip z bazy');
      }
      if (loginIp.counter == 3) {
        final time = loginIp.lastNoSucces.add(const Duration(seconds: 5));
        if (time.isAfter(DateTime.now())) {
          throw Exception('czas');
        }
        print('d:4');
      }
      if (loginIp.counter == 4) {
        final time = loginIp.lastNoSucces.add(const Duration(seconds: 10));
        if (time.isAfter(DateTime.now())) {
          throw Exception('czas');
        }
      }
      print('d:5');
      if (loginIp.counter > 4) {
        throw Exception('ban');
      }
      print('d:1');
      String zm;
      if (user.sha) {
        zm = Encrypter.makeSha('${user.salt}$pepper$password');
        print('sha');
        print(zm);
      } else {
        zm = Encrypter.makeHMAC(password, user.salt);
        print('hmac');
      }
      print('d:2');

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
      print('d:3');
      final passwords = await database.getAllUserPasswords(user.id);

      print('d:6');
      await database.changeLoginIpS(data['ip'].toString());
      print('d:7');
      emit(UserLogin(user, passwords));
      print(UserCubit());
    } catch (exp) {
      print('--------------------------- $exp ---------------------');
      String a = exp.toString();
      print(a);
      if (a == 'Exception: ban') {
        await Fluttertoast.showToast(
            msg: 'masz bana',
            gravity: ToastGravity.BOTTOM_RIGHT,
            toastLength: Toast.LENGTH_SHORT);
      }
      if (a == 'Exception: czas') {
        await Fluttertoast.showToast(
            msg: 'ban czasowy',
            gravity: ToastGravity.BOTTOM_RIGHT,
            toastLength: Toast.LENGTH_SHORT);
      }
      if (a != 'Exception: ban' && a != 'Exception: czas') {
        try {
          final ipAddress = IpAddress(type: RequestType.json);
          final dynamic data = await ipAddress.getIpAddress();
          LoginIp loginIp;
          loginIp = await database.getIpAddressByIp(data['ip'].toString());
          await database.changeLoginIpN(data['ip'].toString(), loginIp.counter);
          loginIp = await database.getIpAddressByIp(data['ip'].toString());
          print(loginIp.counter);
          print('co sie dzieje');
        } catch (e) {
          print(e);
        }
      }

      print(exp);
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
      print(e);
    }
  }

  Future<void> goToRegister() async {
    emit(UserRegistering());
  }

  Future<void> goToLogin() async {
    emit(UserLoggedOut());
  }

  Future<void> addPassPage() async {
    emit(UserAddingPass(userData!, userList!));
  }

  Future<void> ref() async {
    final passwords = await database.getAllUserPasswords(userData!.id);
    emit(UserLogin(userData!, passwords));
  }

  Future<void> goToPassChange() async {
    final passwords = await database.getAllUserPasswords(userData!.id);
    emit(UserChangePass(userData!, passwords));
  }

  Future<void> addPassword({
    required String login,
    required String password,
    required String web,
    required String description,
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
      Encrypter.encryptPass(password, userData!.salt);
      final comp = PasswordsCompanion(
        login: Value(login),
        password: Value(Encrypter.encryptPass(password, userData!.salt)),
        web: Value(web),
        description: Value(description),
        userId: Value(userData!.id),
      );
      await database.addPassword(comp);
      final passwords = await database.getAllUserPasswords(userData!.id);
      emit(UserLogin(userData!, passwords));
    } catch (e) {
      print('Nie dodano hasła heh');
    }
  }

  Future<void> deletePassword(int id) async {
    await database.removePasswordById(id);
    database.getAllUserPasswords(userData!.id).then((passwords) {
      emit(UserLogin(userData!, passwords));
    });
  }

  Future<void> changeUserPassword({
    required String oldPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
    try {
      final salt = Encrypter.generateSalt();
      String zm;
      if (userData!.sha) {
        zm = Encrypter.makeSha('${userData!.salt}$pepper$oldPassword');
      } else {
        zm = Encrypter.makeHMAC(oldPassword, userData!.salt);
      }
      if (zm != userData!.passwordH) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ERROR'),
            content: const Text('Old password is not corect'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          ),
        );
        throw Exception();
      } else {
        if (userData!.sha) {
          zm = Encrypter.makeSha('$salt$pepper$newPassword');
        } else {
          zm = Encrypter.makeHMAC(newPassword, salt);
        }
        final list = await database.getAllUserPasswords(userData!.id);
        List<String> decrypt = [];
        List<Password> newPass = [];
        await database.removeAllPasswords(userData!.id);
        await database.changeUserPassword(
            id: userData!.id, text: zm, salt: salt);
        for (int i = 0; i < list.length; i++) {
          decrypt.add(Encrypter.decryptPass(list[i].password, userData!.salt));
          newPass.add(list[i]
              .copyWith(password: Encrypter.encryptPass(decrypt[i], salt)));
          await database.addPassword(
            PasswordsCompanion(
              login: Value(newPass[i].login),
              password: Value(newPass[i].password),
              web: Value(newPass[i].web),
              description: Value(newPass[i].description),
              userId: Value(userData!.id),
            ),
          );
        }
        emit(UserLoggedOut());
      }
    } catch (e, s) {
      log(
        'Error while changing password',
        stackTrace: s,
      );
    }
  }
}
