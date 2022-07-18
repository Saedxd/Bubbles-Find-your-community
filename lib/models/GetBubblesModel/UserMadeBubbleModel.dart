

////{
// //     "msg": "success",
// //     "statuscode": 200
// // }
//
// library AceeptRequestModel;
//
// import 'dart:convert';
//
//
// import 'package:bubbles/models/serializer/serializer.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
//
//
// part 'AceeptRequestModel.g.dart';
//
// abstract class AceeptRequestModel
//     implements Built<AceeptRequestModel,AceeptRequestModelBuilder> {
//
//   String? get msg;
//   int? get statuscode;
//
//
//
//   AceeptRequestModel._();
//   factory AceeptRequestModel([void Function(AceeptRequestModelBuilder b)? updates]) =  _$AceeptRequestModel;
//   String toJson() {
//     return json
//         .encode(serializers.serializeWith(AceeptRequestModel.serializer, this));
//   }
//   static AceeptRequestModel? fromJson(String jsonString) {
//     return serializers.deserializeWith(
//         AceeptRequestModel.serializer, json.decode(jsonString));
//   }
//
//   static Serializer<AceeptRequestModel> get serializer => _$aceeptRequestModelSerializer;
// }
//


library UserMadeBubbleModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UserMadeBubbleModel.g.dart';

abstract class UserMadeBubbleModel
    implements Built<UserMadeBubbleModel,UserMadeBubbleModelBuilder> {

  String? get email;
  // String? get created_at;
  // String? get updated_at;
  String? get first_name;
  String? get last_name;
  // String? get lattitude;
  // String? get langtitude;
  String? get background_color;
  // String? get birth_date;
  String? get bio;
  String? get alias;
  String? get avatar;
  String? get fcm_token;
  String? get avatar_social;
  String? get serial;
  String? get image1;
  String? get image2;
  // int? get social_id;
  // int? get id;
  // int? get is_notify;
  // int? get is_verify;
  // int? get gender;
  // int? get points;
  // int? get daily_login;
  // int? get is_register;
  // int? get invitation;
  // int? get added_user;
  // int? get visit_bubble;
  // int? get login_at;
  // int? get num_friend;
  // int? get num_bubble;
  // int? get invitation_num;
  // int? get added_user_status;
  // int? get invitation_status;
  // int? get visit_bubble_status;

  UserMadeBubbleModel._();
  factory UserMadeBubbleModel([void Function(UserMadeBubbleModelBuilder b)? updates]) =  _$UserMadeBubbleModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UserMadeBubbleModel.serializer, this));
  }
  static UserMadeBubbleModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserMadeBubbleModel.serializer, json.decode(jsonString));
  }

  static Serializer<UserMadeBubbleModel> get serializer => _$userMadeBubbleModelSerializer;
}
