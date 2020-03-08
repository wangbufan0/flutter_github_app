import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_app/authentication/bloc/bloc.dart';
import 'package:flutter_github_app/base/page/base_page.dart';
import 'package:flutter_github_app/base/router.dart';
import 'package:flutter_github_app/module/login/bloc/bloc.dart';

import 'bloc/event.dart';
import 'bloc/state.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

class LoginPage extends BasePage<LoginPage, LoginBloc> {
  static const String router = Router.baseRoute + 'login';

  LoginPage({Key key}) : super(key: key, routerName: router);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  static WidgetBuilder builder = (context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        );
      },
      child: LoginPage(),
    );
  };

  @override
  // TODO: implement barTile
  String get barTile => 'Login';

  _onLoginButtonPressed() {
    bloc.add(
      LoginEvent(
        username: _usernameController.text,
        password: _passwordController.text,
        context: context,
      ),
    );
  }

  Widget getForm() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'username'),
            controller: _usernameController,
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: _onLoginButtonPressed,
          ),
        ],
      ),
    );
  }

  @override
  Widget getBody() {
    return BlocListener<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: getForm(),
    );
  }

  @override
  LoginBloc getBLoc(BuildContext context) => LoginBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      );
}
