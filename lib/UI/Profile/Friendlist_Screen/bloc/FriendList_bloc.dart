// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';

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
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetFriends.replace(date)

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
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..RemoveFriend = null
        );

        final date = await _repository.RemoveFriend(event.friend_id!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..RemoveFriend.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..RemoveFriend = null
        );
      }
    }

  }
}
