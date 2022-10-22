import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateController {
  void LoginUser(BuildContext context) {
    BlocProvider.of<UserCubit>(context, listen: false).userLoggedIn();
  }

  void LogoutUser(BuildContext context) {
    BlocProvider.of<UserCubit>(context, listen: false).userLoggedOut();
  }
}
