import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:turanv2/models/user-model.dart';

class UserRepository {
  Future<void> _init() async {
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    try {
      Hive.init(directory.path);
      Hive.registerAdapter(UserModelAdapter());
    } catch (error) {
      debugPrint('error on register adapter');
    }
  }

  void saveUser(UserModel? user) async {
    await _init();
    var _box = await Hive.openBox<UserModel?>('user');
    _box.add(user);
    debugPrint('User saved succesfully');
  }

  Future<UserModel?> getUser() async {
    try {
      await _init();
      var _box = await Hive.openBox<UserModel?>('user');
      final _user = _box.getAt(0);
      return _user;
    } catch (error) {
      return null;
    }
  }
}
