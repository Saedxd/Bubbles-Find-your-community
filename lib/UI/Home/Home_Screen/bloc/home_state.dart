library home_state;


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

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get Searchsuccess;
  double? get Value;
  bool? get showDialogg;
  bool? get done;
  bool? get ToggleSaveIsloading;
  bool? get is_Creator;
  bool? get ShowBubbleDetailsUI;
  BubbleData? get DetailBubbledata;

  GetBubblesModel? get GetSavedBubbles;
  SaveBubbleModel? get SaveBubble;
  List<BubbleData>? get SavedBubbleList;

  String? get GetAllBubblesError;
  bool? get GetAllBubblesIsloading;
  bool? get GetAllBubblesSuccess;

  bool? get NearbyIsloading;
  bool? get NearbySuccess;

  String? get GetAllPrimeError;
  bool? get GetAllPrimeIsloading;
  bool? get GetAllPrimeSuccess;

  String? get GetNewBubblesError;
  bool? get GetNewBubblesIsloading;
  bool? get GetNewBubblesSuccess;

  bool? get ShapStatus;

  Set<Marker>? get marker2;
  Set<Circle>? get circle;

  Set<Marker>? get NewBubble_marker2;
  Set<Circle>? get NewBubble_circle;


  List<Locationss>? get locationn;
  List<int>? get BubblesRaduis;
  double get Userlat;
  double get Userlng;

  double get Bubble_lat;
  double get Bubble_lng;

  bool? get ValueLOading;
  double? get NewValue;
  bool? get MakeHimBEableTOSEtBubble;

  bool? get GetprofileISloading;
  bool? get GetprofileSuccess;

  bool? get ChangeViewStatus;

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

  List<BubbleData>? get BUBBLElistS1;
  List<BubbleData>? get BUBBLElistS2;
  List<BubbleData>? get BUBBLElistS3;
  List<BubbleData>? get BUBBLElistS4;
  List<BubbleData>? get BUBBLElistS5;
  List<BubbleData>? get BUBBLElistS6;


  List<BubbleData>? get Used_From_All_Lists;
  List<BubbleData>? get FilteredBubbleList;
  List<bool>? get Saved_Status;

  GetBubblesModel? get GetBubbles;
  GetBubblesModel? get GetPrimeBubbles;
  GetBubblesModel? get GetNewBubbles;
  GetBubblesModel? get GetNearbyBubbles;
  GetBubblesModel? get GetPopularNowBubbles;
  GetBubblesModel? get GetUpcomingBubbles;
  GetBubblesModel? get GetActiveBubbles;


  List<bool>? get DetailUiSaveStatus;
  List<int>? get DetailUiSaveID;
  bool? get DetailUiSaveISloading;
  //ProfileDateModel? get ProfileDate;

  // GetFriendsModel? get GetFriends;
  // CreateBubbleModel? get CreateBubble;
  // FriendListSearchModel? get SearchFrinedsResult;
  // EventCateogoryModel? get EventCateogory;
  // List<FriendlistData>? get Friendlist;
  // List<FriendlistData>? get FilteredFriendlist;
  // List<bool>? get IsChosen_Colors;
  // bool? get ChooseColorIsLoading;


  HomeState._();

  factory HomeState([updates(HomeStateBuilder b)]) = _$HomeState;
  factory HomeState.initail() {
    return HomeState((b) => b
      ..error = ""
      ..GetAllBubblesError = ""
      ..GetNewBubblesError = ""
      ..GetAllPrimeError = ""
      ..Start_Time = ""
      ..PickedColor= ""
      ..End_Time = ""
      ..isLoading = false
      ..ShowBubbleDetailsUI = false
      ..Searchsuccess = false
      ..ShapStatus = true
      ..NearbyIsloading = false
      ..NearbySuccess = false
      ..ToggleSaveIsloading = false
      ..MakeHimBEableTOSEtBubble = false
      ..GetNewBubblesIsloading = false
      ..GetAllPrimeIsloading = false
      ..GetAllBubblesIsloading = false
      ..EventCateogorySuccess = false
      ..EventCateogoryIsLoading = false
      ..success = false
      ..GetAllPrimeSuccess = false
      ..GetNewBubblesSuccess = false
      ..GetAllBubblesSuccess = false
      ..GetprofileISloading = false
      ..GetprofileSuccess = false
      ..ChangeViewStatus = false
      ..Value=0
      ..is_Creator = false
      ..Bubble_lat=0
      ..Bubble_lng=0
      ..NewValue = 50
      ..ValueLOading=false
      ..showDialogg = false
        ..done = false
        ..DetailUiSaveISloading = false
        ..GetBubbles =null
        ..SaveBubble =null
        ..GetSavedBubbles =null
        ..GetNewBubbles =null
        ..GetPrimeBubbles =null
        //..ProfileDate =null
        ..GetNearbyBubbles =null
        ..GetPopularNowBubbles =null
        ..DetailBubbledata =null
        ..Userlat =37.9715
        ..Userlng =23.7267
        ..BubblesRaduis =[]
        ..Used_From_All_Lists =[]
        ..FilteredBubbleList =[]
        ..BUBBLElistS1 =[]
        ..SavedBubbleList =[]
        ..BUBBLElistS2 =[]
        ..BUBBLElistS3 =[]
        ..BUBBLElistS4 =[]
        ..BUBBLElistS5 =[]
        ..BUBBLElistS6 =[]
        ..Saved_Status =[]
        ..DetailUiSaveStatus =[]
        ..DetailUiSaveID =[]

        ..marker2 ={}
        ..circle ={}
        ..NewBubble_marker2 ={}
        ..NewBubble_circle ={}
        ..locationn =[]
      ..CreateBubbleError = ""
      ..GetfrinedsError = ""
      ..CreateBubbleISloading = false
      ..GetfriendsIsloading = false
      ..CreateBUbbleSuccess = false
      ..GetFriendsSuccess = false

      ..DoneChoose1 = false
      ..DoneChoose2 = false
      ..ChangeDone33 = true



    );
  }




}
