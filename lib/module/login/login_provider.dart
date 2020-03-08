import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/base/request.dart';
import 'package:flutter_github_app/module/login/user_entity.dart';

///
/// author：wangbufan
/// time: 2020/2/26
/// email: wangbufan00@gmail.com
///

class LoginProvider {
  static getBasic({
    @required String username,
    @required String password,
  }) {
    return 'Basic ' + base64.encode(utf8.encode('$username:$password'));
  }

  static Future<UserEntity> login({
    @required String username,
    @required String password,
    @required String basic,
  }) async {
    var result = await Request.get(url: 'users/$username', header: {
      HttpHeaders.authorizationHeader: basic,
    });
    var data;
    if (result.result) {
      data = UserEntity().fromJson(result.data);
    } else {
      throw Error();
    }
    return data;
  }
}
