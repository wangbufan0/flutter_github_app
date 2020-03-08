import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_github_app/base/page/base_page.dart';
import 'bloc/base_list_bloc.dart';
import 'bloc/base_list_event.dart';
import 'bloc/base_list_state.dart';

///
/// author：wangbufan
/// time: 2020/2/28
/// email: wangbufan00@gmail.com
///

abstract class BaseListPage<D>
    extends BasePage<BaseListPage<D>, BaseListBloc<D>> {
  BaseListPage({Key key, String router}) : super(key: key, routerName: router);

  int page = 0;

  Future<List<D>> loadData(int page);

  @override
  BaseListBloc<D> getBLoc(BuildContext context) =>BaseListBloc<D>();

  _getData({@required isRefresh}) async {
    try {
      if (isRefresh) {
        List<D> data = await loadData(0);
        bloc.add(BaseListRefreshEvent<D>(data: data));
        page = 1;
      } else {
        List<D> data = await loadData(page);
        if (data != null && data.isNotEmpty) {
          bloc.add(BaseListLoadMoreEvent<D>(data: data));
          page++;
        } else {
          BotToast.showText(text: '没有新数据了，上拉重试。');
        }
      }
    } catch (error) {
      bloc.add(BaseListErrorEvent(error: error.toString()));
    }
  }

  //加载失败界面
  Widget getErrorWidget(String error) {
    return Container(
      color: Colors.deepOrange,
      child: InkWell(
        onTap: () {
          _getData(isRefresh: true);
          bloc.add(BaseListInitEvent());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('出现了一些错误，点击重试，错误如下：'),
              Text('Error occured: $error'),
            ],
          ),
        ),
      ),
    );
  }

  //加载空界面
  Widget getLoadingWidget() {
    return Container(
//      color: Colors.deepOrange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('载入中...'),
            ),
          ],
        ),
      ),
    );
  }

  Widget getListTitle(D data);

  Widget getList(List<D> datas) {
    return ListView(
      children: datas.map((data) {
        return getListTitle(data);
      }).toList(),
    );
  }

  Future onRefresh() async {
    await _getData(isRefresh: true);
    return;
  }

  Future onLoading() async {
    await _getData(isRefresh: false);
    return;
  }

  @override
  void onCreate() {
    super.onCreate();
    _getData(isRefresh: true);
  }

  @override
  Widget getBody() {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<BaseListBloc<D>, BaseListState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is BaseListLoadingState) {
                  return getLoadingWidget();
                } else if (state is BaseListErrorState) {
                  return getErrorWidget(state.error);
                } else if (state is BaseListSuccessState<D>) {
                  return EasyRefresh(
                    header: MaterialHeader(),
                    footer: MaterialFooter(),
                    onRefresh: onRefresh,
                    onLoad: onLoading,
                    child: getList(state.datas),
                  );
                }
                return getErrorWidget('不可能出现的错误');
              },
            ),
          ),
        ],
      ),
    );
  }
}
