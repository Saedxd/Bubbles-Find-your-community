import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'FindFriends_event.dart';
import 'FindFriends_state.dart';

final FindBLOC = sl<FindFriends>();
class FindFriends extends Bloc<FindFriendsEvent, FindFriendsState> {

  IRepository _repository;


  FindFriends(this._repository) : super(FindFriendsState.initail()) ;

  @override
  FindFriendsState get initialState => FindFriendsState.initail();

  @override
  Stream<FindFriendsState> mapEventToState(
      FindFriendsEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetContactList) {

      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
        );
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
        );


        PermissionStatus statuses = await
        Permission.contacts.request();
        print(statuses);
        if (statuses == PermissionStatus.granted) {
          print(statuses);
          List<Contact>? contacts;
          List<String>? Eamils;


            contacts = (await ContactsService.getContacts(
                withThumbnails: false)).toList();

            yield state.rebuild((b) => b
              ..isLoading = false
              ..error = ""
              ..success = true
              ..contacts = contacts
            );
          print(state.success);

        }
        else if (statuses == PermissionStatus.denied){
         // print("1");
          yield state.rebuild((b) => b
            ..isLoading = false
            ..error = "Access denied Please Allow Contact Service"
            ..success = true
            ..contacts = []
          );

        }
        else{
          print("2");
          yield state.rebuild((b) => b
            ..isLoading = false
            ..error = "Access not Granted"
            ..success = false
            ..contacts = []
          );
        }


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
            ..contacts = []


        );
      }
    }

    if (event is OpenCopyMessage) {
      yield state.rebuild((b) => b
        ..ISCopyMessage = true
          ..CopyMessageOpened = true
      );
    }

    if (event is CloseCopyMessage) {
        print("Called");
        yield state.rebuild((b) => b
          ..ISCopyMessage = false
          ..CopyMessageOpened = false
        );

    }

    if (event is OpenContactMessage) {
      yield state.rebuild((b) => b
        ..IsContactLoadedd = true

      );
    }

    if (event is CloseContactMessage) {
      print("Called");
      yield state.rebuild((b) => b
        ..IsContactLoadedd = false
      );
    }

    if (event is OpenCompletMessage) {
      yield state.rebuild((b) => b
        ..IsCompletMessage = true

      );
    }

    if (event is CloseCompletMessage) {
      print("Called");
      yield state.rebuild((b) => b
        ..IsCompletMessage = false
      );
    }

    if (event is AddFrined) {
      try {
        yield state.rebuild((b) => b
          ..FreindAddlOADING = true
          ..error = ""
          ..AddFreindSuccess = false
          ..AddNewFriend = null
        );

        final date = await _repository.AddFriend(event.serial!);

        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..FreindAddlOADING = false
          ..error = ""
          ..AddFreindSuccess = true
          ..AddNewFriend.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..FreindAddlOADING = false
          ..error = "Something went wrong"
          ..AddFreindSuccess = false
          ..AddNewFriend = null
        );
      }
    }

    if (event is GetProfile){
      try {

        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..ProfileDate = null
        );

        final date = await _repository.GetProfile();
        print('get Success data $date');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..ProfileDate.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..ProfileDate = null
        );
      }
    }


  }
}

