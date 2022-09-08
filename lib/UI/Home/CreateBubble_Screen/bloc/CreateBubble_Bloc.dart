
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/prefs_helper/prefs_helper.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_Event.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_State.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/data/data.dart';




class CreateBubbleBloc extends Bloc<CreateBubbleEvent, CreateBubbleState> {

  IRepository _repository;

  CreateBubbleBloc(this._repository) : super(CreateBubbleState.initail()) ;

  @override
  CreateBubbleState get initialState => CreateBubbleState.initail();

  @override
  Stream<CreateBubbleState> mapEventToState(
      CreateBubbleEvent event,
      ) async* {



    if (event is ChangeDone1) {
      yield state.rebuild((b) => b
        ..DoneChoose1 = event.DoneColor1
      );
    }

    if (event is ChangeDone2) {
      yield state.rebuild((b) => b
        ..DoneChoose2 = event.DoneColor2
      );
    }
    if (event is ChangeDone3) {
      yield state.rebuild((b) => b
        ..ChangeDone33 = event.ChangeDone33
      );
    }
    if (event is GetFreinds) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetFriends = null
        );

        final date = await _repository.GetFreinds();
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetFriends.replace(date)
        );

        state.FilteredFriendlist!.clear();
        state.Friendlist!.clear();

        for(int i=0;i<state.GetFriends!.friends!.length;i++){
          FriendlistData FreindData = FriendlistData();

          FreindData.Avatar = state.GetFriends!.friends![i].avatar.toString();
          FreindData.alias = state.GetFriends!.friends![i].alias.toString();
          String value =  state.GetFriends!.friends![i].background_color.toString();
          var myInt = int.parse(value);
          var BackgroundColor = myInt;
          FreindData.backgroundColor =BackgroundColor;

          FreindData.id = state.GetFriends!.friends![i].id!.toInt();
          FreindData.MY_id = state.GetFriends!.friends![i].me_id!.toInt();

          state.FilteredFriendlist!.add(FreindData);
          state.Friendlist!.add(FreindData);
        }

        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
        );






      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetFriends = null
        );
      }
    }
    if (event is GetEventCateogories) {
      try {
        yield state.rebuild((b) =>
        b
          ..EventCateogoryIsLoading = true
          ..EventCateogorySuccess = false
          ..EventCateogory = null
        );

        final date = await _repository.GetEventCateogories();
        yield state.rebuild((b) =>
        b    ..EventCateogoryIsLoading = false
          ..EventCateogorySuccess = true
          ..EventCateogory.replace(date)
        );


      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is CreateBubble) {
        yield state.rebuild((b) =>
        b
          ..CreateBubbleISloading = true
          ..CreateBubbleError = ""
          ..CreateBUbbleSuccess = false
          ..CreateBubble = null
        );
        final date = await _repository.CreateBubble(event.Title!, event.LOcation!, event.Base64Images!, event.ColorS!, event.Description!, event.OrganizersId!, event.Start_Date!, event.End_Date!, event.Dates!, event.lng!, event.lat!, event.raduis!,event.Cateogory_id!);


        print('get Success data $date');
        yield state.rebuild((b) =>
        b
          ..CreateBubble.replace(date)
        );
        yield state.rebuild((b) =>
        b
          ..CreateBubbleISloading = false
          ..CreateBubbleError = ""
          ..CreateBUbbleSuccess = true
        );
    }
    if (event is SelectColor) {
      try {
        yield state.rebuild((b) =>
        b ..IsChosen_Colors = List.filled(20,false)
        );

        yield state.rebuild((b) =>
        b ..ChooseColorIsLoading = false
          ..IsChosen_Colors![event.Index!] = true
            ..PickedColor = event.PickedColor
        );

        yield state.rebuild((b) =>
        b..ChooseColorIsLoading = true
        );
        print(state.IsChosen_Colors);

        print("Clicked2");
      } catch (e) {
        print('get Error $e');
      }
    }


    if (event is SearchFreinds) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
        );

        state.FilteredFriendlist!.clear();
        print("Cleared");

        state.Friendlist!.forEach((FriendObject) {
          if (FriendObject.alias!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
            state.FilteredFriendlist!.add(FriendObject);
          }
        });


        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..SearchFrinedsResult = null
        );
      }
    }
    if (event is AddStartandEndTime) {
      try {
        yield state.rebuild((b) => b
            ..Start_Time = event.StartTime
            ..End_Time = event.EndTime
        );


      } catch (e) {
        print('get Error $e');

      }
    }
    if (event is ChangePickedColor) {
      yield state.rebuild((b) =>
      b
        ..PickedColor = event.PickedColor
      );
    }
  }
}


