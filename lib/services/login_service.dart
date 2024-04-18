import 'package:flutter_gallery/apis/apis.dart';
import 'package:flutter_gallery/utils/http/http_using.dart';
import 'package:flutter_gallery/models/login_model_entity.dart';
import 'package:flutter_gallery/models/common_entity.dart';

class LoginService {
  static Future<LoginModelEntity> fetchLogin(params) async {
    var response = await Fetch.post(
      UserApi.login,
      data: params,
    );
    // 转换模型
    return LoginModelEntity.fromJson(response);
  }

  static Future<CommonEntity> fetchRegister(params) async {
    var response = await Fetch.post(
      UserApi.register,
      data: params,
    );
    // 转换模型
    return CommonEntity.fromJson(response);
  }
}
