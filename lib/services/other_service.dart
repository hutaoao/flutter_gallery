import 'package:flutter_gallery/apis/apis.dart';
import 'package:flutter_gallery/utils/http/http_using.dart';
import 'package:flutter_gallery/models/common_entity.dart';

class OtherService {
  static Future fetchLeaveMessage(params) async {
    var response = await Fetch.post(
      OtherApi.leaveMessage,
      data: params,
    );
    // 转换模型
    return CommonEntity.fromJson(response);
  }
}
