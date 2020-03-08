import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/base/bloc/base_state.dart';

///
/// author：wangbufan
/// time: 2020/2/22
/// email: wangbufan00@gmail.com
///

class ThemeState extends Equatable{

  final MaterialColor themeColor;

  ThemeState(this.themeColor);

  static ThemeState initial(){
    return ThemeState(Colors.blue);
  }

  @override
  // TODO: implement props
  List<Object> get props =>[themeColor];

}


