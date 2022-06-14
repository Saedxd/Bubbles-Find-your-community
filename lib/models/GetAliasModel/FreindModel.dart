
library FreindModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FreindModel.g.dart';

abstract class FreindModel
    implements Built<FreindModel,FreindModelBuilder> {

  String? get alias;
  String? get background_color;
  String? get avatar;
  int? get id;


  FreindModel._();
  factory FreindModel([void Function(FreindModelBuilder b)? updates]) =  _$FreindModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FreindModel.serializer, this));
  }
  static FreindModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FreindModel.serializer, json.decode(jsonString));
  }

  static Serializer<FreindModel> get serializer => _$freindModelSerializer;
}
