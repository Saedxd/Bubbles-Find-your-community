
library CreateBubbleModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'CreateBubbleModel.g.dart';

abstract class CreateBubbleModel
    implements Built<CreateBubbleModel,CreateBubbleModelBuilder> {

  String? get message;
  int? get status;



  CreateBubbleModel._();
  factory CreateBubbleModel([void Function(CreateBubbleModelBuilder b)? updates]) =  _$CreateBubbleModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(CreateBubbleModel.serializer, this));
  }
  static CreateBubbleModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CreateBubbleModel.serializer, json.decode(jsonString));
  }

  static Serializer<CreateBubbleModel> get serializer => _$createBubbleModelSerializer;
}
