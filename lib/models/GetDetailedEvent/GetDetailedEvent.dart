library GetDetailedEvent;

import 'dart:convert';


import 'package:bubbles/models/GetDetailedEvent/DataEventDetailModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetDetailedEvent.g.dart';

abstract class GetDetailedEvent
    implements Built<GetDetailedEvent,GetDetailedEventBuilder> {
  int? get status;
DataEventDetailModel? get data;


  GetDetailedEvent._();
  factory GetDetailedEvent([void Function(GetDetailedEventBuilder b)? updates]) =  _$GetDetailedEvent;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetDetailedEvent.serializer, this));
  }
  static GetDetailedEvent? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetDetailedEvent.serializer, json.decode(jsonString));
  }

  static Serializer<GetDetailedEvent> get serializer => _$getDetailedEventSerializer;
}
