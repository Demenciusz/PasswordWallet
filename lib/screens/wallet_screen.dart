import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          child: TextButton(
            child: const Text(
              'Add Password',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Dodawanie hasła'),
                  content: Column(
                    children: const [
                      Text('Nazwa:'),
                      TextField(),
                      Text('Login:'),
                      TextField(),
                      Text('Hasło:'),
                      TextField()
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.add))
                  ],
                ),
              );
            },
          )),
      body: SizedBox.expand(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dodaj'),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).goToLogin();
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
