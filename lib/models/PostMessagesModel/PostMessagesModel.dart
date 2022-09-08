library PostMessagesModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'PostMessagesModel.g.dart';

abstract class PostMessagesModel
    implements Built<PostMessagesModel,PostMessagesModelBuilder> {

  String? get msg;
  int? get message_id;
  int? get statuscode;
  String? get error;


  PostMessagesModel._();
  factory PostMessagesModel([void Function(PostMessagesModelBuilder b)? updates]) =  _$PostMessagesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(PostMessagesModel.serializer, this));
  }
  static PostMessagesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostMessagesModel.serializer, json.decode(jsonString));
  }

  static Serializer<PostMessagesModel> get serializer => _$postMessagesModelSerializer;
}
