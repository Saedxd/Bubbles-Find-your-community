library PlanPage_State;


import 'package:bubbles/models/GetBubblesModel/GetBubblesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/GetWhoSavedBubblesModel/GetWhoSavedBubblesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:built_value/built_value.dart';


part 'PlanPage_State.g.dart';

abstract class PlanPageState implements Built<PlanPageState, PlanPageStateBuilder>   {

  String? get error;
  bool? get isLoading;
  bool? get success;

  bool? get is_Saved;

  bool? get ToggleSaveIsloading;

  ProfileDateModel? get ProfileDate;
  GetDetailedEvent? get GetDetailedPlann;


  SaveBubbleModel? get SaveBubble;
  GetWhoSavedBubblesModel? get GetWhoSavedBubbles;


  PlanPageState._();
  factory PlanPageState([updates(PlanPageStateBuilder b)]) = _$PlanPageState;
  factory PlanPageState.initail() {
    return PlanPageState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..is_Saved = false
        ..GetDetailedPlann = null
        ..SaveBubble = null
        ..ProfileDate =null
        ..GetWhoSavedBubbles =null

    );
  }

}
