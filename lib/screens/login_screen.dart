import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/cubit/user_state.dart';
import 'package:bsi/domain/ip_manager.dart';
import 'package:bsi/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:get_ip_address/get_ip_address.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController loginText;

  late final TextEditingController passwordText1;

  @override
  void initState() {
    super.initState();
    loginText = TextEditingController();
    passwordText1 = TextEditingController();
    IpManager.addIp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    controller: loginText,
                    maxLength: 6,
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
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 50,
                width: 200,
                child: TextField(
                  controller: passwordText1,
                  maxLength: 6,
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
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  final login = loginText.text;
                  final password = passwordText1.text;
                  print(login);
                  print(password);
                  BlocProvider.of<UserCubit>(context).login(
                    login: login,
                    password: password,
                    context: context,
                  );
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).goToRegister();
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: TextButton(
                child: Text('x'),
                onPressed: () async {
                  BlocProvider.of<UserCubit>(context).resetIp();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
