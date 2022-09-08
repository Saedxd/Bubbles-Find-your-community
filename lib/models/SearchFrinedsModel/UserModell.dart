
library UserModell;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserModell.g.dart';

abstract class UserModell
    implements Built<UserModell,UserModellBuilder> {

  String? get email;//
  int? get id;//
  int? get is_creator;//
  int? get email_verified_at;
  String? get created_at;
  String? get updated_at;
  String? get first_name;
  String? get last_name;
  String? get background_color;
  String? get bio;
  String? get birth_date;
  String? get alias;
  String? get fcm_token;
  String? get lattitude;
  String? get langtitude;
  String? get avatar;
  String? get avatar_social;
  String? get serial;
  String? get image1;
  String? get image2;
  String? get login_at;
  int? get is_notify;
  int? get social_id;
  int? get daily_login;
  int? get is_register;
  int? get added_user;
  int? get invitation;
  int? get visit_bubble;
  int? get num_friend;
  int? get points;
  int? get num_bubble;
  int? get invitation_num;
  int? get added_user_status;
  int? get invitation_status;
  int? get visit_bubble_status;
  int? get gender;
  BuiltList<UserModell>? get user;


  UserModell._();
  factory UserModell([void Function(UserModellBuilder b)? updates]) =  _$UserModell;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UserModell.serializer, this));
  }
  static UserModell? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModell.serializer, json.decode(jsonString));
  }

  static Serializer<UserModell> get serializer => _$userModellSerializer;
}
