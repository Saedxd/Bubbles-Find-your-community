//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library UsersInsideBubbleListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UsersInsideBubbleListModel.g.dart';

abstract class UsersInsideBubbleListModel
    implements Built<UsersInsideBubbleListModel,UsersInsideBubbleListModelBuilder> {
int? get me_id;
int? get id;
String? get serial;
String? get serialnumber;
String? get alias;
String? get background_color;
String? get avatar;
String? get bio;


  UsersInsideBubbleListModel._();
  factory UsersInsideBubbleListModel([void Function(UsersInsideBubbleListModelBuilder b)? updates]) =  _$UsersInsideBubbleListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UsersInsideBubbleListModel.serializer, this));
  }
  static UsersInsideBubbleListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UsersInsideBubbleListModel.serializer, json.decode(jsonString));
  }

  static Serializer<UsersInsideBubbleListModel> get serializer => _$usersInsideBubbleListModelSerializer;
}
