import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ref extends StatefulWidget {
  const ref({super.key});

  @override
  State<ref> createState() => _refState();
}

class _refState extends State<ref> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).ref();
    return Container();
  }
}
