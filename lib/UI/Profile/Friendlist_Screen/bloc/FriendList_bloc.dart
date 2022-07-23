// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';

import 'FriendList_event.dart';
import 'FriendList_state.dart';


class FriendListBloc extends Bloc<FriendListEvent, FriendListState> {

  IRepository _repository;

  FriendListBloc(this._repository) : super(FriendListState.initail()) ;

  @override
  FriendListState get initialState => FriendListState.initail();

  @override
  Stream<FriendListState> mapEventToState(
      FriendListEvent event,
      ) async* {


    if (event is Toggle) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is IsRefresh) {
      yield state.rebuild((b) => b
        ..IsRefresh = !b.IsRefresh!);
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


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetFriends.replace(date)

        );


        for(int i=0;i<state.GetFriends!.friends!.length;i++) {
          FrinedsData data = FrinedsData();
          data.Color = state.GetFriends!.friends![i].background_color!;
          data.ID = state.GetFriends!.friends![i].id;
          data.my_id = state.GetFriends!.friends![i].me_id;
          data.Alias = state.GetFriends!.friends![i].alias;
          data.Avatar = state.GetFriends!.friends![i].avatar;

         state.FrinedList!.add(data);

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
    if (event is RefreshState) {
      try {
        yield state.rebuild((b) =>
        b
          ..ChangeStateLoading = true
          ..ChangeStateSuccess = false
        );

        yield state.rebuild((b) =>
        b
          ..ChangeStateLoading = false
          ..ChangeStateSuccess = true
        );



      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is RemoveFriend) {
      try {



        state.FrinedList!.removeAt(event.index!);
        final date = await _repository.RemoveFriend(event.friend_id!);



      } catch (e) {
        print('get Error $e');
      }
    }

  }
}
