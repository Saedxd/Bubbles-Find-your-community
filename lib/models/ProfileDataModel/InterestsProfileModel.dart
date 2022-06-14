//
//{
//     "statuscode": 200,
//     "msg": "success",
//     "user": {
//         "id": 124,
//         "first_name": "saed",
//         "last_name": "younis",
//         "serial": "alias#8940",
//         "alias": "alias",
//         "avatar": "https://admin.bubbles.app/public/storage/avatar/11nZcKkOl5U61sc2I3GLgkYoZh2W9oWj7VUKiU6N.png",
//         "email": "saedyounis@gamil.com",
//         "is_creator": 0,
//         "lattitude": null,
//         "langtitude": null,
//         "is_notify": 1,
//         "background_color": "#FFF",
//         "birth_date": "2022/05/22",
//         "bio": "Software Developer",
//         "fcm_token": "GBGFHGFHFFFFFFFFFFG<DFGRGDFV<:R<VD:<DFV:DF<V::",
//         "is_verify": 0,
//         "avatar_social": null,
//         "gender": "Male",
//         "interests": [
//             {
//                 "id": 4,
//                 "title": "Art",
//                 "image": "https://admin.bubbles.app/public/storage/interest/ILwjMsTWZHgax6aLQG9MVe1Ey5s4ivbm3Us83TKB.png"
//             },
//             {
//                 "id": 5,
//                 "title": "Sports",
//                 "image": "https://admin.bubbles.app/public/storage/interest/m6UXGeL6wEm2oGA8YbtwjT4CMRQhBjc9g17X7GM5.png"
//             }
//         ]
//     }
// }


library InterestsProfileModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'InterestsProfileModel.g.dart';

abstract class InterestsProfileModel
    implements Built<InterestsProfileModel,InterestsProfileModelBuilder> {

  String? get title;
  String? get image;
  int? get id;


  InterestsProfileModel._();
  factory InterestsProfileModel([void Function(InterestsProfileModelBuilder b)? updates]) =  _$InterestsProfileModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(InterestsProfileModel.serializer, this));
  }
  static InterestsProfileModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        InterestsProfileModel.serializer, json.decode(jsonString));
  }

  static Serializer<InterestsProfileModel> get serializer => _$interestsProfileModelSerializer;
}
