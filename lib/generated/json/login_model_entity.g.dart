import 'package:flutter_gallery/generated/json/base/json_convert_content.dart';
import 'package:flutter_gallery/models/login_model_entity.dart';

LoginModelEntity $LoginModelEntityFromJson(Map<String, dynamic> json) {
  final LoginModelEntity loginModelEntity = LoginModelEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    loginModelEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    loginModelEntity.msg = msg;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    loginModelEntity.success = success;
  }
  final LoginModelData? data = jsonConvert.convert<LoginModelData>(
      json['data']);
  if (data != null) {
    loginModelEntity.data = data;
  }
  return loginModelEntity;
}

Map<String, dynamic> $LoginModelEntityToJson(LoginModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['success'] = entity.success;
  data['data'] = entity.data.toJson();
  return data;
}

extension LoginModelEntityExtension on LoginModelEntity {
  LoginModelEntity copyWith({
    int? code,
    String? msg,
    bool? success,
    LoginModelData? data,
  }) {
    return LoginModelEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..success = success ?? this.success
      ..data = data ?? this.data;
  }
}

LoginModelData $LoginModelDataFromJson(Map<String, dynamic> json) {
  final LoginModelData loginModelData = LoginModelData();
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    loginModelData.username = username;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginModelData.token = token;
  }
  return loginModelData;
}

Map<String, dynamic> $LoginModelDataToJson(LoginModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['username'] = entity.username;
  data['token'] = entity.token;
  return data;
}

extension LoginModelDataExtension on LoginModelData {
  LoginModelData copyWith({
    String? username,
    String? token,
  }) {
    return LoginModelData()
      ..username = username ?? this.username
      ..token = token ?? this.token;
  }
}