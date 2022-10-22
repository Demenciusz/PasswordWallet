import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/routing.dart';
import 'package:bsi/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:bsi/screens/login_screen.dart';
import 'package:bsi/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RouteGenerator router = RouteGenerator();
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
    );
  }
}

class BuilderWidget extends StatelessWidget {
  const BuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ((context, state) {
        if (state is UserLoggedOut) {
          return LoginScreen();
        }
        if (state is UserLoggedIn) {
          return const WalletScreen();
        }
        return LoginScreen();
      }),
    );
  }
}
