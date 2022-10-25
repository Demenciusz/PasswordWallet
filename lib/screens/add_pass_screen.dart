import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPassScreen extends StatefulWidget {
  const AddPassScreen({super.key});

  @override
  State<AddPassScreen> createState() => _AddPassScreenState();
}

class _AddPassScreenState extends State<AddPassScreen> {
  late final TextEditingController loginController;

  late final TextEditingController passwordController;

  late final TextEditingController webController;

  late final TextEditingController descriptionController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    webController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const Text('Web:'),
            TextField(
              controller: webController,
            ),
            const Text('Login:'),
            TextField(
              controller: loginController,
            ),
            const Text('Password:'),
            TextField(
              controller: passwordController,
            ),
            const Text('Description:'),
            TextField(
              controller: descriptionController,
            ),
            TextButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).addPassword(
                    login: loginController.text,
                    password: passwordController.text,
                    web: webController.text,
                    description: descriptionController.text,
                    context: context,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text('ADD'),
                )),
          ],
        ),
      ),
    );
  }
}
