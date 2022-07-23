// ignore_for_file: file_names

library Saved_State;

import 'dart:convert';


import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:built_value/built_value.dart';

import '../Pages/SavedBubbles_Screen.dart';


part 'Saved_State.g.dart';

abstract class SavedBubblesState implements Built<SavedBubblesState, SavedBubblesStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get ShapStatus;


  bool? get UnSaveIsloading;

  GetPrimeBubblesModel? get GetSavedBubbles;
  SaveBubbleModel? get SaveBubble;
  List<BubbleData>? get SavedBubbleList;


  SavedBubblesState._();

  factory SavedBubblesState([updates(SavedBubblesStateBuilder b)]) = _$SavedBubblesState;
  factory SavedBubblesState.initail() {
    return SavedBubblesState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..ShapStatus = false
      ..UnSaveIsloading = false
      ..GetSavedBubbles = null
      ..SaveBubble = null
      ..SavedBubbleList = []
    );
  }




}
