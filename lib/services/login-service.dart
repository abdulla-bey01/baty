import 'package:flutter/foundation.dart';
import 'package:turanv2/local-datas-repositories/user-repository.dart';
import 'package:turanv2/migration/login-migrator.dart';
import 'package:turanv2/migration/user-migrator.dart';
import 'package:turanv2/models/login-model.dart';
import 'package:turanv2/providers/login-provider.dart';
import 'package:turanv2/helpers/extension-methods/string-extensions.dart';

class LoginService {
  late final LoginProvider? provider;
  LoginService({@required this.provider});
  void login({LoginModel? login}) async {
    if (login!.email!.isNullorWhiteSpace ||
        login.password!.isNullorWhiteSpace) {
      debugPrint('error in loginService because of null values');
      throw Exception('Email or password can not be null');
    }
    final _migrator = LoginMigrator();
    final _loginDto = _migrator.migrateToDto(login);
    final _loginResult = await provider!.login(loginDto: _loginDto);
    final _user = UserMigrator().migrateToModel(_loginResult);
    UserRepository().saveUser(_user);
  }
}
