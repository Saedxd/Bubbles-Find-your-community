library PlanPage_State;


import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_value/built_value.dart';


part 'PlanPage_State.g.dart';

abstract class PlanPageState implements Built<PlanPageState, PlanPageStateBuilder>   {

  String? get error;
  bool? get isLoading;
  bool? get success;
  ProfileDateModel? get ProfileDate;
  GetDetailedEvent? get GetDetailedPlann;

  PlanPageState._();
  factory PlanPageState([updates(PlanPageStateBuilder b)]) = _$PlanPageState;
  factory PlanPageState.initail() {
    return PlanPageState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
        ..GetDetailedPlann = null
        ..ProfileDate =null

    );
  }

}
