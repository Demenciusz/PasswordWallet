import 'package:bsi/cubit/user_cubit.dart';
import 'package:bsi/cubit/user_state.dart';
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
  UserCubit get userCubit => BlocProvider.of<UserCubit>(context);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            userCubit.addPassPage();
          },
        ),
      ),
      appBar: AppBar(
        title: const Text('PASSWORDWALLET'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListBlocBuilder(),
          SharedPasswords(),
          const MenuWidget(),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextButton(
            onPressed: () {
              BlocProvider.of<UserCubit>(context).goToLogin();
            },
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
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
        ),
      ],
    );
  }
}

class ListBlocBuilder extends StatelessWidget {
  const ListBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLogin) {
          print('Lista share');
          print(state.shareList.length);
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              children: state.list
                  .map(
                    (password) => MyListView(
                      login: password.login,
                      web: password.web,
                      description: password.description,
                      password: password.password,
                      visable: state.visable[password.id]!,
                      salt: state.user.salt,
                      id: password.id,
                      func: () => BlocProvider.of<UserCubit>(context)
                          .deletePassword(password.id),
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}

class SharedPasswords extends StatelessWidget {
  SharedPasswords({super.key});

  @override
  Widget build(BuildContext context) {
    List<Password> list = BlocProvider.of<UserCubit>(context).userShareList;
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLogin) {
          return Flexible(
            child: ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(children: [
                  Text(list[index].description),
                  Text(list[index].web),
                  Text(
                    Encrypter.encryptPass(
                      list[index].password,
                      state.user.salt,
                    ),
                  )
                ]);
              },
            ),
          );
        }
        return Text('');
      },
    );
  }
}
