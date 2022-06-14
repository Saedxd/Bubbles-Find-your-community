import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'VerifyProfile_event.dart';
import 'VerifyProfile_state.dart';

class VerifyProfileBloc extends Bloc<VerifyProfileEvent, VerifyProfileState> {

  IRepository _repository;


  VerifyProfileBloc(this._repository) : super(VerifyProfileState.initail()) ;

  @override
  VerifyProfileState get initialState => VerifyProfileState.initail();

  @override
  Stream<VerifyProfileState> mapEventToState(
      VerifyProfileEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }
    if (event is ChangeDone) {
      yield state.rebuild((b) => b
        ..Done = !b.Done!

      );
    }

 //AddImages
    if (event is AddImages) {
      try {
        yield state.rebuild((b) => b
        ..success = false
          ..isLoading = true
          ..error = ""
          ..VerifyProfile =null
        );

         final date = await _repository.VerifyProfile(event.image2!, event.image1!);

         print('get Success data ${date}');
        yield state.rebuild((b) => b
          ..error = ""
          ..isLoading = false
          ..success = true
          ..VerifyProfile.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
        ..isLoading = false
          ..success = false
          ..error = "Something went wrong"
          ..VerifyProfile =null
        );
      }
    }


  }
}

