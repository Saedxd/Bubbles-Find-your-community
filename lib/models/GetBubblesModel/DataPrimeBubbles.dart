
library DataPrimeBubbles;

import 'dart:convert';



import 'package:bubbles/models/GetBubblesModel/CreatedByModel.dart';
import 'package:bubbles/models/GetBubblesModel/DatesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/EventCategoryModel.dart';
import 'package:bubbles/models/GetBubblesModel/ImagesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/OrganizersListModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/UsersInsideBubbleListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'DataPrimeBubbles.g.dart';

abstract class DataPrimeBubbles
    implements Built<DataPrimeBubbles,DataPrimeBubblesBuilder> {

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
  BuiltList<OrganizersListModel>? get moderators;
  BuiltList<ImagesEventListModel>? get images;
  BuiltList<DatesEventListModel>? get dates;
  BuiltList<UsersInsideBubbleListModel>? get users_in_bubble;
  BuiltList<UsersInsideBubbleListModel>? get saved_users;
  EventCategoryModel? get category;
  int? get id;
  double? get radius;
  CreatedByModel? get created_by;
  bool? get is_save;





  DataPrimeBubbles._();
  factory DataPrimeBubbles([void Function(DataPrimeBubblesBuilder b)? updates]) =  _$DataPrimeBubbles;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DataPrimeBubbles.serializer, this));
  }
  static DataPrimeBubbles? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DataPrimeBubbles.serializer, json.decode(jsonString));
  }

  static Serializer<DataPrimeBubbles> get serializer => _$dataPrimeBubblesSerializer;
}
