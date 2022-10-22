import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  RouteGenerator();
  UserCubit routeCubit = UserCubit();
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: routeCubit,
              )
            ],
            child: BuilderWidget(),
          ),
        );
    }
    return MaterialPageRoute(builder: (_) => const BuilderWidget());
  }
}
