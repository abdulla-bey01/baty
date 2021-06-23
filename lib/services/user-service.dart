import 'package:turanv2/local-datas-repositories/user-repository.dart';
import 'package:turanv2/models/user-model.dart';

class UserService {
  Future<UserModel?> getUser() async {
    return UserRepository().getUser();
    //return _user;
  }
}
