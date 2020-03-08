
import 'dart:convert';
import 'dart:core';
import 'package:flutter_github_app/base/manager/shared_preferences_manager.dart';
import 'package:flutter_github_app/module/login/user_entity.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

class UserRepository {
  factory UserRepository() => UserRepository._();

  UserRepository._();

  Future<void> deleteBasic() async {
    /// delete from keystore/keychain
    await SPManager.setString('basic', '');
    return;
  }

  Future<void> persistBasic(String token) async {
    /// write to keystore/keychain
    await SPManager.setString('basic', token);
    return;
  }

  Future<bool> hasBasic() async {
    /// read from keystore/keychain
    String data = await SPManager.getString('basic');
    if (data != null && data.isNotEmpty) return true;
    return false;
  }

  Future<String> getBasic()async{
    String data = await SPManager.getString('basic');
    return data;
  }

  Future<void> deleteUser() async {
    /// delete from keystore/keychain
    await SPManager.setString('userData', '');
    return;
  }

  Future<void> persistUser(UserEntity user) async {
    /// write to keystore/keychain

    await SPManager.setString('userData', jsonEncode(user));
    return;
  }

  Future<UserEntity> getUser() async {
    /// read from keystore/keychain
    String data = await SPManager.getString('userData');
    return UserEntity().fromJson(jsonDecode(data));
  }
}
