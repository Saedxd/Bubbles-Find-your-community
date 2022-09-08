library PageAdmins_State;

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

part 'PageAdmins_State.g.dart';

abstract class PageAdminsState implements Built<PageAdminsState, PageAdminsStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get ChooseFrined_isLoading;
  List<int>? get Chosen_Frineds;
  GetFriendsModel? get GetFriends;
  List<FriendlistData>? get Friendlist;
  List<FriendlistData>? get FilteredFriendlist;
  PageAdminsState._();

  factory PageAdminsState([updates(PageAdminsStateBuilder b)]) = _$PageAdminsState;
  factory PageAdminsState.initail() {
    return PageAdminsState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..ChooseFrined_isLoading = false
      ..FilteredFriendlist = []
      ..Chosen_Frineds = List.filled(100000,0)
      ..Friendlist = []
      ..GetFriends = null

    );
  }




}
