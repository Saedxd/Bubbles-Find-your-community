//
library DataEventDetailModel;

import 'dart:convert';


import 'package:bubbles/models/GetBubblesModel/CreatedByModel.dart';
import 'package:bubbles/models/GetBubblesModel/DatesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/ImagesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/OrganizersListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'DataEventDetailModel.g.dart';

abstract class DataEventDetailModel
    implements Built<DataEventDetailModel,DataEventDetailModelBuilder> {

  String? get title;
  String? get color;
  String? get location;
  String? get description;
  String? get draw_type;
  String? get type;
  double? get lat;
  double? get lng;
  String? get is_available;
  String? get start_event_date;
  String? get end_event_date;
  BuiltList<OrganizersListModel>? get organizers;
  BuiltList<ImagesEventListModel>? get images;
  BuiltList<DatesEventListModel>? get dates;
  int? get id;
  double? get radius;
  CreatedByModel? get created_by;
  bool? get is_save;


  DataEventDetailModel._();
  factory DataEventDetailModel([void Function(DataEventDetailModelBuilder b)? updates]) =  _$DataEventDetailModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DataEventDetailModel.serializer, this));
  }
  static DataEventDetailModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DataEventDetailModel.serializer, json.decode(jsonString));
  }

  static Serializer<DataEventDetailModel> get serializer => _$dataEventDetailModelSerializer;
}
