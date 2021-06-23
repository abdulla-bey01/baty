import 'package:turanv2/dtos/login-dto.dart';
import 'package:turanv2/models/login-model.dart';

import 'migrator.dart';

class LoginMigrator extends Migrator<LoginModel, LoginDto> {
  @override
  LoginDto? migrateToDto(LoginModel? model) {
    return LoginDto(model!.id, email: model.email, password: model.password);
  }

  @override
  LoginModel? migrateToModel(LoginDto? dto) {
    return LoginModel(dto!.id, email: dto.email, password: dto.password);
  }
}
