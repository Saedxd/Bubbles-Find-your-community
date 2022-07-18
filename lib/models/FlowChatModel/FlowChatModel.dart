//

library FlowChatModel;

import 'dart:convert';


import 'package:bubbles/models/FlowChatModel/FlowMessagesModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FlowChatModel.g.dart';

abstract class FlowChatModel
    implements Built<FlowChatModel,FlowChatModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<FlowMessagesModel>? get messages;
//{
//     "statuscode": 200,
//     "msg": "success",
//     "messages": [
//         {
//             "id": 8,
//             "type": "text",
//             "is_sender": false,
//             "message": "good morning",
//             "sender_name": "Saed",
//             "CreatAt": "2022-07-14T17:44:07.000000Z",
//             "sender_background_color": "0xffff9800",
//             "sender_image": "https://admin.bubbles.app/public/storage/avatar/5L0NBaw6dcN51MI2hCmtzNnEoH0LAdTyqB5Wa0va.png",
//             "replies": []
//         },


  FlowChatModel._();
  factory FlowChatModel([void Function(FlowChatModelBuilder b)? updates]) =  _$FlowChatModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FlowChatModel.serializer, this));
  }
  static FlowChatModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FlowChatModel.serializer, json.decode(jsonString));
  }

  static Serializer<FlowChatModel> get serializer => _$flowChatModelSerializer;
}
