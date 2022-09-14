//
//

library SprintsLobbyUsersModel;

import 'dart:convert';


import 'package:bubbles/models/GetUsersInsideBubbleModel/FriendDataModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/GetUsersInsideBubbleModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/GetUsersInsideBubbleModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SprintsLobbyUsersModel.g.dart';

abstract class SprintsLobbyUsersModel
    implements Built<SprintsLobbyUsersModel,SprintsLobbyUsersModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;
  BuiltList<FriendData>? get users;

  SprintsLobbyUsersModel._();
  factory SprintsLobbyUsersModel([void Function(SprintsLobbyUsersModelBuilder b)? updates]) =  _$SprintsLobbyUsersModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SprintsLobbyUsersModel.serializer, this));
  }
  static SprintsLobbyUsersModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SprintsLobbyUsersModel.serializer, json.decode(jsonString));
  }

  static Serializer<SprintsLobbyUsersModel> get serializer => _$sprintsLobbyUsersModelSerializer;
}
