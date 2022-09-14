library EventMessagesListModel;

import 'dart:convert';


import 'package:bubbles/models/EventOldMessagesModel/EventdetialMessageModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/FriendDataModel.dart';
import 'package:bubbles/models/OldMessagesModel/ReplieslISTModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'EventMessagesListModel.g.dart';

abstract class EventMessagesListModel
    implements Built<EventMessagesListModel,EventMessagesListModelBuilder> {

  int? get type;
  int? get id;
//audio image text
  EventdetialMessageModel? get message;
  BuiltList<ReplieslISTModel>? get replies;
  BuiltList<FriendData>? get flow_users;



  EventMessagesListModel._();
  factory EventMessagesListModel([void Function(EventMessagesListModelBuilder b)? updates]) =  _$EventMessagesListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(EventMessagesListModel.serializer, this));
  }
  static EventMessagesListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventMessagesListModel.serializer, json.decode(jsonString));
  }

  static Serializer<EventMessagesListModel> get serializer => _$eventMessagesListModelSerializer;
}
