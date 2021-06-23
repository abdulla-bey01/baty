import 'package:flutter/foundation.dart';
import 'package:turanv2/models/base-model.dart';
import 'package:hive/hive.dart';
part 'user-model.g.dart';

@HiveType(typeId: 1)
class UserModel with BaseModel {
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? role;
  @HiveField(4)
  String? title;
  @HiveField(5)
  String? name;
  @HiveField(6)
  int? companyId;
  UserModel(
    dynamic id, {
    @required this.email,
    @required this.password,
    this.companyId,
    this.name,
    this.role,
    this.title,
  })  : assert(id != null, 'Id can not be valued as null'),
        assert(email != null, 'Email can not be valued as null'),
        assert(password != null, 'Password can not be valued as null') {
    this.id = id;
  }
}
