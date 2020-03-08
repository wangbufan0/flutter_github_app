import 'package:flutter_github_app/base/request.dart';
import 'package:flutter_github_app/module/home/repos.dart';

///
/// @author: wangbufan
/// @function:
///
List<Repos> _getReposList(List<dynamic> list) {
  List<Repos> result = [];
  list.forEach((item) {
    result.add(Repos.fromJson(item));
  });
  return result;
}

class ReposProvider {
  static Future<List<Repos>> getRepos(String login, int pageIndex) async {
    pageIndex++;
    ResultData result = await Request.get(
      url: 'users/$login' + '/repos'+'?page=$pageIndex&per_page=5',
    );
    var data;
    if (result.result) {
      data = _getReposList(result.data);
    } else {
      throw Error();
    }
    print(data);
    return data;
  }
}
