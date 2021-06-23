import 'package:flutter/foundation.dart';

import 'base-dto.dart';

class UserDto with BaseDto {
  String? email;
  String? password;
  String? role;
  String? title;
  String? name;
  int? companyId;
  UserDto(
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
