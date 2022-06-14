library UpdateBoiModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UpdateBoiModel.g.dart';

abstract class UpdateBoiModel
    implements Built<UpdateBoiModel,UpdateBoiModelBuilder> {

  String? get msg;
  int? get statuscode;



  UpdateBoiModel._();
  factory UpdateBoiModel([void Function(UpdateBoiModelBuilder b)? updates]) =  _$UpdateBoiModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UpdateBoiModel.serializer, this));
  }
  static UpdateBoiModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UpdateBoiModel.serializer, json.decode(jsonString));
  }

  static Serializer<UpdateBoiModel> get serializer => _$updateBoiModelSerializer;
}
