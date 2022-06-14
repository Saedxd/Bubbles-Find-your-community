
library AceeptRequestModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'AceeptRequestModel.g.dart';

abstract class AceeptRequestModel
    implements Built<AceeptRequestModel,AceeptRequestModelBuilder> {

  String? get msg;
  int? get statuscode;



  AceeptRequestModel._();
  factory AceeptRequestModel([void Function(AceeptRequestModelBuilder b)? updates]) =  _$AceeptRequestModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AceeptRequestModel.serializer, this));
  }
  static AceeptRequestModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AceeptRequestModel.serializer, json.decode(jsonString));
  }

  static Serializer<AceeptRequestModel> get serializer => _$aceeptRequestModelSerializer;
}
