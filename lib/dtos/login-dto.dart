import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'base-dto.dart';

class LoginDto with BaseDto {
  String? email;
  String? password;
  LoginDto(dynamic id, {@required this.email, @required this.password})
      : assert(id != null, 'Id can not be valued as null'),
        assert(email != null, 'Email can not be valued as null'),
        assert(password != null, 'Password can not be valued as null') {
    this.id = id;
  }

  String toJson() {
    return json.encode(toMap());
  }

  Map toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
