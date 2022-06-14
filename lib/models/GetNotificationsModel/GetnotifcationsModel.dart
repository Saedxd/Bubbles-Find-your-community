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


library GetnotifcationsModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'NotificationsListModel.dart';


part 'GetnotifcationsModel.g.dart';

abstract class GetnotifcationsModel
    implements Built<GetnotifcationsModel,GetnotifcationsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<NotificationsListModel>? get notifications;



  GetnotifcationsModel._();
  factory GetnotifcationsModel([void Function(GetnotifcationsModelBuilder b)? updates]) =  _$GetnotifcationsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetnotifcationsModel.serializer, this));
  }
  static GetnotifcationsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetnotifcationsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetnotifcationsModel> get serializer => _$getnotifcationsModelSerializer;
}
