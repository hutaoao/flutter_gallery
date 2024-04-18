import 'package:flutter_gallery/generated/json/base/json_field.dart';
import 'package:flutter_gallery/generated/json/login_model_entity.g.dart';
import 'dart:convert';
export 'package:flutter_gallery/generated/json/login_model_entity.g.dart';

@JsonSerializable()
class LoginModelEntity {
	late int code;
	late String msg;
	late bool success;
	late LoginModelData data;

	LoginModelEntity();

	factory LoginModelEntity.fromJson(Map<String, dynamic> json) => $LoginModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LoginModelData {
	late String username;
	late String token;

	LoginModelData();

	factory LoginModelData.fromJson(Map<String, dynamic> json) => $LoginModelDataFromJson(json);

	Map<String, dynamic> toJson() => $LoginModelDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}