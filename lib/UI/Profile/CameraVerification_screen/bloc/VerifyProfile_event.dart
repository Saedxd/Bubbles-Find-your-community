// ignore_for_file: non_constant_identifier_names

library VerifyProfile_event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'VerifyProfile_event.g.dart';

abstract class VerifyProfileEvent {}


abstract class ClearError extends VerifyProfileEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}



abstract class AddImages extends VerifyProfileEvent
    implements Built<AddImages, AddImagesBuilder> {
  String? get image1;
  String? get image2;
  AddImages._();
  factory AddImages([updates(AddImagesBuilder b)]) = _$AddImages;
}



abstract class ChangeDone extends VerifyProfileEvent
    implements Built<ChangeDone, ChangeDoneBuilder> {

  ChangeDone._();
  factory ChangeDone([updates(ChangeDoneBuilder b)]) = _$ChangeDone;
}


