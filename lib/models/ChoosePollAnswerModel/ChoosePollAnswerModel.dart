//

library ChoosePollAnswerModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ChoosePollAnswerModel.g.dart';

abstract class ChoosePollAnswerModel
    implements Built<ChoosePollAnswerModel,ChoosePollAnswerModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  ChoosePollAnswerModel._();
  factory ChoosePollAnswerModel([void Function(ChoosePollAnswerModelBuilder b)? updates]) =  _$ChoosePollAnswerModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ChoosePollAnswerModel.serializer, this));
  }
  static ChoosePollAnswerModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChoosePollAnswerModel.serializer, json.decode(jsonString));
  }

  static Serializer<ChoosePollAnswerModel> get serializer => _$choosePollAnswerModelSerializer;
}
