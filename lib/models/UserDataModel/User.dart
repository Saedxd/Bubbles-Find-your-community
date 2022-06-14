//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library User;

import 'dart:convert';
import 'package:bubbles/models/UserDataModel/DataModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'User.g.dart';

abstract class UserModel
    implements Built<UserModel,UserModelBuilder> {

  String? get token;
  DateModel? get data;


  UserModel._();
  factory UserModel([void Function(UserModelBuilder b)? updates]) =  _$UserModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UserModel.serializer, this));
  }
  static UserModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModel.serializer, json.decode(jsonString));
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}

//{
//     "msg": "success",
//     "code": 1,
//     "user": {
//         "first_name": "alii",
//         "last_name": "Mohammed",
//         "email": "ali2@gamil.comss",
//         "gender": 1,
//         "background_color": "#FFF",
//         "alias": "alias",
//         "birth_date": "2022/05/12",
//         "bio": "Software Developer",
//         "avatar": "f4Qr2suFvcaJCWJkHuDIutZG6UhAvyOHp0FeVxB3.png",
//         "fcm_token": "GBGFHGFHFFFFFFFFFFG<DFGRGDFV<:R<VD:<DFV:DF<V::",
//         "is_creator": 0,
//         "updated_at": "2022-05-16T10:48:24.000000Z",
//         "created_at": "2022-05-16T10:48:24.000000Z",
//         "id": 19,
//         "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNGM1MGVjZjk2ZmU3YzQyZTYzMTU3YjM3N2IyOGE4OGIwYjMxN2U2OWRjY2QyNGNkZjc3MTNiNzdlM2I2MDI0NWE1OGM4ZDRjNmM0MDFkNTkiLCJpYXQiOjE2NTI2OTgxMDQuNzIwOTg5OTQyNTUwNjU5MTc5Njg3NSwibmJmIjoxNjUyNjk4MTA0LjcyMDk5MzA0MTk5MjE4NzUsImV4cCI6MTY4NDIzNDEwNC43MTY3OTcxMTM0MTg1NzkxMDE1NjI1LCJzdWIiOiIxOSIsInNjb3BlcyI6W119.FIcFTucVuvH40kTLL5Qq4nYdPSFd5RLA73JiEv5iWgJNPYrMmSk6L-k9cEWKBZ5af6ztg3n07VgTxYgrjiGKsxtZzmfWLVBtBn80NLl9RdfyknBVBwR5FNYOATPk3li7HLPEjN09RXn1XEJ_qt7Ov31BR_mwKoPV39f6OQgvL0VSUOumBknM9xI8oZlrnZEbWexSpNQsQP5i6FQ0J5Sfi2k9d6VwRvtoQGtlziatSIkvaq9Kg8EZ0IXkNEEMNaTkaSRB3keM4UHx144OtTNeUSfr4f3ePnrr8aEfwKvKyKdUUq6xDj5vKExcnfftCSo2kpKFt6HekK8pVSnURGi4oDarESeaTmPT9tajHsl2EFLCHv0_2m8csf4qG2PwxOkgSlPb8-SKCGkvlsMvYg3WX814MqImpMpQ8hcFyb4iK0iZ7jNYHN_rPMj0FTJnhVxxAq0ipZYcheQRaAJ5ssXcv3JcIUNie13NAe3ECb9kuLy889C3EvZ8KitkxkoQtwS8Ny02X9YEy-InusBd9YiKfAqwf7sz1mgluddf9E4xDQ8-7rc45wdOMpLyAgtjTjq0TIw3TapZKUg0m85tLR6343PDx13DFV9m5Us0Be9D9vKM1Mh-BrbnziPjOMpSp_rUFOh1oa6t9k3MECpwF3XpXoGqDbV8LbO1oVpEkq8vHs4"
//     }
// }