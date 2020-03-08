import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/module/login/user_entity.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

abstract class AuthenticationState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

///未初始化
class AuthenticationUninitialized extends AuthenticationState{}

///已成功
class AuthenticationAuthenticated extends AuthenticationState{
  final UserEntity userData;

  AuthenticationAuthenticated({@required this.userData});

  @override
  // TODO: implement props
  List<Object> get props => [userData];
}

///未登录
class AuthenticationUnauthenticated extends AuthenticationState{}

