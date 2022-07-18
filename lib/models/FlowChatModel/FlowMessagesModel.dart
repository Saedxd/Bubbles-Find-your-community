//
//

library FlowMessagesModel;

import 'dart:convert';


import 'package:bubbles/models/OldMessagesModel/ReplieslISTModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FlowMessagesModel.g.dart';

abstract class FlowMessagesModel
    implements Built<FlowMessagesModel,FlowMessagesModelBuilder> {

  String? get type;
  String? get message;
  String? get sender_name;
  String? get CreatAt;
  String? get sender_background_color;
  String? get sender_image;
  int? get id;
  bool? get is_sender;
  BuiltList<ReplieslISTModel>? get replies;

  FlowMessagesModel._();
  factory FlowMessagesModel([void Function(FlowMessagesModelBuilder b)? updates]) =  _$FlowMessagesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FlowMessagesModel.serializer, this));
  }
  static FlowMessagesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FlowMessagesModel.serializer, json.decode(jsonString));
  }

  static Serializer<FlowMessagesModel> get serializer => _$flowMessagesModelSerializer;
}
