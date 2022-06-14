//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library VerifyProfileModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'VerifyProfileModel.g.dart';

abstract class VerifyProfileModel
    implements Built<VerifyProfileModel,VerifyProfileModelBuilder> {

  String? get msg;
  int? get statuscode;



  VerifyProfileModel._();
  factory VerifyProfileModel([void Function(VerifyProfileModelBuilder b)? updates]) =  _$VerifyProfileModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(VerifyProfileModel.serializer, this));
  }
  static VerifyProfileModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        VerifyProfileModel.serializer, json.decode(jsonString));
  }

  static Serializer<VerifyProfileModel> get serializer => _$verifyProfileModelSerializer;
}
