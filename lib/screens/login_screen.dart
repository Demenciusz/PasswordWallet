import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/cubit/user_state.dart';
import 'package:bsi/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
                  onPressed: () {},
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                )),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).goToRegister();
                },
                child: Text(
                  'Register',
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
