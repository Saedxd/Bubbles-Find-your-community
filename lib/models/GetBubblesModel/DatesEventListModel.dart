//
//          {
// //
// //                 }

library DatesEventListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'DatesEventListModel.g.dart';

abstract class DatesEventListModel
    implements Built<DatesEventListModel,DatesEventListModelBuilder> {
  String? get date;
  String? get created_at;
  String? get updated_at;
  int? get id;
  int? get event_info_id;



  DatesEventListModel._();
  factory DatesEventListModel([void Function(DatesEventListModelBuilder b)? updates]) =  _$DatesEventListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DatesEventListModel.serializer, this));
  }
  static DatesEventListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DatesEventListModel.serializer, json.decode(jsonString));
  }

  static Serializer<DatesEventListModel> get serializer => _$datesEventListModelSerializer;
}
