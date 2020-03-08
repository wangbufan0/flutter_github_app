import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/authentication/bloc/event.dart';
import 'package:flutter_github_app/authentication/bloc/state.dart';
import 'package:flutter_github_app/authentication/user_repository.dart';
import 'package:flutter_github_app/base/manager/dialog_manager.dart';
import 'package:flutter_github_app/base/request.dart';
import 'package:flutter_github_app/module/login/user_entity.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool isLogin = await UserRepository().hasBasic();
      if (isLogin) {
        UserEntity user=await UserRepository().getUser();
        String basic=await UserRepository().getBasic();
        Request.setBasic(basic);
        yield AuthenticationAuthenticated(userData: user);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      await UserRepository().persistBasic(event.basic);
      await UserRepository().persistUser(event.user);
      Request.setBasic(event.basic);
      DialogManager().hideDialog(event.context);
      yield AuthenticationAuthenticated(userData: event.user);
    }

    if (event is LoggedOut) {
      DialogManager().showLoadingDialog(event.context);
      await UserRepository().deleteBasic();
      await UserRepository().deleteUser();
      Request.deleteBasic();
      DialogManager().hideDialog(event.context);
      yield AuthenticationUnauthenticated();
    }
  }
}
