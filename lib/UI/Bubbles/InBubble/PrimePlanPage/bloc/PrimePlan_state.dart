library PrimePlan_state;


import 'package:bubbles/models/GetBubblesModel/GetBubblesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/GetWhoSavedBubblesModel/GetWhoSavedBubblesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:built_value/built_value.dart';


part 'PrimePlan_state.g.dart';

abstract class PrimePlan_state implements Built<PrimePlan_state, PrimePlan_stateBuilder>   {

  String? get error;
  bool? get isLoading;
  bool? get success;

  bool? get is_Saved;

  bool? get ToggleSaveIsloading;

  ProfileDateModel? get ProfileDate;
  GetDetailedEvent? get GetDetailedPlann;


  SaveBubbleModel? get SaveBubble;
  GetWhoSavedBubblesModel? get GetWhoSavedBubbles;


  PrimePlan_state._();
  factory PrimePlan_state([updates(PrimePlan_stateBuilder b)]) = _$PrimePlan_state;
  factory PrimePlan_state.initail() {
    return PrimePlan_state((b) => b
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
