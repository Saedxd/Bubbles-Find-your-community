library Options_state;

import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:built_value/built_value.dart';




part 'Options_state.g.dart';

abstract class OptionsState implements Built<OptionsState, OptionsStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
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


  List<FriendlistData>? get Friendlist;
  List<FriendlistData>? get FilteredFriendlist;

  OptionsState._();

  factory OptionsState([Function(OptionsStateBuilder b) updates]) = _$OptionsState;
  factory OptionsState.initail() {
    return OptionsState((b) => b
      ..error = ""
      ..CreateBubbleError = ""
      ..GetfrinedsError = ""
      ..isLoading = false
      ..CreateBubbleISloading = false
      ..GetfriendsIsloading = false
      ..success = false
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



    );
  }
}
