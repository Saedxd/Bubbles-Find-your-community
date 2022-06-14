//{
//     "avatars": [
//         {
//             "id": 2,
//             "created_at": "2022-05-11T19:02:19.000000Z",
//             "updated_at": "2022-05-11T19:02:19.000000Z",
//             "image": {
//                 "id": 9,
//                 "image": "../../public/f4Qr2suFvcaJCWJkHuDIutZG6UhAvyOHp0FeVxB3.png",
//                 "media_id": 2
//             }
//         },
//         {
//             "id": 4,
//             "created_at": "2022-05-11T19:06:13.000000Z",
//             "updated_at": "2022-05-11T19:06:13.000000Z",
//             "image": {
//                 "id": 11,
//                 "image": "../../public/w2HayEZH12Dviq5bcNhZnmglbCCulWUrdEVsNy3V.png",
//                 "media_id": 4
//             }
//         },
//         {
//             "id": 5,
//             "created_at": "2022-05-11T19:06:21.000000Z",
//             "updated_at": "2022-05-11T19:06:21.000000Z",
//             "image": {
//                 "id": 12,
//                 "image": "../../public/D1Urp6eZ5ONas4UkLiTIYbinJTHv90HCLDOEPyF7.png",
//                 "media_id": 5
//             }
//         }
//     ],
//     "msg": "success",
//     "statuscode": 200
// }

//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library GetGender;

import 'dart:convert';

import 'package:bubbles/models/GetAvatarsModel/AvatarListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'GetAvatarsModel.dart';


part 'GetAvatarsModel.g.dart';

abstract class GetAvatarsModel
    implements Built<GetAvatarsModel,GetAvatarsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<AvatarListModel>? get avatars;



  GetAvatarsModel._();
  factory GetAvatarsModel([void Function(GetAvatarsModelBuilder b)? updates]) =  _$GetAvatarsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetAvatarsModel.serializer, this));
  }
  static GetAvatarsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetAvatarsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetAvatarsModel> get serializer => _$getAvatarsModelSerializer;
}
