//
//
library ReplieslISTModel;

import 'dart:convert';


import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ReplieslISTModel.g.dart';

abstract class ReplieslISTModel
    implements Built<ReplieslISTModel,ReplieslISTModelBuilder> {

  int? get id;
  String? get alias;
  String? get serial;
  String? get bio;
  String? get avatar;
  String? get background;
  String? get comment;
  String? get CreatAt;
  bool? get is_friend;
  BuiltList<InterestsListModel>? get interests;



  ReplieslISTModel._();
  factory ReplieslISTModel([void Function(ReplieslISTModelBuilder b)? updates]) =  _$ReplieslISTModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ReplieslISTModel.serializer, this));
  }
  static ReplieslISTModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ReplieslISTModel.serializer, json.decode(jsonString));
  }

  static Serializer<ReplieslISTModel> get serializer => _$replieslISTModelSerializer;
}
