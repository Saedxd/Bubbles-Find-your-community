//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library GetGender;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'GendersListModel.dart';


part 'GetGender.g.dart';

abstract class GetGenderModel
    implements Built<GetGenderModel,GetGenderModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<GendersListModel>? get genders;



  GetGenderModel._();
  factory GetGenderModel([void Function(GetGenderModelBuilder b)? updates]) =  _$GetGenderModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetGenderModel.serializer, this));
  }
  static GetGenderModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetGenderModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetGenderModel> get serializer => _$getGenderModelSerializer;
}
