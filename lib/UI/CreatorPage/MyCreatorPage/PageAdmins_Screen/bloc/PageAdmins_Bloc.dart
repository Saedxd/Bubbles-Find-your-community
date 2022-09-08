
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_State.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_State.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/data/data.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class PageAdminsBloc extends Bloc<PageAdminsEvent, PageAdminsState> {


  IRepository _repository;

  PageAdminsBloc(this._repository) : super(PageAdminsState.initail()) ;

  @override
  PageAdminsState get initialState => PageAdminsState.initail();

  @override
  Stream<PageAdminsState> mapEventToState(
      PageAdminsEvent event,
      ) async* {

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
        );
      }
    }

    if (event is Change_Chosen_frineds) {
      try {
        yield state.rebuild((b) => b
          ..ChooseFrined_isLoading = true

        );
        //
        yield state.rebuild((b) => b
          ..Chosen_Frineds![event.Index!] = event.Status!

        );

        yield state.rebuild((b) => b
          ..ChooseFrined_isLoading = false

        );
      } catch (e) {
        print('get Error $e');

      }
    }
  }
}


