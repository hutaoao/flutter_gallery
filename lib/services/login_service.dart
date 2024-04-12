import 'apis.dart';
import 'package:flutter_gallery/utils/http/http_using.dart';

class LoginService {
  static Future login(params) async{
    return await Fetch.post(
      UserApi.login,
      data: params,
    );
  }
  static Future register(params) async{
    return await Fetch.post(
      UserApi.register,
      data: params,
    );
  }
}
