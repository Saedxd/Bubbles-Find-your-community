library OldMessagesModel;

import 'dart:convert';


import 'package:bubbles/models/OldMessagesModel/MessagesListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'OldMessagesModel.g.dart';

abstract class OldMessagesModel
    implements Built<OldMessagesModel,OldMessagesModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<MessagesListModel>? get messages;

  OldMessagesModel._();
  factory OldMessagesModel([void Function(OldMessagesModelBuilder b)? updates]) =  _$OldMessagesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(OldMessagesModel.serializer, this));
  }
  static OldMessagesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        OldMessagesModel.serializer, json.decode(jsonString));
  }

  static Serializer<OldMessagesModel> get serializer => _$oldMessagesModelSerializer;
}
