//

library SubmitCreatorAnwersModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SubmitCreatorAnwersModel.g.dart';

abstract class SubmitCreatorAnwersModel
    implements Built<SubmitCreatorAnwersModel,SubmitCreatorAnwersModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  SubmitCreatorAnwersModel._();
  factory SubmitCreatorAnwersModel([void Function(SubmitCreatorAnwersModelBuilder b)? updates]) =  _$SubmitCreatorAnwersModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SubmitCreatorAnwersModel.serializer, this));
  }
  static SubmitCreatorAnwersModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SubmitCreatorAnwersModel.serializer, json.decode(jsonString));
  }

  static Serializer<SubmitCreatorAnwersModel> get serializer => _$submitCreatorAnwersModelSerializer;
}
