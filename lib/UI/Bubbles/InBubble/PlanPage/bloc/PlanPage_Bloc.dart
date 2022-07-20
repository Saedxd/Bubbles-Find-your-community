
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Event.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_state.dart';
import 'package:bubbles/UI/DirectMessages/MessageModel/MessageModel.dart';



import 'dart:ui' as ui;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker_updates.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;


class PlanPageBloc extends Bloc<PlanPageEvent, PlanPageState> {


  IRepository _repository;


  PlanPageBloc(this._repository) : super(PlanPageState.initail()) ;

  @override
  PlanPageState get initialState => PlanPageState.initail();

  @override
  Stream<PlanPageState> mapEventToState(
      PlanPageEvent event,
      ) async* {


    if (event is GetDetailedPlan) {
      //try{
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success= false
          ..GetDetailedPlann=null
        );


        final date = await _repository.GetEventDetails(event.Event_id!);
        print(date);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
          ..GetDetailedPlann.replace(date)
        );



      // } catch (e) {
      //   print('get Error $e');
      //   yield state.rebuild((b) => b
      //     ..isLoading = false
      //     ..error = "Something Went Wrong"
      //     ..success= false
      //     ..GetDetailedPlann = null
      //   );
      // }
    }

    if (event is GetProfile){
     //try {

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
      // } catch (e) {
      //   print('get Error $e');
      //   yield state.rebuild((b) => b
      //     ..isLoading = false
      //     ..error = "Something went wrong"
      //     ..success = false
      //     ..ProfileDate = null
      //   );
      // }
    }

    if (event is ToggleSaveBubble) {
      try {

        // yield state.rebuild((b) =>
        // b ..ToggleSaveIsloading = true  );
        //    state.SavedBubbleList!.removeAt(event.index!);
        final date = await _repository.SaveBubble(event.Bubble_id!);

        yield state.rebuild((b) =>
        b
        //..ToggleSaveIsloading = false
          ..SaveBubble.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..SaveBubble = null
        );
      }
    }
    if (event is GetWhoSavedBubble) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
        );

        final date = await _repository.GetWhoSavedBubble(event.Bubble_id!);

        yield state.rebuild((b) =>
        b   ..isLoading = false
          ..error = ""
          ..success = true
          ..GetWhoSavedBubbles.replace(date)
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
  }
}


