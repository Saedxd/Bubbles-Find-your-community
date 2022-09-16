//PermissionsModel

library PermissionsModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'PermissionsModel.g.dart';

abstract class PermissionsModel
    implements Built<PermissionsModel,PermissionsModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  PermissionsModel._();
  factory PermissionsModel([void Function(PermissionsModelBuilder b)? updates]) =  _$PermissionsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(PermissionsModel.serializer, this));
  }
  static PermissionsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PermissionsModel.serializer, json.decode(jsonString));
  }

  static Serializer<PermissionsModel> get serializer => _$permissionsModelSerializer;
}
