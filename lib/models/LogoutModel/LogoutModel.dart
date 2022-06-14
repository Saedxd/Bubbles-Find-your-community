library LogoutModel;

import 'dart:convert';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'LogoutModel.g.dart';

abstract class LogoutModel
    implements Built<LogoutModel,LogoutModelBuilder> {

  String? get msg;
  int? get statuscode;

  LogoutModel._();

  factory LogoutModel([void Function(LogoutModelBuilder b)? updates]) =  _$LogoutModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(LogoutModel.serializer, this));
  }
  static LogoutModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        LogoutModel.serializer, json.decode(jsonString));
  }

  static Serializer<LogoutModel> get serializer => _$logoutModelSerializer;
}
