import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:turanv2/models/login-model.dart';
import 'package:turanv2/providers/login-provider.dart';
import 'package:turanv2/screens/login-result-screen.dart';
import 'package:turanv2/services/login-service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const route = '/login-screen';
  final TextEditingController? _emailController = new TextEditingController();
  final TextEditingController? _passwordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _sizes = MediaQuery.of(context).size;
    final _width = _sizes.width;
    final _safeAreaHeight =
        _sizes.height - MediaQuery.of(context).viewInsets.top;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _safeAreaHeight,
          width: _width,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  width: _width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: InkWell(
                            onTap: () {
                              _login(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text(
                            'Have you forgotted username or password?',
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoginResultScreen.route);
    final _login = new LoginModel(1,
        email: _emailController!.text, password: _passwordController!.text);
    final _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final _loginService = new LoginService(provider: _loginProvider);
    _loginService.login(login: _login);
  }
}
