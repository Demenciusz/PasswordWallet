import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  late final TextEditingController loginText;
  late final TextEditingController passwordText1;

  @override
  void initState() {
    super.initState();
    loginText = TextEditingController();
    passwordText1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REJESTRACJA',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 50,
                width: 200,
                child: TextField(
                  controller: loginText,
                  maxLength: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Login',
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 50,
                width: 200,
                child: TextField(
                  controller: passwordText1,
                  maxLength: 16,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Password',
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SHA512?',
                  style: TextStyle(fontSize: 20),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  final login = loginText.text;
                  final password = passwordText1.text;
                  BlocProvider.of<UserCubit>(context).register(
                    login: login,
                    password: password,
                    sha: isChecked,
                    context: context,
                  );
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).goToLogin();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
