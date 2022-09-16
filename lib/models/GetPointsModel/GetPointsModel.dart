//{
//     "msg": "success",
//     "statuscode": 200
// }
//{
//     "msg": "success",
//     "statuscode": 200
// }

library GetPointsModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetPointsModel.g.dart';

abstract class GetPointsModel
    implements Built<GetPointsModel,GetPointsModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  GetPointsModel._();
  factory GetPointsModel([void Function(GetPointsModelBuilder b)? updates]) =  _$GetPointsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetPointsModel.serializer, this));
  }
  static GetPointsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetPointsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetPointsModel> get serializer => _$getPointsModelSerializer;
}
