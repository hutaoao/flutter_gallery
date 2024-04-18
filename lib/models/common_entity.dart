import 'package:flutter_gallery/generated/json/base/json_field.dart';
import 'package:flutter_gallery/generated/json/common_entity.g.dart';
import 'dart:convert';
export 'package:flutter_gallery/generated/json/common_entity.g.dart';

@JsonSerializable()
class CommonEntity {
	late String msg;
	late int code;
	late bool success;

	CommonEntity();

	factory CommonEntity.fromJson(Map<String, dynamic> json) => $CommonEntityFromJson(json);

	Map<String, dynamic> toJson() => $CommonEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}