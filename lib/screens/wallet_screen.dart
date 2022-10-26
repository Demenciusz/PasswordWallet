import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/domain/encrypter.dart';
import 'package:bsi/domain/show_hash.dart';
import 'package:bsi/screens/widgets/my_listview.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/w_data.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool nom = true;

  @override
  Widget build(BuildContext context) {
    final salt = BlocProvider.of<UserCubit>(context).userData!.salt;
    final list = BlocProvider.of<UserCubit>(context).userList;
    final visable = <bool>[];
    list?.forEach(
      (element) {
        visable.add(false);
      },
    );
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
            BlocProvider.of<UserCubit>(context).addPassPage();
          },
        ),
      ),
      appBar: AppBar(
        title: const Text('PASSWORDWALLET'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.7,
                child: list != null
                    ? ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return MyListView(
                            login: list[index].login,
                            web: list[index].web,
                            description: list[index].description,
                            password: list[index].password,
                            visable: visable[index],
                            salt: salt,
                            id: list[index].id,
                          );
                        },
                      )
                    : const Text(''),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<UserCubit>(context).goToLogin();
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<UserCubit>(context).goToPassChange();
                    },
                    child: const Text(
                      'Change Password',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
