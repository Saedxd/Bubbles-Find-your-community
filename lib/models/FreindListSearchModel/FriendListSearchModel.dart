//

library FriendListSearchModel;

import 'dart:convert';


import 'package:bubbles/models/FreindListSearchModel/FreindsFilteredListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FriendListSearchModel.g.dart';

abstract class FriendListSearchModel
    implements Built<FriendListSearchModel,FriendListSearchModelBuilder> {

 BuiltList<FreindsFilteredListModel>? get user;
 String? get error;

  FriendListSearchModel._();
  factory FriendListSearchModel([void Function(FriendListSearchModelBuilder b)? updates]) =  _$FriendListSearchModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FriendListSearchModel.serializer, this));
  }
  static FriendListSearchModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FriendListSearchModel.serializer, json.decode(jsonString));
  }

  static Serializer<FriendListSearchModel> get serializer => _$friendListSearchModelSerializer;
}
