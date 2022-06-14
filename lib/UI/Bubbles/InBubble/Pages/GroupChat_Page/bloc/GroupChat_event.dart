// ignore_for_file: non_constant_identifier_names

library GroupChat_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'GroupChat_event.g.dart';

abstract class GroupChatevent {}

abstract class ClearError extends GroupChatevent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class KetbaordStatus extends GroupChatevent
    implements Built<KetbaordStatus,KetbaordStatusBuilder> {
  bool? get status;
  KetbaordStatus._();
  factory KetbaordStatus([updates(KetbaordStatusBuilder b)]) = _$KetbaordStatus;
}

