//

library CheckMailModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'CheckMailModel.g.dart';

abstract class CheckMailModel
    implements Built<CheckMailModel,CheckMailModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  CheckMailModel._();
  factory CheckMailModel([void Function(CheckMailModelBuilder b)? updates]) =  _$CheckMailModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(CheckMailModel.serializer, this));
  }
  static CheckMailModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CheckMailModel.serializer, json.decode(jsonString));
  }

  static Serializer<CheckMailModel> get serializer => _$checkMailModelSerializer;
}
