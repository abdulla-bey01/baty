import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turanv2/providers/login-provider.dart';
import 'package:turanv2/screens/entry-screen.dart';
import 'package:turanv2/screens/login-result-screen.dart';
import 'package:turanv2/screens/login-screen.dart';
import 'package:turanv2/screens/main-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LoginProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        routes: {
          LoginScreen.route: (_) => LoginScreen(),
          LoginResultScreen.route: (_) => LoginResultScreen(),
          EntryScreen.route: (_) => EntryScreen(),
          MainScreen.route: (_) => MainScreen(),
        },
        initialRoute: EntryScreen.route,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
