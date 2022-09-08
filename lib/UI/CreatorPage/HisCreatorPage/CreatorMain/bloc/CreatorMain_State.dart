library CreatorMain_State;

import 'package:bubbles/UI/Home/CreateBubble_Screen/data/data.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/Event_CateogoryModel/EventCateogoryModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetBubblesModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'CreatorMain_State.g.dart';

abstract class CreatorMainState implements Built<CreatorMainState, CreatorMainStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;



  CreatorMainState._();

  factory CreatorMainState([updates(CreatorMainStateBuilder b)]) = _$CreatorMainState;
  factory CreatorMainState.initail() {
    return CreatorMainState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
    );
  }




}
