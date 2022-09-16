//
library EventCategoryModel;

import 'dart:convert';



import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserMadeBubbleModel.dart';


part 'EventCategoryModel.g.dart';

abstract class EventCategoryModel
    implements Built<EventCategoryModel,EventCategoryModelBuilder> {
  int? get id;
  String? get name;
  String? get type;
  String? get image;



  EventCategoryModel._();
  factory EventCategoryModel([void Function(EventCategoryModelBuilder b)? updates]) =  _$EventCategoryModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(EventCategoryModel.serializer, this));
  }
  static EventCategoryModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventCategoryModel.serializer, json.decode(jsonString));
  }

  static Serializer<EventCategoryModel> get serializer => _$eventCategoryModelSerializer;
}

