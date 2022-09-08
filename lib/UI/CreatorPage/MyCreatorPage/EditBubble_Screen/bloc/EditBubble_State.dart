library EditBubble_State;

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

part 'EditBubble_State.g.dart';

abstract class EditBubbleState implements Built<EditBubbleState, EditBubbleStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get Searchsuccess;
  double? get Value;
  bool? get showDialogg;
  bool? get done;
  bool? get ToggleSaveIsloading;


  String? get Start_Time;
  String? get End_Time;

  String? get PickedColor;

  bool? get EventCateogorySuccess;
  bool? get EventCateogoryIsLoading;

  bool? get DoneChoose1;
  bool? get DoneChoose2;
  bool? get ChangeDone33;
  List<int>? get Chosen_Frineds;
  String? get GetfrinedsError;
  bool? get GetfriendsIsloading;
  bool? get GetFriendsSuccess;

  String? get CreateBubbleError;
  bool? get CreateBubbleISloading;
  bool? get CreateBUbbleSuccess;



  GetFriendsModel? get GetFriends;
  CreateBubbleModel? get CreateBubble;
  FriendListSearchModel? get SearchFrinedsResult;
  EventCateogoryModel? get EventCateogory;
  List<FriendlistData>? get Friendlist;
  List<FriendlistData>? get FilteredFriendlist;
  List<bool>? get IsChosen_Colors;
  bool? get ChooseColorIsLoading;

  EditBubbleState._();

  factory EditBubbleState([updates(EditBubbleStateBuilder b)]) = _$EditBubbleState;
  factory EditBubbleState.initail() {
    return EditBubbleState((b) => b
      ..error = ""
      ..Start_Time = ""
      ..PickedColor= ""
      ..End_Time = ""
      ..ChooseColorIsLoading = false
      ..EventCateogorySuccess = false
      ..EventCateogoryIsLoading = false
      ..IsChosen_Colors =List.filled(20,false)
      ..CreateBubbleError = ""
      ..GetfrinedsError = ""
      ..CreateBubbleISloading = false
      ..GetfriendsIsloading = false
      ..CreateBUbbleSuccess = false
      ..GetFriendsSuccess = false
      ..Friendlist = []
      ..FilteredFriendlist = []
      ..DoneChoose1 = false
      ..DoneChoose2 = false
      ..ChangeDone33 = true
      ..GetFriends = null
      ..CreateBubble = null
      ..SearchFrinedsResult = null
      ..EventCateogory = null
      ..Chosen_Frineds = List.filled(100000,0)


    );
  }




}
