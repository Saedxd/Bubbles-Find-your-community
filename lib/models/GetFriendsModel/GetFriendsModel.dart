


library GetFriendsModel;

import 'dart:convert';

import 'package:bubbles/models/GetFriendsModel/FriendsListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'GetFriendsModel.dart';


part 'GetFriendsModel.g.dart';

abstract class GetFriendsModel
    implements Built<GetFriendsModel,GetFriendsModelBuilder> {

  String? get msg;
  int? get StatusCode;
  BuiltList<FriendsListModel>? get friends;
  String? get error;


  GetFriendsModel._();
  factory GetFriendsModel([void Function(GetFriendsModelBuilder b)? updates]) =  _$GetFriendsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetFriendsModel.serializer, this));
  }
  static GetFriendsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetFriendsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetFriendsModel> get serializer => _$getFriendsModelSerializer;
}
