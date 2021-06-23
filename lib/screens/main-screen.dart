import 'package:flutter/material.dart';
import 'package:turanv2/models/user-model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, this.user}) : super(key: key);
  final UserModel? user;
  static const route = '/main-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is main screen'),
            Text(user!.email ?? 'email does not exists'),
            Text(user!.name ?? 'name does not exists'),
          ],
        ),
      ),
    );
  }
}
