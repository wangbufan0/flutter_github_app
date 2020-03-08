import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_app/authentication/bloc/bloc.dart';
import 'package:flutter_github_app/authentication/bloc/event.dart';
import 'package:flutter_github_app/authentication/bloc/state.dart';
import 'package:flutter_github_app/base/manager/dialog_manager.dart';
import 'package:flutter_github_app/theme/theme_page.dart';

///
/// author：wangbufan
/// time: 2020/2/27
/// email: wangbufan00@gmail.com
///

class HomeDrawer extends StatelessWidget {
  String getAvatarUrl(AuthenticationState state) {
    return state is AuthenticationAuthenticated
        ? state.userData.avatarUrl
        : null;
  }

  Widget _getHeader() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 40, bottom: 20),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              ClipOval(
                child: Image.network(
                  getAvatarUrl(state),
                  width: 80,
                ),
              ),
              Text(
                state is AuthenticationAuthenticated
                    ? state.userData.login
                    : null,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getMenus(context) {
    void showConfirm() async {
      bool isTrue =
          await DialogManager().showConfirmDialog(context, title: '确认注销？');
      if (isTrue) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut(
          context: context,
        ));
      }
    }

    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.color_lens),
          title: Text('换肤'),
          onTap: () => Navigator.pushNamed(context, ThemePage.router),
        ),
        ListTile(
          leading: Icon(Icons.power_settings_new),
          title: Text('注销'),
          onTap: showConfirm,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _getHeader(),
            Expanded(child: _getMenus(context)),
          ],
        ),
      ),
    );
  }
}
