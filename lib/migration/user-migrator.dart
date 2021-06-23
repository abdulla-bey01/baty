import 'package:turanv2/dtos/user-dto.dart';
import 'package:turanv2/migration/migrator.dart';
import 'package:turanv2/models/user-model.dart';

class UserMigrator extends Migrator<UserModel, UserDto> {
  @override
  UserDto? migrateToDto(UserModel? model) {
    return UserDto(
      model!.id,
      email: model.email,
      password: model.password,
      companyId: model.companyId,
      name: model.name,
      role: model.role,
      title: model.title,
    );
  }

  @override
  UserModel? migrateToModel(UserDto? dto) {
    return UserModel(
      dto!.id,
      email: dto.email,
      password: dto.password,
      companyId: dto.companyId,
      name: dto.name,
      role: dto.role,
      title: dto.title,
    );
  }
}
