library CreateBubble_State;


import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/Event_CateogoryModel/EventCateogoryModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetBubblesModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'CreateBubble_State.g.dart';

abstract class CreateBubbleState implements Built<CreateBubbleState, CreateBubbleStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get Searchsuccess;
  double? get Value;
  bool? get showDialogg;
  bool? get done;
  bool? get ToggleSaveIsloading;
  bool? get AddedImageIS_Success;


 String? get Start_Time;
 String? get End_Time;

  String? get PickedColor;

  bool? get EventCateogorySuccess;
  bool? get EventCateogoryIsLoading;

  bool? get DoneChoose1;
  bool? get DoneChoose2;
  bool? get ChangeDone33;

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
  List<FrinedsData>? get Friendlist;
  List<FrinedsData>? get FilteredFriendlist;
  List<bool>? get IsChosen_Colors;
  bool? get ChooseColorIsLoading;


  CreateBubbleState._();

  factory CreateBubbleState([updates(CreateBubbleStateBuilder b)]) = _$CreateBubbleState;
  factory CreateBubbleState.initail() {
    return CreateBubbleState((b) => b
      ..error = ""
      ..Start_Time = ""
      ..PickedColor= ""
      ..End_Time = ""
        ..ChooseColorIsLoading = false
        ..AddedImageIS_Success = false
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



    );
  }




}
