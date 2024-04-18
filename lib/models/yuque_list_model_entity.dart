import 'package:flutter_gallery/generated/json/base/json_field.dart';
import 'package:flutter_gallery/generated/json/yuque_list_model_entity.g.dart';
import 'dart:convert';
export 'package:flutter_gallery/generated/json/yuque_list_model_entity.g.dart';

@JsonSerializable()
class YuqueListModelEntity {
	late String msg;
	late YuqueListModelData data;
	late int code;
	late bool success;

	YuqueListModelEntity();

	factory YuqueListModelEntity.fromJson(Map<String, dynamic> json) => $YuqueListModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $YuqueListModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class YuqueListModelData {
	late List<YuqueListModelDataList> list;
	late int total;

	YuqueListModelData();

	factory YuqueListModelData.fromJson(Map<String, dynamic> json) => $YuqueListModelDataFromJson(json);

	Map<String, dynamic> toJson() => $YuqueListModelDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class YuqueListModelDataList {
	late int id;
	late String type;
	late String slug;
	late String title;
	late String description;
	late String cover;
	@JSONField(name: "user_id")
	late int userId;
	@JSONField(name: "book_id")
	late int bookId;
	@JSONField(name: "last_editor_id")
	late int lastEditorId;
	late int public;
	late int status;
	@JSONField(name: "likes_count")
	late int likesCount;
	@JSONField(name: "read_count")
	late int readCount;
	late int hits;
	@JSONField(name: "comments_count")
	late int commentsCount;
	@JSONField(name: "word_count")
	late int wordCount;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
	@JSONField(name: "content_updated_at")
	late String contentUpdatedAt;
	@JSONField(name: "published_at")
	late String publishedAt;
	@JSONField(name: "first_published_at")
	late String firstPublishedAt;
	late YuqueListModelDataListUser user;
	@JSONField(name: "last_editor")
	late YuqueListModelDataListLastEditor lastEditor;
	@JSONField(name: "_serializer")
	late String serializer;

	YuqueListModelDataList();

	factory YuqueListModelDataList.fromJson(Map<String, dynamic> json) => $YuqueListModelDataListFromJson(json);

	Map<String, dynamic> toJson() => $YuqueListModelDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class YuqueListModelDataListUser {
	late int id;
	late String type;
	late String login;
	late String name;
	@JSONField(name: "avatar_url")
	late String avatarUrl;
	@JSONField(name: "followers_count")
	late int followersCount;
	@JSONField(name: "following_count")
	late int followingCount;
	late int public;
	late String description;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
	@JSONField(name: "work_id")
	late String workId;
	@JSONField(name: "_serializer")
	late String serializer;

	YuqueListModelDataListUser();

	factory YuqueListModelDataListUser.fromJson(Map<String, dynamic> json) => $YuqueListModelDataListUserFromJson(json);

	Map<String, dynamic> toJson() => $YuqueListModelDataListUserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class YuqueListModelDataListLastEditor {
	late int id;
	late String type;
	late String login;
	late String name;
	@JSONField(name: "avatar_url")
	late String avatarUrl;
	@JSONField(name: "followers_count")
	late int followersCount;
	@JSONField(name: "following_count")
	late int followingCount;
	late int public;
	late String description;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
	@JSONField(name: "work_id")
	late String workId;
	@JSONField(name: "_serializer")
	late String serializer;

	YuqueListModelDataListLastEditor();

	factory YuqueListModelDataListLastEditor.fromJson(Map<String, dynamic> json) => $YuqueListModelDataListLastEditorFromJson(json);

	Map<String, dynamic> toJson() => $YuqueListModelDataListLastEditorToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}