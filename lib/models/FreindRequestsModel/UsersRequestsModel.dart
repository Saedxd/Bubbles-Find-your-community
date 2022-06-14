//
//{
//     "msg": "success",
//     "statuscode": 200,
//     "users": [
//         {
//             "id": 130,
//             "serial": "bubblee#1374",
//             "alias": "bubblee",
//             "avatar": "https://admin.bubbles.app/public/storage/avatar/11nZcKkOl5U61sc2I3GLgkYoZh2W9oWj7VUKiU6N.png"
//         },
//         {
//             "id": 132,
//             "serial": "test#3305",
//             "alias": "test",
//             "avatar": "-"
//         }
//     ]
// }


library UsersRequestsModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UsersRequestsModel.g.dart';

abstract class UsersRequestsModel
    implements Built<UsersRequestsModel,UsersRequestsModelBuilder> {

  String? get serial;
  String? get serialnumber;
  String? get alias;
  String? get background_color;
  String? get avatar;
  int? get id;



  UsersRequestsModel._();
  factory UsersRequestsModel([void Function(UsersRequestsModelBuilder b)? updates]) =  _$UsersRequestsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UsersRequestsModel.serializer, this));
  }
  static UsersRequestsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UsersRequestsModel.serializer, json.decode(jsonString));
  }

  static Serializer<UsersRequestsModel> get serializer => _$usersRequestsModelSerializer;
}
