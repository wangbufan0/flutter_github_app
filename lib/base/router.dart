import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/authentication/splash_page.dart';
import 'package:flutter_github_app/module/home/home_page.dart';
import 'package:flutter_github_app/module/login/login_page.dart';
import 'package:flutter_github_app/theme/theme_page.dart';

///
/// author：wangbufan
/// time: 2020/2/20
/// email: wangbufan00@gmail.com
///

class Router{

  static const String baseRoute='router://app.github.com/';

  static Map<String,WidgetBuilder> routes={
    SplashPage.router:(context)=>SplashPage(),
    LoginPage.router:(context)=>LoginPage(),
    ThemePage.router:(context)=>ThemePage(),
    HomePage.router:(context)=>HomePage(),
  };

}


