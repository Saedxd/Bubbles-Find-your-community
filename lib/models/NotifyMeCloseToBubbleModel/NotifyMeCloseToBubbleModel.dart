//

library NotifyMeCloseToBubbleModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'NotifyMeCloseToBubbleModel.g.dart';

abstract class NotifyMeCloseToBubbleModel
    implements Built<NotifyMeCloseToBubbleModel,NotifyMeCloseToBubbleModelBuilder> {

  String? get msg;
  int? get statuscode;



  NotifyMeCloseToBubbleModel._();
  factory NotifyMeCloseToBubbleModel([void Function(NotifyMeCloseToBubbleModelBuilder b)? updates]) =  _$NotifyMeCloseToBubbleModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(NotifyMeCloseToBubbleModel.serializer, this));
  }
  static NotifyMeCloseToBubbleModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        NotifyMeCloseToBubbleModel.serializer, json.decode(jsonString));
  }

  static Serializer<NotifyMeCloseToBubbleModel> get serializer => _$notifyMeCloseToBubbleModelSerializer;
}
