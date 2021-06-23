import 'package:flutter/foundation.dart';
import 'package:turanv2/models/base-model.dart';

class LoginModel with BaseModel {
  String? email;
  String? password;
  LoginModel(dynamic id, {@required this.email, @required this.password})
      : assert(id != null, 'Id can not be valued as null'),
        assert(email != null, 'Email can not be valued as null'),
        assert(password != null, 'Password can not be valued as null') {
    this.id = id;
  }
}
