// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';

import 'FriendRequest_event.dart';
import 'FriendRequest_state.dart';


class FriendRequestBloc extends Bloc<FriendRequestEvent, FreindRequestState> {

  IRepository _repository;

  FriendRequestBloc(this._repository) : super(FreindRequestState.initail()) ;

  @override
  FreindRequestState get initialState => FreindRequestState.initail();

  @override
  Stream<FreindRequestState> mapEventToState(
      FriendRequestEvent event,
      ) async* {


    if (event is Toggle) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is FreindsRequests) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..FreindRequests = null
        );

        final date = await _repository.FreindRequests();


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..FreindRequests.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..FreindRequests = null
        );
      }
    }

    if (event is DenyRequest) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..DenyFriendRequest=null
        );

        final date = await _repository.DenyRequest(event.friend_id!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..DenyFriendRequest.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..DenyFriendRequest=null
        );
      }
    }

    if (event is AceeptRequest) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..AceeptRequest = null
        );

        final date = await _repository.AceeptRequest(event.friend_id!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..AceeptRequest.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..AceeptRequest = null
        );
      }
    }


  }
}
