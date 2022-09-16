//

library EventOldMessagesModel;

import 'dart:convert';


import 'package:bubbles/models/EventOldMessagesModel/EventMessagesListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'EventOldMessagesModel.g.dart';

abstract class EventOldMessagesModel
    implements Built<EventOldMessagesModel,EventOldMessagesModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<EventMessagesListModel>? get messages;
  String? get error;

  EventOldMessagesModel._();
  factory EventOldMessagesModel([void Function(EventOldMessagesModelBuilder b)? updates]) =  _$EventOldMessagesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(EventOldMessagesModel.serializer, this));
  }
  static EventOldMessagesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventOldMessagesModel.serializer, json.decode(jsonString));
  }

  static Serializer<EventOldMessagesModel> get serializer => _$eventOldMessagesModelSerializer;
}
