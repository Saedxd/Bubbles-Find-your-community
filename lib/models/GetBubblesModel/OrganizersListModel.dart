//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library OrganizersListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'OrganizersListModel.g.dart';

abstract class OrganizersListModel
    implements Built<OrganizersListModel,OrganizersListModelBuilder> {

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
  String? get avatar;//todo: change this to int
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




// // //                     "created_at": "2022-06-06T22:14:52.000000Z",
// // //                     "updated_at": "2022-06-06T23:17:21.000000Z",
// // //                     "first_name": "saed",
// // //                     "last_name": "saed",
// // //                     "lattitude": null,
// // //                     "langtitude": null,
// // //                     "is_notify": 1,
// // //                     "gender": 1,
// // //                     "background_color": "0xffff5722",
// // //                     "birth_date": "June 10, 2004",
// // //                     "bio": "saed",
// // //                     "alias": "saed",
// // //                     "fcm_token": "dtzt24vRSEeyYEjX_VjCXJ:APA91bEMxT4lDEoAHD63aePbQBW1_0ca4OeaAgL2XNseJjgzDf-q9GGgPAtSvAz6I0UCwkJyBc_e4vzWd3B4EIVZNf2ApdslocakQmjKWYYCFthe0LiaNFB4JduMaitEjNI220kIWGTZ",
// // //                     "avatar": "13",
// // //                     "avatar_social": null,
// // //                     "social_id": null,
// // //                     "is_verify": 0,
// // //                     "serial": "saed#6981",
// // //                     "image1": "public/storage/EKwZ8aPK-1654555614.png",
// // //                     "image2": "public/storage/1XDaBS5Y-1654555614.png",
// // //                     "points": 25,
// // //                     "daily_login": 1,
// // //                     "is_register": 3,
// // //                     "added_user": 0,
// // //                     "invitation": 0,
// // //                     "visit_bubble": 0,
// // //                     "login_at": "2022-06-06",
// // //                     "num_friend": 1,
// // //                     "num_bubble": 0,
// // //                     "invitation_num": 0,
// // //                     "added_user_status": 0,
// // //                     "invitation_status": 0,
// // //                     "visit_bubble_status": 0

  OrganizersListModel._();
  factory OrganizersListModel([void Function(OrganizersListModelBuilder b)? updates]) =  _$OrganizersListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(OrganizersListModel.serializer, this));
  }
  static OrganizersListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrganizersListModel.serializer, json.decode(jsonString));
  }

  static Serializer<OrganizersListModel> get serializer => _$organizersListModelSerializer;
}
