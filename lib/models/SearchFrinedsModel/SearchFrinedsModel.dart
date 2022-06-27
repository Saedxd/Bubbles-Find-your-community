//
//{
//     "user": [
//         {
//             "id": 432,
//             "email": "saed@saed.saedd",
//             "is_creator": 3,
//             "email_verified_at": null,
//             "created_at": "2022-06-23T09:07:25.000000Z",
//             "updated_at": "2022-06-24T10:35:12.000000Z",
//             "first_name": "saed",
//             "last_name": "saed",
//             "lattitude": null,
//             "langtitude": null,
//             "is_notify": 1,
//             "gender": 1,
//             "background_color": "0xffff5722",
//             "birth_date": "June 23, 2004",
//             "bio": "saedd",
//             "alias": "Saedd",
//             "fcm_token": "dtzt24vRSEeyYEjX_VjCXJ:APA91bEMxT4lDEoAHD63aePbQBW1_0ca4OeaAgL2XNseJjgzDf-q9GGgPAtSvAz6I0UCwkJyBc_e4vzWd3B4EIVZNf2ApdslocakQmjKWYYCFthe0LiaNFB4JduMaitEjNI220kIWGTZ",
//             "avatar": "46",
//             "avatar_social": null,
//             "social_id": null,
//             "is_verify": 3,
//             "serial": "Saedd#3685",
//             "image1": null,
//             "image2": null,
//             "points": 26,
//             "daily_login": 1,
//             "is_register": 3,
//             "added_user": 0,
//             "invitation": 0,
//             "visit_bubble": 0,
//             "login_at": "2022-06-24",
//             "num_friend": 0,
//             "num_bubble": 0,
//             "invitation_num": 0,
//             "added_user_status": 0,
//             "invitation_status": 0,
//             "visit_bubble_status": 0,
//             "pivot": {
//                 "user_id": 419,
//                 "friend_id": 432
//             }
//         }
//     ]
// }

library SearchFrinedsModel;

import 'dart:convert';


import 'package:bubbles/models/SearchFrinedsModel/UserModell.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SearchFrinedsModel.g.dart';

abstract class SearchFrinedsModel
    implements Built<SearchFrinedsModel,SearchFrinedsModelBuilder> {


BuiltList<UserModell>? get user;


  SearchFrinedsModel._();
  factory SearchFrinedsModel([void Function(SearchFrinedsModelBuilder b)? updates]) =  _$SearchFrinedsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchFrinedsModel.serializer, this));
  }
  static SearchFrinedsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchFrinedsModel.serializer, json.decode(jsonString));
  }

  static Serializer<SearchFrinedsModel> get serializer => _$searchFrinedsModelSerializer;
}
