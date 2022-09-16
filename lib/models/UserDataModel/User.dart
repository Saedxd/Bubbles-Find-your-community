//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library User;

import 'dart:convert';
import 'package:bubbles/models/UserDataModel/DataModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'User.g.dart';

abstract class UserModel
    implements Built<UserModel,UserModelBuilder> {

  String? get token;
  DateModel? get data;


  UserModel._();
  factory UserModel([void Function(UserModelBuilder b)? updates]) =  _$UserModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UserModel.serializer, this));
  }
  static UserModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModel.serializer, json.decode(jsonString));
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}

