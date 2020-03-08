import 'package:flutter_github_app/base/manager/shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// author：wangbufan
/// time: 2020/2/27
/// email: wangbufan00@gmail.com
///

class ThemeRepository{

  static const _ThemeColor='ThemeColor';
  factory ThemeRepository()=>ThemeRepository._();

  ThemeRepository._();

  static Future<int> getThemeColorIndex()async{
    int index= await SPManager.getInt(_ThemeColor);
    if(index>4)index=4;
    else if(index <0)index=0;
    return index;
  }

  static setThemeColorIndex(int index)async{
    return SPManager.setInt(_ThemeColor, index);
  }

}


