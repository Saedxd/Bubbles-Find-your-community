//
library MessagesListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'MessagesListModel.g.dart';

abstract class MessagesListModel
    implements Built<MessagesListModel,MessagesListModelBuilder> {

  String? get message;
  int? get id;
  String? get receiver_image;
  String? get receiver_name;
  String? get sender_image;
  String? get sender_name;
  String? get type;
  String? get CreatAt;
  String? get receiver_background_color;
  String? get sender_background_color;
  int? get receiver_id;





  MessagesListModel._();
  factory MessagesListModel([void Function(MessagesListModelBuilder b)? updates]) =  _$MessagesListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(MessagesListModel.serializer, this));
  }
  static MessagesListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        MessagesListModel.serializer, json.decode(jsonString));
  }

  static Serializer<MessagesListModel> get serializer => _$messagesListModelSerializer;
}
