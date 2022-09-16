//

library SaveBubbleModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SaveBubbleModel.g.dart';

abstract class SaveBubbleModel
    implements Built<SaveBubbleModel,SaveBubbleModelBuilder> {

  String? get message;
  int? get status;
  String? get error;


  SaveBubbleModel._();
  factory SaveBubbleModel([void Function(SaveBubbleModelBuilder b)? updates]) =  _$SaveBubbleModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SaveBubbleModel.serializer, this));
  }
  static SaveBubbleModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SaveBubbleModel.serializer, json.decode(jsonString));
  }

  static Serializer<SaveBubbleModel> get serializer => _$saveBubbleModelSerializer;
}
