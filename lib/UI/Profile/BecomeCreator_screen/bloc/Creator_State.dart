library Creator_State;

import 'dart:convert';

import 'package:bubbles/models/GetQuestionsModel/GetQuestionsModel.dart';
import 'package:bubbles/models/SubmitCreatorAnwersModel/SubmitCreatorAnwersModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'Creator_State.g.dart';

abstract class CreatorState implements Built<CreatorState, CreatorStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  GetQuestionsModel? get Questions;
  SubmitCreatorAnwersModel? get CreatorAnwers;

  CreatorState._();

  factory CreatorState([updates(CreatorStateBuilder b)]) = _$CreatorState;
  factory CreatorState.initail() {
    return CreatorState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false


        ..CreatorAnwers = null
        ..Questions = null
    );
  }
}
