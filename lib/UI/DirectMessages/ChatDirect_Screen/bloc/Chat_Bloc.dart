
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Event.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';

import 'dart:ui' as ui;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker_updates.dart';



class ChatBloc extends Bloc<ChatEvent, ChatState> {


  IRepository _repository;


  ChatBloc(this._repository) : super(ChatState.initail()) ;

  @override
  ChatState get initialState => ChatState.initail();

  @override
  Stream<ChatState> mapEventToState(
      ChatEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetOldMessages) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success= false
          ..OldMessages=null
        );

        final date = await _repository.GetOldMessages(event.receiver_id!);
        print(date);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
          ..OldMessages.replace(date)
        );





      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something Went Wrong"
          ..success= false
          ..OldMessages = null
        );
      }
    }

    if (event is GetAlias) {
      try {
        yield state.rebuild((b) => b
          ..AliasISLoading = true
          ..error = ""
          ..AliasISsuccess= false
          ..GetAlias=null
        );

        final date = await _repository.GetAlias(event.ID!);
        print(date);

        yield state.rebuild((b) => b
          ..AliasISLoading = false
          ..error = ""
          ..AliasISsuccess= true
          ..GetAlias.replace(date)
        );





      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..AliasISLoading = false
          ..error = ""
          ..AliasISsuccess= false
          ..GetAlias = null
        );
      }
    }

    if (event is SendMessage) {
      try {

        final date = await _repository.PostMessage(event.message!, event.receiver_id!);
        print(date);

        yield state.rebuild((b) => b
          ..PostMessages.replace(date)
        );


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Message Didn't go through"
          ..success= true
          ..PostMessages = null
        );
      }
    }

    if (event is Done) {
      try {
        yield state.rebuild((b) => b
          ..Done = b.Done
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something Went Wrong"
          ..success= true
          ..OldMessages = null
        );
      }
    }

    if (event is ShowReplyWidget) {
      try {


        yield state.rebuild((b) => b
          ..AvatarPathForRepliedTo = event.AvatarPathForRepliedTo
            ..RepliedToMessage = event.RepliedToMessage
            ..ColorForRepliedTo = event.ColorForRepliedTo
          ..AliasForRepliedTo = event.AliasForRepliedTo
            ..Isreply = event.Isreply
        );


      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is SendStatus) {
      try {
        yield state.rebuild((b) => b
          ..Status = event.Status
        );


      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is addReply) {
      try {
        final date = await _repository.AddReply(event.comment!,event.message_id!);
        print(date);

        yield state.rebuild((b) => b
          ..Addreply.replace(date)
        );





      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..Addreply = null
        );
      }
    }
  }


}


