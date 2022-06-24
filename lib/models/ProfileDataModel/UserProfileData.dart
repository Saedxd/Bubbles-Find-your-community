library UserProfileData;

import 'dart:convert';


import 'package:bubbles/models/ProfileDataModel/InterestsProfileModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserProfileData.g.dart';

abstract class UserProfileData
    implements Built<UserProfileData,UserProfileDataBuilder> {

  String? get first_name;
  String? get last_name;
  String? get serial;
  String? get alias;
  String? get avatar;
  String? get email;
  String? get background_color;
  String? get birth_date;
  String? get bio;
  String? get fcm_token;
  String? get avatar_social;
  String? get gender;
  String? get serialnumber;


  int? get id;
  int? get is_verify;
  int? get is_notify;
  int? get is_creator;
  String? get lattitude;
  String? get langtitude;
  BuiltList<InterestsProfileModel>? get interests;


  int? get is_register;
  int? get daily_login;
  int? get added_user;
  int? get invitation;
  int? get visit_bubble;
  int? get points;





  UserProfileData._();
  factory UserProfileData([void Function(UserProfileDataBuilder b)? updates]) =  _$UserProfileData;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UserProfileData.serializer, this));
  }
  static UserProfileData? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserProfileData.serializer, json.decode(jsonString));
  }

  static Serializer<UserProfileData> get serializer => _$userProfileDataSerializer;
}
