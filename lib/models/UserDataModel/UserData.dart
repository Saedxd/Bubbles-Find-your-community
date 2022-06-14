
// ignore_for_file: file_names

library UserData;

import 'dart:convert';
import 'package:bubbles/models/UserDataModel/User.dart';
import 'package:bubbles/models/UserDataModel/DataModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UserData.g.dart';

abstract class UserData
    implements Built<UserData,UserDataBuilder> {

  String? get msg;
  int? get statuscode;
  UserModel? get user;


  UserData._();
  factory UserData([void Function(UserDataBuilder b)? updates]) =  _$UserData;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UserData.serializer, this));
  }
  static UserData? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserData.serializer, json.decode(jsonString));
  }

  static Serializer<UserData> get serializer => _$userDataSerializer;
}
