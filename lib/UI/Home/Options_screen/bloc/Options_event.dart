// ignore_for_file: non_constant_identifier_names

library Options_event;

import 'package:built_value/built_value.dart';




part 'Options_event.g.dart';

abstract class OptionsEvent {}



abstract class ClearError extends OptionsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([Function(ClearErrorBuilder b) updates]) = _$ClearError;
}


abstract class ChangeDone1 extends OptionsEvent
    implements Built<ChangeDone1, ChangeDone1Builder> {
  // fields go here
bool? get DoneColor1;
  ChangeDone1._();
  factory ChangeDone1([Function(ChangeDone1Builder b) updates]) = _$ChangeDone1;
}

abstract class ChangeDone2 extends OptionsEvent
    implements Built<ChangeDone2, ChangeDone2Builder> {
  // fields go here
  bool? get DoneColor2;
  ChangeDone2._();
  factory ChangeDone2([Function(ChangeDone2Builder b) updates]) = _$ChangeDone2;
}

abstract class GetFreinds extends OptionsEvent
    implements Built<GetFreinds,GetFreindsBuilder> {

  GetFreinds._();
  factory GetFreinds([Function(GetFreindsBuilder b) updates]) = _$GetFreinds;
}

abstract class CreateBubble extends OptionsEvent
    implements Built<CreateBubble, CreateBubbleBuilder> {

  double? get lng;
  double? get lat;
  int? get raduis;
  List<String>? get Dates;
  List<int>? get OrganizersId;
  String? get Start_Date;
  String? get End_Date;
  List<String>? get Base64Images;
  String? get ColorS;
  String? get LOcation;
  String? get Title;
  String? get Description;

  CreateBubble._();
  factory CreateBubble([updates(CreateBubbleBuilder b)]) = _$CreateBubble;
}

abstract class SearchFreinds extends OptionsEvent
    implements Built<SearchFreinds, SearchFreindsBuilder> {
String? get Keyword;
  SearchFreinds._();
  factory SearchFreinds([updates(SearchFreindsBuilder b)]) = _$SearchFreinds;
}

abstract class ChangeDone3 extends OptionsEvent
    implements Built<ChangeDone3, ChangeDone3Builder> {

  bool? get ChangeDone33;
  ChangeDone3._();
  factory ChangeDone3([Function(ChangeDone3Builder b) updates]) = _$ChangeDone3;
}