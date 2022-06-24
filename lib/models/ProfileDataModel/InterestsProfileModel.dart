

library InterestsProfileModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'InterestsProfileModel.g.dart';

abstract class InterestsProfileModel
    implements Built<InterestsProfileModel,InterestsProfileModelBuilder> {

  String? get title;
  String? get image;
  int? get id;


  InterestsProfileModel._();
  factory InterestsProfileModel([void Function(InterestsProfileModelBuilder b)? updates]) =  _$InterestsProfileModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(InterestsProfileModel.serializer, this));
  }
  static InterestsProfileModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        InterestsProfileModel.serializer, json.decode(jsonString));
  }

  static Serializer<InterestsProfileModel> get serializer => _$interestsProfileModelSerializer;
}
