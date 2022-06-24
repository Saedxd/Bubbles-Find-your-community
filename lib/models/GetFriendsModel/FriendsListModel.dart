

library FriendsListModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'GetFriendsModel.dart';


part 'FriendsListModel.g.dart';

abstract class FriendsListModel
    implements Built<FriendsListModel,FriendsListModelBuilder> {


  String? get background_color;
  String? get alias;
  String? get avatar;
  String? get serial;
  String? get serialnumber;
  int? get id;





  FriendsListModel._();
  factory FriendsListModel([void Function(FriendsListModelBuilder b)? updates]) =  _$FriendsListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FriendsListModel.serializer, this));
  }
  static FriendsListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FriendsListModel.serializer, json.decode(jsonString));
  }

  static Serializer<FriendsListModel> get serializer => _$friendsListModelSerializer;
}
