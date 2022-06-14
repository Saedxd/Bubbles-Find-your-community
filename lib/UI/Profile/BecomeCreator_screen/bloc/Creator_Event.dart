library Creator_Event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Creator_Event.g.dart';

abstract class CreatorEvent {}

abstract class ClearError extends CreatorEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}


abstract class GetQuestions extends CreatorEvent
    implements Built<GetQuestions, GetQuestionsBuilder> {

  GetQuestions._();
  factory GetQuestions([updates(GetQuestionsBuilder b)]) = _$GetQuestions;
}

abstract class SubmitAnswers extends CreatorEvent
    implements Built<SubmitAnswers, SubmitAnswersBuilder> {

  List<int>? get AnswerID;
  List<int>? get QuestionId;

  SubmitAnswers._();
  factory SubmitAnswers([updates(SubmitAnswersBuilder b)]) = _$SubmitAnswers;
}
