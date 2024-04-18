import 'package:flutter_gallery/generated/json/base/json_convert_content.dart';
import 'package:flutter_gallery/models/common_entity.dart';

CommonEntity $CommonEntityFromJson(Map<String, dynamic> json) {
  final CommonEntity commonEntity = CommonEntity();
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    commonEntity.msg = msg;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    commonEntity.code = code;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    commonEntity.success = success;
  }
  return commonEntity;
}

Map<String, dynamic> $CommonEntityToJson(CommonEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['msg'] = entity.msg;
  data['code'] = entity.code;
  data['success'] = entity.success;
  return data;
}

extension CommonEntityExtension on CommonEntity {
  CommonEntity copyWith({
    String? msg,
    int? code,
    bool? success,
  }) {
    return CommonEntity()
      ..msg = msg ?? this.msg
      ..code = code ?? this.code
      ..success = success ?? this.success;
  }
}