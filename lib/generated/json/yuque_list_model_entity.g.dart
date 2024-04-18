import 'package:flutter_gallery/generated/json/base/json_convert_content.dart';
import 'package:flutter_gallery/models/yuque_list_model_entity.dart';

YuqueListModelEntity $YuqueListModelEntityFromJson(Map<String, dynamic> json) {
  final YuqueListModelEntity yuqueListModelEntity = YuqueListModelEntity();
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    yuqueListModelEntity.msg = msg;
  }
  final YuqueListModelData? data = jsonConvert.convert<YuqueListModelData>(
      json['data']);
  if (data != null) {
    yuqueListModelEntity.data = data;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    yuqueListModelEntity.code = code;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    yuqueListModelEntity.success = success;
  }
  return yuqueListModelEntity;
}

Map<String, dynamic> $YuqueListModelEntityToJson(YuqueListModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['msg'] = entity.msg;
  data['data'] = entity.data.toJson();
  data['code'] = entity.code;
  data['success'] = entity.success;
  return data;
}

extension YuqueListModelEntityExtension on YuqueListModelEntity {
  YuqueListModelEntity copyWith({
    String? msg,
    YuqueListModelData? data,
    int? code,
    bool? success,
  }) {
    return YuqueListModelEntity()
      ..msg = msg ?? this.msg
      ..data = data ?? this.data
      ..code = code ?? this.code
      ..success = success ?? this.success;
  }
}

YuqueListModelData $YuqueListModelDataFromJson(Map<String, dynamic> json) {
  final YuqueListModelData yuqueListModelData = YuqueListModelData();
  final List<YuqueListModelDataList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<YuqueListModelDataList>(e) as YuqueListModelDataList)
      .toList();
  if (list != null) {
    yuqueListModelData.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    yuqueListModelData.total = total;
  }
  return yuqueListModelData;
}

Map<String, dynamic> $YuqueListModelDataToJson(YuqueListModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  return data;
}

extension YuqueListModelDataExtension on YuqueListModelData {
  YuqueListModelData copyWith({
    List<YuqueListModelDataList>? list,
    int? total,
  }) {
    return YuqueListModelData()
      ..list = list ?? this.list
      ..total = total ?? this.total;
  }
}

YuqueListModelDataList $YuqueListModelDataListFromJson(
    Map<String, dynamic> json) {
  final YuqueListModelDataList yuqueListModelDataList = YuqueListModelDataList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    yuqueListModelDataList.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    yuqueListModelDataList.type = type;
  }
  final String? slug = jsonConvert.convert<String>(json['slug']);
  if (slug != null) {
    yuqueListModelDataList.slug = slug;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    yuqueListModelDataList.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    yuqueListModelDataList.description = description;
  }
  final String? cover = jsonConvert.convert<String>(json['cover']);
  if (cover != null) {
    yuqueListModelDataList.cover = cover;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    yuqueListModelDataList.userId = userId;
  }
  final int? bookId = jsonConvert.convert<int>(json['book_id']);
  if (bookId != null) {
    yuqueListModelDataList.bookId = bookId;
  }
  final int? lastEditorId = jsonConvert.convert<int>(json['last_editor_id']);
  if (lastEditorId != null) {
    yuqueListModelDataList.lastEditorId = lastEditorId;
  }
  final int? public = jsonConvert.convert<int>(json['public']);
  if (public != null) {
    yuqueListModelDataList.public = public;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    yuqueListModelDataList.status = status;
  }
  final int? likesCount = jsonConvert.convert<int>(json['likes_count']);
  if (likesCount != null) {
    yuqueListModelDataList.likesCount = likesCount;
  }
  final int? readCount = jsonConvert.convert<int>(json['read_count']);
  if (readCount != null) {
    yuqueListModelDataList.readCount = readCount;
  }
  final int? hits = jsonConvert.convert<int>(json['hits']);
  if (hits != null) {
    yuqueListModelDataList.hits = hits;
  }
  final int? commentsCount = jsonConvert.convert<int>(json['comments_count']);
  if (commentsCount != null) {
    yuqueListModelDataList.commentsCount = commentsCount;
  }
  final int? wordCount = jsonConvert.convert<int>(json['word_count']);
  if (wordCount != null) {
    yuqueListModelDataList.wordCount = wordCount;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    yuqueListModelDataList.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    yuqueListModelDataList.updatedAt = updatedAt;
  }
  final String? contentUpdatedAt = jsonConvert.convert<String>(
      json['content_updated_at']);
  if (contentUpdatedAt != null) {
    yuqueListModelDataList.contentUpdatedAt = contentUpdatedAt;
  }
  final String? publishedAt = jsonConvert.convert<String>(json['published_at']);
  if (publishedAt != null) {
    yuqueListModelDataList.publishedAt = publishedAt;
  }
  final String? firstPublishedAt = jsonConvert.convert<String>(
      json['first_published_at']);
  if (firstPublishedAt != null) {
    yuqueListModelDataList.firstPublishedAt = firstPublishedAt;
  }
  final YuqueListModelDataListUser? user = jsonConvert.convert<
      YuqueListModelDataListUser>(json['user']);
  if (user != null) {
    yuqueListModelDataList.user = user;
  }
  final YuqueListModelDataListLastEditor? lastEditor = jsonConvert.convert<
      YuqueListModelDataListLastEditor>(json['last_editor']);
  if (lastEditor != null) {
    yuqueListModelDataList.lastEditor = lastEditor;
  }
  final String? serializer = jsonConvert.convert<String>(json['_serializer']);
  if (serializer != null) {
    yuqueListModelDataList.serializer = serializer;
  }
  return yuqueListModelDataList;
}

Map<String, dynamic> $YuqueListModelDataListToJson(
    YuqueListModelDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['slug'] = entity.slug;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['cover'] = entity.cover;
  data['user_id'] = entity.userId;
  data['book_id'] = entity.bookId;
  data['last_editor_id'] = entity.lastEditorId;
  data['public'] = entity.public;
  data['status'] = entity.status;
  data['likes_count'] = entity.likesCount;
  data['read_count'] = entity.readCount;
  data['hits'] = entity.hits;
  data['comments_count'] = entity.commentsCount;
  data['word_count'] = entity.wordCount;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['content_updated_at'] = entity.contentUpdatedAt;
  data['published_at'] = entity.publishedAt;
  data['first_published_at'] = entity.firstPublishedAt;
  data['user'] = entity.user.toJson();
  data['last_editor'] = entity.lastEditor.toJson();
  data['_serializer'] = entity.serializer;
  return data;
}

extension YuqueListModelDataListExtension on YuqueListModelDataList {
  YuqueListModelDataList copyWith({
    int? id,
    String? type,
    String? slug,
    String? title,
    String? description,
    String? cover,
    int? userId,
    int? bookId,
    int? lastEditorId,
    int? public,
    int? status,
    int? likesCount,
    int? readCount,
    int? hits,
    int? commentsCount,
    int? wordCount,
    String? createdAt,
    String? updatedAt,
    String? contentUpdatedAt,
    String? publishedAt,
    String? firstPublishedAt,
    YuqueListModelDataListUser? user,
    YuqueListModelDataListLastEditor? lastEditor,
    String? serializer,
  }) {
    return YuqueListModelDataList()
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..slug = slug ?? this.slug
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..cover = cover ?? this.cover
      ..userId = userId ?? this.userId
      ..bookId = bookId ?? this.bookId
      ..lastEditorId = lastEditorId ?? this.lastEditorId
      ..public = public ?? this.public
      ..status = status ?? this.status
      ..likesCount = likesCount ?? this.likesCount
      ..readCount = readCount ?? this.readCount
      ..hits = hits ?? this.hits
      ..commentsCount = commentsCount ?? this.commentsCount
      ..wordCount = wordCount ?? this.wordCount
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..contentUpdatedAt = contentUpdatedAt ?? this.contentUpdatedAt
      ..publishedAt = publishedAt ?? this.publishedAt
      ..firstPublishedAt = firstPublishedAt ?? this.firstPublishedAt
      ..user = user ?? this.user
      ..lastEditor = lastEditor ?? this.lastEditor
      ..serializer = serializer ?? this.serializer;
  }
}

YuqueListModelDataListUser $YuqueListModelDataListUserFromJson(
    Map<String, dynamic> json) {
  final YuqueListModelDataListUser yuqueListModelDataListUser = YuqueListModelDataListUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    yuqueListModelDataListUser.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    yuqueListModelDataListUser.type = type;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    yuqueListModelDataListUser.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    yuqueListModelDataListUser.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    yuqueListModelDataListUser.avatarUrl = avatarUrl;
  }
  final int? followersCount = jsonConvert.convert<int>(json['followers_count']);
  if (followersCount != null) {
    yuqueListModelDataListUser.followersCount = followersCount;
  }
  final int? followingCount = jsonConvert.convert<int>(json['following_count']);
  if (followingCount != null) {
    yuqueListModelDataListUser.followingCount = followingCount;
  }
  final int? public = jsonConvert.convert<int>(json['public']);
  if (public != null) {
    yuqueListModelDataListUser.public = public;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    yuqueListModelDataListUser.description = description;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    yuqueListModelDataListUser.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    yuqueListModelDataListUser.updatedAt = updatedAt;
  }
  final String? workId = jsonConvert.convert<String>(json['work_id']);
  if (workId != null) {
    yuqueListModelDataListUser.workId = workId;
  }
  final String? serializer = jsonConvert.convert<String>(json['_serializer']);
  if (serializer != null) {
    yuqueListModelDataListUser.serializer = serializer;
  }
  return yuqueListModelDataListUser;
}

Map<String, dynamic> $YuqueListModelDataListUserToJson(
    YuqueListModelDataListUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['followers_count'] = entity.followersCount;
  data['following_count'] = entity.followingCount;
  data['public'] = entity.public;
  data['description'] = entity.description;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['work_id'] = entity.workId;
  data['_serializer'] = entity.serializer;
  return data;
}

extension YuqueListModelDataListUserExtension on YuqueListModelDataListUser {
  YuqueListModelDataListUser copyWith({
    int? id,
    String? type,
    String? login,
    String? name,
    String? avatarUrl,
    int? followersCount,
    int? followingCount,
    int? public,
    String? description,
    String? createdAt,
    String? updatedAt,
    String? workId,
    String? serializer,
  }) {
    return YuqueListModelDataListUser()
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..login = login ?? this.login
      ..name = name ?? this.name
      ..avatarUrl = avatarUrl ?? this.avatarUrl
      ..followersCount = followersCount ?? this.followersCount
      ..followingCount = followingCount ?? this.followingCount
      ..public = public ?? this.public
      ..description = description ?? this.description
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..workId = workId ?? this.workId
      ..serializer = serializer ?? this.serializer;
  }
}

YuqueListModelDataListLastEditor $YuqueListModelDataListLastEditorFromJson(
    Map<String, dynamic> json) {
  final YuqueListModelDataListLastEditor yuqueListModelDataListLastEditor = YuqueListModelDataListLastEditor();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    yuqueListModelDataListLastEditor.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    yuqueListModelDataListLastEditor.type = type;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    yuqueListModelDataListLastEditor.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    yuqueListModelDataListLastEditor.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    yuqueListModelDataListLastEditor.avatarUrl = avatarUrl;
  }
  final int? followersCount = jsonConvert.convert<int>(json['followers_count']);
  if (followersCount != null) {
    yuqueListModelDataListLastEditor.followersCount = followersCount;
  }
  final int? followingCount = jsonConvert.convert<int>(json['following_count']);
  if (followingCount != null) {
    yuqueListModelDataListLastEditor.followingCount = followingCount;
  }
  final int? public = jsonConvert.convert<int>(json['public']);
  if (public != null) {
    yuqueListModelDataListLastEditor.public = public;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    yuqueListModelDataListLastEditor.description = description;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    yuqueListModelDataListLastEditor.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    yuqueListModelDataListLastEditor.updatedAt = updatedAt;
  }
  final String? workId = jsonConvert.convert<String>(json['work_id']);
  if (workId != null) {
    yuqueListModelDataListLastEditor.workId = workId;
  }
  final String? serializer = jsonConvert.convert<String>(json['_serializer']);
  if (serializer != null) {
    yuqueListModelDataListLastEditor.serializer = serializer;
  }
  return yuqueListModelDataListLastEditor;
}

Map<String, dynamic> $YuqueListModelDataListLastEditorToJson(
    YuqueListModelDataListLastEditor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['followers_count'] = entity.followersCount;
  data['following_count'] = entity.followingCount;
  data['public'] = entity.public;
  data['description'] = entity.description;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['work_id'] = entity.workId;
  data['_serializer'] = entity.serializer;
  return data;
}

extension YuqueListModelDataListLastEditorExtension on YuqueListModelDataListLastEditor {
  YuqueListModelDataListLastEditor copyWith({
    int? id,
    String? type,
    String? login,
    String? name,
    String? avatarUrl,
    int? followersCount,
    int? followingCount,
    int? public,
    String? description,
    String? createdAt,
    String? updatedAt,
    String? workId,
    String? serializer,
  }) {
    return YuqueListModelDataListLastEditor()
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..login = login ?? this.login
      ..name = name ?? this.name
      ..avatarUrl = avatarUrl ?? this.avatarUrl
      ..followersCount = followersCount ?? this.followersCount
      ..followingCount = followingCount ?? this.followingCount
      ..public = public ?? this.public
      ..description = description ?? this.description
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..workId = workId ?? this.workId
      ..serializer = serializer ?? this.serializer;
  }
}