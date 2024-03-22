import 'package:flutter_gallery/utils/http/http_using.dart';

class UserApi {
  // 登录
  static Future login(params) async{
    return await Fetch.post('/apis/login', data: params);
  }

  // 获取语雀仓库的文档列表
  static Future getYuQueDocs(params) async{
    return await Fetch.get('/apis/get-yuque-docs', data: params);
  }

  // 获取标签
  static Future getTags(params) async{
    return await Fetch.get('/apis/admin/get-tags', data: params);
  }
}
