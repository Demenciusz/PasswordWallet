import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/screens/add_pass_screen.dart';
import 'package:bsi/screens/change_password.dart';
import 'package:bsi/screens/ref.dart';
import 'package:bsi/screens/share_pass_screen.dart';
import 'package:bsi/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:bsi/screens/login_screen.dart';
import 'package:bsi/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/user_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserCubit(),
        child: const BuilderWidget(),
      ),
    );
  }
}

class BuilderWidget extends StatelessWidget {
  const BuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoggedOut) {
          return const LoginScreen();
        }
        if (state is UserLogin || state is UserRef) {
          return const WalletScreen();
        }
        if (state is UserRegistering) {
          return const RegisterScreen();
        }
        if (state is UserAddingPass) {
          return const AddPassScreen();
        }
        if (state is UserChangePass) {
          return const ChangePassword();
        }
        if (state is UserSharePass) {
          return SharePassScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
