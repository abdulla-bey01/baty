import 'package:flutter/material.dart';
import 'package:turanv2/models/user-model.dart';
import 'package:turanv2/screens/login-screen.dart';
import 'package:turanv2/screens/main-screen.dart';
import 'package:turanv2/services/user-service.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);
  static const route = '/entry-screen';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: UserService().getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final _user = snapshot.data;
          debugPrint(snapshot.hasData.toString());
          return snapshot.data == null
              ? LoginScreen()
              : MainScreen(
                  user: _user,
                );
        }
      },
    );
  }
}
