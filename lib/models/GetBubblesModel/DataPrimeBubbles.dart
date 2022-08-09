//         "saved_users": [
//                 {
//                     "me_id": 536,
//                     "id": 539,
//                     "serial": "testt#7338",
//                     "serialnumber": "#7338",
//                     "alias": "testt",
//                     "background_color": "0xffffc107",
//                     "bio": "ggg",
//                     "avatar": "https://admin.bubbles.app/public/storage/avatar/zGOH4cxoy2eoguIR9VBEVXseRO9472RSGa2EZket.png",
//                     "is_friend": false
//                 },
//                 {
//                     "me_id": 536,
//                     "id": 494,
//                     "serial": "brokkolos#6562",
//                     "serialnumber": "#6562",
//                     "alias": "brokkolos",
//                     "background_color": "0xffe91e63",
//                     "bio": "Yoo! Finally an app where I can write a bio 😂                                                                       If we become friends we can:",
//                     "avatar": "https://admin.bubbles.app/public/storage/avatar/zGOH4cxoy2eoguIR9VBEVXseRO9472RSGa2EZket.png",
//                     "is_friend": false
//                 }
//             ],
//             "users_in_bubble": [
//                 {
//                     "me_id": 536,
//                     "id": 539,
//                     "serial": "testt#7338",
//                     "serialnumber": "#7338",
//                     "alias": "testt",
//                     "background_color": "0xffffc107",
//                     "bio": "ggg",
//                     "avatar": "https://admin.bubbles.app/public/storage/avatar/zGOH4cxoy2eoguIR9VBEVXseRO9472RSGa2EZket.png",
//                     "is_friend": false
//                 }
//             ],

library DataPrimeBubbles;

import 'dart:convert';



import 'package:bubbles/models/GetBubblesModel/CreatedByModel.dart';
import 'package:bubbles/models/GetBubblesModel/DatesEventListModel.dart';
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
  String? get category;
  BuiltList<OrganizersListModel>? get organizers;
  BuiltList<ImagesEventListModel>? get images;
  BuiltList<DatesEventListModel>? get dates;
  BuiltList<UsersInsideBubbleListModel>? get users_in_bubble;
  BuiltList<UsersInsideBubbleListModel>? get saved_users;

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
