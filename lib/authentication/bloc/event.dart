import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/module/login/user_entity.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

///app启动，检测是否通过身份认证
class AppStarted extends AuthenticationEvent {}

///成功登陆
class LoggedIn extends AuthenticationEvent {
  final String basic;
  final UserEntity user;
  final BuildContext context;

  LoggedIn({
    @required this.basic,
    @required this.context,
    @required this.user,
  });
}

///注销
class LoggedOut extends AuthenticationEvent {
  final BuildContext context;

  LoggedOut({@required this.context});
}
