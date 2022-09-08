
library SuggestFriendsModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'SuggestedListModel.dart';


part 'SuggestFriendsModel.g.dart';

abstract class SuggestFriendsModel
    implements Built<SuggestFriendsModel,SuggestFriendsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<SuggestedListModel>? get users;
  String? get error;




  SuggestFriendsModel._();
  factory SuggestFriendsModel([void Function(SuggestFriendsModelBuilder b)? updates]) =  _$SuggestFriendsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SuggestFriendsModel.serializer, this));
  }
  static SuggestFriendsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SuggestFriendsModel.serializer, json.decode(jsonString));
  }

  static Serializer<SuggestFriendsModel> get serializer => _$suggestFriendsModelSerializer;
}
