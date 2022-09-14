//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library FriendDataModel;

import 'dart:convert';


import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FriendDataModel.g.dart';

abstract class FriendData
    implements Built<FriendData,FriendDataBuilder> {
int? get me_id;
int? get id;
String? get serial;
String? get serialnumber;
String? get alias;
String? get background_color;
String? get avatar;
String? get bio;
bool? get is_friend;
BuiltList<InterestsListModel>? get interests;


  FriendData._();
  factory FriendData([void Function(FriendDataBuilder b)? updates]) =  _$FriendData;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FriendData.serializer, this));
  }
  static FriendData? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FriendData.serializer, json.decode(jsonString));
  }

  static Serializer<FriendData> get serializer => _$friendDataSerializer;
}
