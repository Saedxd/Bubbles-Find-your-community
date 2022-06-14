import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'QrScreen_event.dart';
import 'QrScreen_state.dart';


class QrScreenBLoc extends Bloc<QrScreenEvent, QrScreenState> {

  IRepository _repository;


  QrScreenBLoc(this._repository) : super(QrScreenState.initail()) ;

  @override
  QrScreenState get initialState => QrScreenState.initail();

  @override
  Stream<QrScreenState> mapEventToState(
      QrScreenEvent event,
      ) async* {



    if (event is AddfriendWithQr) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..FreindAdded = false
        ..AddFreindBarCode=null
        );

        final date = await _repository.AddFreindWithBarCode(event.serial!);

        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..FreindAdded = true
          ..AddFreindBarCode.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..FreindAdded = false
          ..AddFreindBarCode=null
        );
      }
    }



  }
}

