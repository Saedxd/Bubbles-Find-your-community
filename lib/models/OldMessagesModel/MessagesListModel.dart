//
library MessagesListModel;

import 'dart:convert';


import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/OldMessagesModel/ReplieslISTModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'MessagesListModel.g.dart';

abstract class MessagesListModel
    implements Built<MessagesListModel,MessagesListModelBuilder> {

  int? get me;
  String? get message;
  String? get sms_type;
  int? get id;
  String? get type;
  String? get send_by;
  String? get CreatAt;
  bool? get is_friend;


  bool? get receiver_is_friend;
  String? get receiver_image;
  int? get receiver_id;
  String? get receiver_name;
  String? get receiver_background_color;
  String? get receiver_bio;
  String? get receiver_serial;
  BuiltList<InterestsListModel>? get receiver_interests;


  String? get sender_image;
  String? get sender_name;
  String? get sender_serial;
  String? get sender_background_color;
  bool? get sender_is_friend;
  int? get sender_id;
  String? get sender_bio;
  BuiltList<InterestsListModel>? get sender_interests;





  BuiltList<ReplieslISTModel>? get replies;






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
