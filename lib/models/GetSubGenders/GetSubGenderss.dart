//{
//     "genders": [
//
//     ],
//     "msg": "success",
//     "statuscode": 200
// }

//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library GetSubGenderss;

import 'dart:convert';

import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/GetSubGenders/SubgendersListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetSubGenderss.g.dart';

abstract class GetSubGender
    implements Built<GetSubGender,GetSubGenderBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<SubgendersListModel>? get genders;


  GetSubGender._();
  factory GetSubGender([void Function(GetSubGenderBuilder b)? updates]) =  _$GetSubGender;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetSubGender.serializer, this));
  }
  static GetSubGender? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetSubGender.serializer, json.decode(jsonString));
  }

  static Serializer<GetSubGender> get serializer => _$getSubGenderSerializer;
}
