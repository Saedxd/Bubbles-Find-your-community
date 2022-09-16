//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library DataModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'DataModel.g.dart';

abstract class DateModel
    implements Built<DateModel,DateModelBuilder> {
  int? get id;//.
  int? get is_verify;
  int? get is_creator;//.
  String? get gender;
  String? get serialnumber;
  String? get email;//.
  String? get last_name;/////.
  String? get first_name;/////.
  String? get updated_at;/////.
  String? get created_at;/////.
  String? get background_color;/////
  String? get birth_date;//
  String? get bio;//
  String? get alias;//
  String? get serial;//
  String? get image1;//
  String? get image2;//
  String? get fcm_token;
  String? get avatar;/////
  int? get is_notify;
  int? get points;



  DateModel._();
  factory DateModel([void Function(DateModelBuilder b)? updates]) =  _$DateModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DateModel.serializer, this));
  }
  static DateModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DateModel.serializer, json.decode(jsonString));
  }

  static Serializer<DateModel> get serializer => _$dateModelSerializer;
}
