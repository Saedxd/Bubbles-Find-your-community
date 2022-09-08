library ManageBubble_State;

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

part 'ManageBubble_State.g.dart';

abstract class ManageBubbleState implements Built<ManageBubbleState, ManageBubbleStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

List<bool>? get Category_Chosen;
  ManageBubbleState._();

  factory ManageBubbleState([updates(ManageBubbleStateBuilder b)]) = _$ManageBubbleState;
  factory ManageBubbleState.initail() {
    return ManageBubbleState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..Category_Chosen = List.filled(4,false)

    );
  }




}
