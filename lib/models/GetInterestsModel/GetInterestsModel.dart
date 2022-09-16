// /{
//     "interests": [
//         {
//             "id": 1,
//             "title": "Reading"
//         },
//         {
//             "id": 2,
//             "title": "sport"
//         }
//     ],
//     "msg": "success",
//     "statuscode": 200
// }
//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library GetInterestsModel;

import 'dart:convert';

import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetInterestsModel.g.dart';

abstract class GetInterestsModel
    implements Built<GetInterestsModel,GetInterestsModelBuilder> {

  String? get msg;
  int? get StatusCode;
  BuiltList<InterestsListModel>? get interests;
  String? get error;

  GetInterestsModel._();
  factory GetInterestsModel([void Function(GetInterestsModelBuilder b)? updates]) =  _$GetInterestsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetInterestsModel.serializer, this));
  }
  static GetInterestsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetInterestsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetInterestsModel> get serializer => _$getInterestsModelSerializer;
}
