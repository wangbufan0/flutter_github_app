import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_app/authentication/bloc/bloc.dart';
import 'package:flutter_github_app/authentication/bloc/event.dart';
import 'package:flutter_github_app/authentication/bloc/state.dart';
import 'package:flutter_github_app/authentication/splash_page.dart';
import 'package:flutter_github_app/module/home/home_page.dart';
import 'package:flutter_github_app/theme/bloc/theme_bloc.dart';


import 'base/router.dart';
import 'module/login/login_page.dart';
import 'theme/bloc/theme_state.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BotToastInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc()..add(AppStarted());
            },
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter github Demo',
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            primarySwatch: state.themeColor,
          ),
          routes: Router.routes,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationUninitialized) {
                return SplashPage();
              } else if (state is AuthenticationAuthenticated) {
                return HomePage.buider(context);
//                return BlocProvider<BaseListBloc<Repos>>(
//                  create: (context)=>BaseListBloc<Repos>(),
//                  child: HomeListPage(),
//                );
              } else if (state is AuthenticationUnauthenticated) {
                return LoginPage();
              }
              return SplashPage();
            },
          ),
        );
      },
    );
  }
}
