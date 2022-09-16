//

library SendBubbleMessageModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SendBubbleMessageModel.g.dart';

abstract class SendBubbleMessageModel
    implements Built<SendBubbleMessageModel,SendBubbleMessageModelBuilder> {

  String? get msg;
  int? get statuscode;
  int? get message_id;
  int? get sub_message_id;
  String? get error;

  SendBubbleMessageModel._();
  factory SendBubbleMessageModel([void Function(SendBubbleMessageModelBuilder b)? updates]) =  _$SendBubbleMessageModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SendBubbleMessageModel.serializer, this));
  }
  static SendBubbleMessageModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SendBubbleMessageModel.serializer, json.decode(jsonString));
  }

  static Serializer<SendBubbleMessageModel> get serializer => _$sendBubbleMessageModelSerializer;
}
