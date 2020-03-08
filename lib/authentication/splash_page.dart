import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/base/page/base_page.dart';
import 'package:flutter_github_app/base/router.dart';

///
/// author：wangbufan
/// time: 2020/2/24
/// email: wangbufan00@gmail.com
///

class SplashPage extends BasePage<SplashPage,Bloc>{

  static const String router=Router.baseRoute+'splash';

  SplashPage({Key key}):super(key:key,routerName:router);

  @override
  String get barTile => null;

  @override
  Widget getBody() {
    // TODO: implement getBody
    return Scaffold(
      body: Center(
        child: Text('splash screen'),
      ),
    );
  }

  @override
  Bloc getBLoc(BuildContext context) {
    // TODO: implement getBLoc
    return null;
  }

}


