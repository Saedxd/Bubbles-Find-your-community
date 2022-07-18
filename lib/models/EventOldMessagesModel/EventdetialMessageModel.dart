library EventdetialMessageModel;

import 'dart:convert';


import 'package:bubbles/models/EventOldMessagesModel/NewPollAnswersModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'EventdetialMessageModel.g.dart';

abstract class EventdetialMessageModel
    implements Built<EventdetialMessageModel,EventdetialMessageModelBuilder> {

  bool? get is_sender;
  int? get id;
  String? get message;
  String? get type;
  String? get sender_name;
  String? get CreatAt;
  String? get sender_background_color;
  String? get sender_image;
  String? get title;
  String? get content;
  String? get image;
  BuiltList<NewPollAnswersModel>? get answers;
//  "answers": [
//                     {
//                         "id": 1,
//                         "answer": 1,
//                         "rate": 0
//                     },
//                     {
//                         "id": 2,
//                         "answer": 2,
//                         "rate": 0
//                     },
//                     {
//                         "id": 3,
//                         "answer": 3,
//                         "rate": 0
//                     }
//                 ],



  EventdetialMessageModel._();
  factory EventdetialMessageModel([void Function(EventdetialMessageModelBuilder b)? updates]) =  _$EventdetialMessageModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(EventdetialMessageModel.serializer, this));
  }
  static EventdetialMessageModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventdetialMessageModel.serializer, json.decode(jsonString));
  }

  static Serializer<EventdetialMessageModel> get serializer => _$eventdetialMessageModelSerializer;
}

