import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/encrypter.dart';

class MyListView extends StatefulWidget {
  MyListView({
    required this.login,
    required this.web,
    required this.description,
    required this.password,
    required this.visable,
    required this.salt,
    required this.id,
    required this.func,
  });

  bool visable;
  final String web;
  final String login;
  final String password;
  final String description;
  final String salt;
  final int id;
  VoidCallback func;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(widget.web),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(widget.description),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(widget.login),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: widget.visable
                  ? Text(
                      Encrypter.decryptPass(
                        widget.password,
                        widget.salt,
                      ),
                    )
                  : Text(
                      widget.password,
                    ),
            ),
          ],
        ),
        Checkbox(
          value: widget.visable,
          onChanged: (bool? value) {
            setState(() {
              widget.visable = value!;
            });
          },
        ),
        TextButton(
          onPressed: widget.func,
          child: const Icon(
            Icons.delete,
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<UserCubit>(context).goToShare(widget.id);
          },
          child: const Icon(Icons.share),
        )
      ],
    );
  }
}
