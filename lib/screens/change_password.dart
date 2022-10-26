import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Old Password:'),
            TextField(
              controller: oldPasswordController,
            ),
            const Text('New Password:'),
            TextField(
              controller: newPasswordController,
            ),
            TextButton(
                onPressed: (() {
                  BlocProvider.of<UserCubit>(context).changeUserPassword(
                    oldPassword: oldPasswordController.text,
                    newPassword: newPasswordController.text,
                    context: context,
                  );
                }),
                child: Text('Change password'))
          ],
        ),
      ),
    );
  }
}
