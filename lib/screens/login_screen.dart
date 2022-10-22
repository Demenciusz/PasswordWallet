// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:bsi/domain/state_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            SizedBox(
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    StateController().LoginUser(context);
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                )),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {},
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
