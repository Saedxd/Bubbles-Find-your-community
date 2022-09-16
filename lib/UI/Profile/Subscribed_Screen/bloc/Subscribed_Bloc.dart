import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Subscribed_event.dart';
import 'Subscribed_state.dart';


class SubscribedBloc extends Bloc<SubscribedEvent, SubscribedState> {

  IRepository _repository;


  SubscribedBloc(this._repository) : super(SubscribedState.initail()) ;

  @override
  SubscribedState get initialState => SubscribedState.initail();

  @override
  Stream<SubscribedState> mapEventToState(
      SubscribedEvent event,
      ) async* {


    // if (event is AddFrined) {
    //   try {
    //     yield state.rebuild((b) => b
    //       ..FreindAddlOADING = true
    //       ..error = ""
    //       ..AddFreindSuccess = false
    //       ..AddNewFriend = null
    //     );
    //
    //     final date = await _repository.AddFriend(event.serial!);
    //
    //     print('get Success data ${date}');
    //     yield state.rebuild((b) =>
    //     b
    //       ..FreindAddlOADING = false
    //       ..error = ""
    //       ..AddFreindSuccess = true
    //       ..AddNewFriend.replace(date)
    //     );
    //   } catch (e) {
    //     print('get Error $e');
    //     yield state.rebuild((b) =>
    //     b
    //       ..FreindAddlOADING = false
    //       ..error = "Something went wrong"
    //       ..AddFreindSuccess = false
    //       ..AddNewFriend = null
    //     );
    //   }
    // }



  }
}

