library EventdetialMessageModel;

import 'dart:convert';


import 'package:bubbles/models/EventOldMessagesModel/NewPollAnswersModel.dart';
import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'EventdetialMessageModel.g.dart';

abstract class EventdetialMessageModel
    implements Built<EventdetialMessageModel,EventdetialMessageModelBuilder> {

  bool? get is_sender;

  int? get id;
  int? get multi_choice;
  int? get show_participants;
  String? get message;
  String? get type;
  String? get sender_name;
  int? get sender_id;
  bool? get is_friend;
  String? get sender_bio;
  String? get CreatAt;
  String? get sender_background_color;
  String? get sender_image;
  String? get title;
  String? get content;
  String? get image;
  BuiltList<NewPollAnswersModel>? get answers;
  BuiltList<InterestsListModel>? get sender_interests;


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

