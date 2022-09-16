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
  String? get error;
  String? get msg;
  int? get statuscode;
  BuiltList<FlowMessagesModel>? get messages;



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
