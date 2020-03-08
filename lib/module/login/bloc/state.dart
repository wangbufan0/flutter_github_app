import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

///初始化状态
class LoginInitial extends LoginState {}

///登录失败的状态
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure{error: $error}';
}
