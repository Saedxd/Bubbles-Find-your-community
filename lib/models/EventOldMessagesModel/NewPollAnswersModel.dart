//
library NewPollAnswersModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'NewPollAnswersModel.g.dart';

abstract class NewPollAnswersModel
    implements Built<NewPollAnswersModel,NewPollAnswersModelBuilder> {

  int? get id;
  int? get rate;
  int? get answer;//todo : change to String


  NewPollAnswersModel._();
  factory NewPollAnswersModel([void Function(NewPollAnswersModelBuilder b)? updates]) =  _$NewPollAnswersModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(NewPollAnswersModel.serializer, this));
  }
  static NewPollAnswersModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        NewPollAnswersModel.serializer, json.decode(jsonString));
  }

  static Serializer<NewPollAnswersModel> get serializer => _$newPollAnswersModelSerializer;
}


