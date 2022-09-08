//ClearBadgeModel

library ClearBadgeModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ClearBadgeModel.g.dart';

abstract class ClearBadgeModel
    implements Built<ClearBadgeModel,ClearBadgeModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  ClearBadgeModel._();
  factory ClearBadgeModel([void Function(ClearBadgeModelBuilder b)? updates]) =  _$ClearBadgeModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ClearBadgeModel.serializer, this));
  }
  static ClearBadgeModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ClearBadgeModel.serializer, json.decode(jsonString));
  }

  static Serializer<ClearBadgeModel> get serializer => _$clearBadgeModelSerializer;
}
