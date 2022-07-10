library home_state;

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_value/built_value.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  double? get Value;

  bool? get showDialogg;
  bool? get done;


  String? get GetAllBubblesError;
  bool? get GetAllBubblesIsloading;
  bool? get GetAllBubblesSuccess;

  String? get GetAllPrimeError;
  bool? get GetAllPrimeIsloading;
  bool? get GetAllPrimeSuccess;

  String? get GetNewBubblesError;
  bool? get GetNewBubblesIsloading;
  bool? get GetNewBubblesSuccess;
  Set<Marker>? get marker2;
  Set<Circle>? get circle;

  List<Locationss>? get locationn;
  List<int>? get BubblesRaduis;
  double get Userlat;
  double get Userlng;

  bool? get ValueLOading;
  double? get NewValue;
  bool? get MakeHimBEableTOSEtBubble;

  bool? get GetprofileISloading;
  bool? get GetprofileSuccess;

  List<BubbleData>? get BUBBLElistS1;
  List<BubbleData>? get FilteredBUBBLElists1;

  List<BubbleData>? get BUBBLElistS2;
  List<BubbleData>? get FilteredBUBBLElists2;

  List<BubbleData>? get BUBBLElistS3;
  List<BubbleData>? get FilteredBUBBLElists3;

  GetPrimeBubblesModel? get GetBubbles;
  GetPrimeBubblesModel? get GetPrimeBubbles;
  GetPrimeBubblesModel? get GetNewBubbles;
  GetPrimeBubblesModel? get GetNearbyBubbles;
  ProfileDateModel? get ProfileDate;


  HomeState._();

  factory HomeState([updates(HomeStateBuilder b)]) = _$HomeState;
  factory HomeState.initail() {
    return HomeState((b) => b
      ..error = ""
      ..GetAllBubblesError = ""
      ..GetNewBubblesError = ""
      ..GetAllPrimeError = ""
      ..isLoading = false
      ..MakeHimBEableTOSEtBubble = false
      ..GetNewBubblesIsloading = false
      ..GetAllPrimeIsloading = false
      ..GetAllBubblesIsloading = false
      ..success = false
      ..GetAllPrimeSuccess = false
      ..GetNewBubblesSuccess = false
      ..GetAllBubblesSuccess = false
      ..GetprofileISloading = false
      ..GetprofileSuccess = false
      ..Value=0
      ..NewValue = 0
      ..ValueLOading=false
      ..showDialogg = false
        ..done = false
        ..GetBubbles =null
        ..GetNewBubbles =null
        ..GetPrimeBubbles =null
        ..ProfileDate =null
        ..GetNearbyBubbles =null
        ..Userlat =37.9715
        ..Userlng =23.7267
        ..BubblesRaduis =[]
        ..BUBBLElistS1 =[]
        ..FilteredBUBBLElists1 =[]
        ..BUBBLElistS2 =[]
        ..FilteredBUBBLElists2 =[]
        ..BUBBLElistS3 =[]
        ..FilteredBUBBLElists3 =[]
        ..marker2 ={}
        ..circle ={}
        ..locationn =[]

    );
  }




}
