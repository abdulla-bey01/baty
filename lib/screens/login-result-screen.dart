import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turanv2/helpers/enums/login-request-status-enum.dart';
import 'package:turanv2/providers/login-provider.dart';
import 'package:turanv2/screens/main-screen.dart';
import 'package:turanv2/services/user-service.dart';

class LoginResultScreen extends StatelessWidget {
  const LoginResultScreen({Key? key}) : super(key: key);
  static const route = '/login-result-screen';

  @override
  Widget build(BuildContext context) {
    final _loginProvider = Provider.of<LoginProvider>(context);
    final _requestStatus = _loginProvider.requestStatus;
    if (_requestStatus == LoginRequestStatus.Succes) {
      Future.delayed(Duration(seconds: 1)).then(
        (value) async {
          final _userService = UserService();
          final _user = await _userService.getUser();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                user: _user,
              ),
            ),
          );
        },
      );
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: _requestStatus == LoginRequestStatus.Waiting
            ? [
                Center(child: CircularProgressIndicator()),
              ]
            : [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(_requestStatus == LoginRequestStatus.Succes
                        ? 'logined succesfully, after a second you will be redirected to home'
                        : 'could not login'),
                  ),
                )
              ],
      ),
    );
  }
}
