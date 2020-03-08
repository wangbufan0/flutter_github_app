import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/authentication/bloc/bloc.dart';
import 'package:flutter_github_app/authentication/bloc/event.dart';
import 'package:flutter_github_app/authentication/user_repository.dart';
import 'package:flutter_github_app/base/manager/dialog_manager.dart';
import 'package:flutter_github_app/module/login/bloc/event.dart';
import 'package:flutter_github_app/module/login/bloc/state.dart';
import 'package:flutter_github_app/module/login/login_provider.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authenticationBloc,
  }) : assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      DialogManager().showLoadingDialog(event.context);
      final basic = await LoginProvider.getBasic(
        username: event.username,
        password: event.password,
      );
      final user = await LoginProvider.login(
        username: event.username,
        password: event.password,
        basic: basic,
      );
      authenticationBloc.add(LoggedIn(
        basic: basic,
        user: user,
        context: event.context,
      ));
    } catch (error) {
      DialogManager().hideDialog(event.context);
      yield LoginFailure(error: error.toString());
    }
  }
}
