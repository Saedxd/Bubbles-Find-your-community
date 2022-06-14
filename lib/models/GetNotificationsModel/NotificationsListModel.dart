//
//
//{
//     "notifications": [
//         {
//             "id": 26,
//             "title": "Friend Request",
//             "body": "saed requested to add you as friend",
//             "type": "Request",
//             "user_id": 213,
//             "created_at": "2022-05-27T23:32:19.000000Z",
//             "updated_at": "2022-05-27T23:32:19.000000Z"
//         },
//         {
//             "id": 27,
//             "title": "Friend Request",
//             "body": "saed requested to add you as friend",
//             "type": "Request",
//             "user_id": 213,
//             "created_at": "2022-05-27T23:32:55.000000Z",
//             "updated_at": "2022-05-27T23:32:55.000000Z"
//         },
//         {
//             "id": 29,
//             "title": "Friend Request",
//             "body": "saed requested to add you as friend",
//             "type": "Request",
//             "user_id": 213,
//             "created_at": "2022-05-27T23:35:38.000000Z",
//             "updated_at": "2022-05-27T23:35:38.000000Z"
//         }
//     ],
//     "msg": "success",
//     "statuscode": 200
// }


library NotificationsListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'NotificationsListModel.g.dart';

abstract class NotificationsListModel
    implements Built<NotificationsListModel,NotificationsListModelBuilder> {

  String? get title;
  String? get body;
  String? get type;
  String? get created_at;
  String? get background_color;
  String? get avatar;
  int? get user_id;



  NotificationsListModel._();
  factory NotificationsListModel([void Function(NotificationsListModelBuilder b)? updates]) =  _$NotificationsListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(NotificationsListModel.serializer, this));
  }
  static NotificationsListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        NotificationsListModel.serializer, json.decode(jsonString));
  }

  static Serializer<NotificationsListModel> get serializer => _$notificationsListModelSerializer;
}
