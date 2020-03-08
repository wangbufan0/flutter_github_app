import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

class LoginEvent extends Equatable {
  final String username;
  final String password;
  final BuildContext context;
  LoginEvent({
    @required this.username,
    @required this.password,
    @required this.context,
  });

  @override
  // TODO: implement props
  List<Object> get props => [username, password,context];

  @override
  String toString() {
    return 'LoginEvent{username: $username, password: $password}';
  }
}
