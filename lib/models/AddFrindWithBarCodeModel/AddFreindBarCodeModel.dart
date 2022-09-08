//{
//     "msg": "success",
//     "statuscode": 200
// }

library AddFreindBarCodeModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'AddFreindBarCodeModel.g.dart';

abstract class AddFreindBarCodeModel
    implements Built<AddFreindBarCodeModel,AddFreindBarCodeModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;

  AddFreindBarCodeModel._();
  factory AddFreindBarCodeModel([void Function(AddFreindBarCodeModelBuilder b)? updates]) =  _$AddFreindBarCodeModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AddFreindBarCodeModel.serializer, this));
  }
  static AddFreindBarCodeModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AddFreindBarCodeModel.serializer, json.decode(jsonString));
  }

 static Serializer<AddFreindBarCodeModel> get serializer => _$addFreindBarCodeModelSerializer;
}
