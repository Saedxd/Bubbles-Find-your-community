
library EventCateogoryModel;

import 'dart:convert';


import 'package:bubbles/models/Event_CateogoryModel/CateogoryList.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'EventCateogoryModel.g.dart';

abstract class EventCateogoryModel
    implements Built<EventCateogoryModel,EventCateogoryModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<CateogoryList>? get event_category;
  String? get error;

  EventCateogoryModel._();
  factory EventCateogoryModel([void Function(EventCateogoryModelBuilder b)? updates]) =  _$EventCateogoryModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(EventCateogoryModel.serializer, this));
  }
  static EventCateogoryModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventCateogoryModel.serializer, json.decode(jsonString));
  }

  static Serializer<EventCateogoryModel> get serializer => _$eventCateogoryModelSerializer;
}
