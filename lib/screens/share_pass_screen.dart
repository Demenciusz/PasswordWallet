import 'package:bsi/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharePassScreen extends StatefulWidget {
  SharePassScreen({super.key});

  @override
  State<SharePassScreen> createState() => _SharePassScreenState();
}

class _SharePassScreenState extends State<SharePassScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    asyncFun();
  }

  void asyncFun() async {
    controller.text = await BlocProvider.of<UserCubit>(context)
        .getShare(BlocProvider.of<UserCubit>(context).id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: controller,
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).sharePass(
                      BlocProvider.of<UserCubit>(context).id!, controller.text);
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
