import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_app/base/manager/dialog_manager.dart';

///
/// author：wangbufan
/// time: 2020/1/12
/// email: wangbufan00@gmail.com
///

abstract class BasePage<T extends BasePage<T, B>, B extends Bloc>
    extends StatefulWidget {
  final String routerName;

  BasePage({Key key, this.routerName}) : super(key: key);

  BuildContext context;

  //页面实体
  Widget getBody();

  //标题，如果置空隐藏标题
  String get barTile;

  //bloc
   B get bloc{
    if(_bloc==null){
      _bloc=getBLoc(context);
    }
    return _bloc;
   }

   B getBLoc(BuildContext context);

   B _bloc;

  //初始化
  void onCreate() {}

  //销毁时
  void onDestroy() {}

  //获得标题实体
  Widget getBar() {
    return barTile == null
        ? null
        : AppBar(
            title: Text(barTile),
          );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getBar(),
      body: getBody(),
    );
  }



  @override
  State createState() => _BasePageState<T, B>();
}

class _BasePageState<T extends BasePage<T, B>, B extends Bloc>
    extends State<T> {
  @override
  void initState() {
    super.initState();
    widget.context = context;
    widget._bloc=widget.getBLoc(context);
    widget.onCreate();
  }

  @override
  void dispose(){
    widget.onDestroy();
    if(DialogManager().isShowDialog==true){
      DialogManager().hideDialog(context);
    }
    if(widget.bloc!=null){
      widget.bloc.close();
    }
    widget._bloc=null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    widget.context = context;
    return widget.build(context);
  }
}
