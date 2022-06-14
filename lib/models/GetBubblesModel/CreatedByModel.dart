library CreatedByModel;

import 'dart:convert';



import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'UserMadeBubbleModel.dart';


part 'CreatedByModel.g.dart';

abstract class CreatedByModel
    implements Built<CreatedByModel,CreatedByModelBuilder> {

  String? get type;
  UserMadeBubbleModel? get user;

//      "created_by": {
//                 "type": "admin",
//                 "user": {
//                     "id": 3,
//                     "name": "Alaa Mohammed",
//                     "email": "super_admin@app.com",
//                     "created_at": "2022-05-14T17:51:45.000000Z",
//                     "updated_at": "2022-05-14T17:51:45.000000Z"
//                 }
//             }


  CreatedByModel._();
  factory CreatedByModel([void Function(CreatedByModelBuilder b)? updates]) =  _$CreatedByModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(CreatedByModel.serializer, this));
  }
  static CreatedByModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CreatedByModel.serializer, json.decode(jsonString));
  }

  static Serializer<CreatedByModel> get serializer => _$createdByModelSerializer;
}
