import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_app/authentication/bloc/bloc.dart';
import 'package:flutter_github_app/authentication/bloc/state.dart';
import 'package:flutter_github_app/base/page/list/base_list_page.dart';
import 'package:flutter_github_app/base/page/list/bloc/base_list_bloc.dart';
import 'package:flutter_github_app/base/router.dart';
import 'package:flutter_github_app/module/home/home_drawer.dart';
import 'package:flutter_github_app/module/home/repos.dart';
import 'package:flutter_github_app/module/home/repos_provider.dart';

///
/// author：wangbufan
/// time: 2020/2/21
/// email: wangbufan00@gmail.com
///

class HomePage extends BaseListPage<Repos> {
  static const String router = Router.baseRoute + 'home/list';

  HomePage({Key key}) : super(key: key, router: router);

  String login;

  @override
  String get barTile => 'home_page';

  static WidgetBuilder buider = (context) {
    return BlocProvider<BaseListBloc<Repos>>(
      create: (context) => BaseListBloc<Repos>(),
      child: HomePage(),
    );
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBar(),
      drawer: HomeDrawer(),
      body: getBody(),
    );
  }

  @override
  Widget getListTitle(Repos data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                dense: true,
                leading: ClipOval(
                  child: Image.network(
                    data.owner.avatarUrl,
                    width: 24,
                  ),
                ),
                title: Text(
                  data.owner.login,
                  textScaleFactor: .9,
                ),
                //subtitle: subtitle,
                trailing: Text(data.language ?? ""),
              ),
              // 构建项目标题和简介
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.fork ? data.fullName : data.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            data.fork ? FontStyle.italic : FontStyle.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                      child: data.description == null
                          ? Text(
                              'mmmmmmmm',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[700]),
                            )
                          : Text(
                              data.description,
                              maxLines: 3,
                              style: TextStyle(
                                height: 1.15,
                                color: Colors.blueGrey[700],
                                fontSize: 13,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              // 构建卡片底部信息
              _buildBottom(data)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom(Repos data) {
    const paddingWidth = 10;
    return IconTheme(
      data: IconThemeData(
        color: Colors.grey,
        size: 15,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.grey, fontSize: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            var children = <Widget>[
              Icon(Icons.star),
              Text(
                  " " + data.stargazersCount.toString().padRight(paddingWidth)),
              Icon(Icons.info_outline),
              Text(
                  " " + data.openIssuesCount.toString().padRight(paddingWidth)),

              Icon(Icons.add_a_photo), //我们的自定义图标
              Text(data.forksCount.toString().padRight(paddingWidth)),
            ];

            if (data.fork) {
              children.add(Text("Forked".padRight(paddingWidth)));
            }

            if (data.private == true) {
              children.addAll(<Widget>[
                Icon(Icons.lock),
                Text(" private".padRight(paddingWidth))
              ]);
            }
            return Row(children: children);
          }),
        ),
      ),
    );
  }

  @override
  Future<List<Repos>> loadData(int page) async {
    if (login == null) {
      login = await (BlocProvider.of<AuthenticationBloc>(context).state
              as AuthenticationAuthenticated)
          .userData
          .login;
      return await ReposProvider.getRepos(login, page);
    }
    return await ReposProvider.getRepos(login, page);
  }

  @override
  BaseListBloc<Repos> getBLoc(BuildContext context) {
    return BlocProvider.of<BaseListBloc<Repos>>(context);
  }
}
