
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Event.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_state.dart';
import 'package:bubbles/UI/DirectMessages/MessageModel/MessageModel.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';

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
     //   print(date);

        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success= false
          ..OldMessages.replace(date)
        );



        for (int i = 0;i<state.OldMessages!.messages!.length;i++){
            MessageModel InstanceMessages = MessageModel();
            if (state.OldMessages!.messages![i].replies!.isEmpty) {
              InstanceMessages.ISreply = false;
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
              InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
              print("index :${i}");
              print("ID :${InstanceMessages.ID}");
              print("Type : ${state.OldMessages!.messages![i].type.toString()} ");
              print("");
              InstanceMessages.Alias =
                  state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.Avatar =
                  state.OldMessages!.messages![i].sender_image.toString();
              String Value = "";
              Value =state.OldMessages!.messages![i].sender_background_color!;



              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color =BackgroundColor;
              InstanceMessages.message =
                  state.OldMessages!.messages![i].message.toString();

              DateTime datee = DateTime.parse(
                  state.OldMessages!.messages![i].CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);
              InstanceMessages.Type =   state.OldMessages!.messages![i].type.toString();
            }
            if (state.OldMessages!.messages![i].replies!.isNotEmpty){
              InstanceMessages.ISreply = true;
              InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
              print("index :${i}");
              print("ID :${InstanceMessages.ID}");
              print("Type : ${state.OldMessages!.messages![i].type.toString()} ");
              print("");

              String Value = state.OldMessages!.messages![i].sender_background_color.toString();

              var myInt = int.parse(Value);
              var BackgroundColor = myInt;



              InstanceMessages.RepliedTOAlias =        state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.RepliedTOMessage =   state.OldMessages!.messages![i].message.toString();
              InstanceMessages.RepliedTOAvatar =   state.OldMessages!.messages![i].sender_image.toString();
              InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



              String Value2 =state.OldMessages!.messages![i].replies![0].background.toString();
              var myInt2 = int.parse(Value2);
              var BackgroundColor2 = myInt2;

              InstanceMessages.ReplierAlias = state.OldMessages!.messages![i].replies![0].alias.toString();
              InstanceMessages.ReplierMessage = state.OldMessages!.messages![i].replies![0].comment.toString();
              InstanceMessages.ReplierAvatar = state.OldMessages!.messages![i].replies![0].avatar.toString();
              InstanceMessages.Replierbackground_Color =BackgroundColor2;

              DateTime datee2 = DateTime.parse(state.OldMessages!.messages![i].replies![0].CreatAt.toString());

              InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
            }

            state.messages!.add(InstanceMessages);


          }


        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
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
    if (event is AddModel) {
      try {
          yield state.rebuild((b) => b
            ..isLoading = true
            ..error = ""
            ..success= false
          );

          state.messages!.insert(0,event.message!);


          yield state.rebuild((b) => b
            ..success= true
            ..isLoading = false
          );
     //   print(state.messages![state.messages!.length-1].message);



      } catch (e) {
        print('get Error $e');

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

        final date1 = await _repository.GetAlias(event.HIS_ID!);
     final date2 = await _repository.GetAlias(event.My_ID!);



        yield state.rebuild((b) => b
          ..AliasISLoading = false
          ..error = ""
          ..AliasISsuccess= true
          ..GetAlias.replace(date1)
        ..GetAliasMinee.replace(date2)
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
    //    print(date);

        yield state.rebuild((b) => b
          ..PostMessages.replace(date)
        );


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Message Didn't go through"
          ..success= false
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
          ..success= false
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
      //  print(date);


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

    if (event is ChangeTypingStatus){
      yield state.rebuild((b) => b
        ..typingStatusISloading = true
          ..TypingStatusSuccess = false
      );
      yield state.rebuild((b) => b
        ..TypingStatus = event.ChangeStatus
      );

      yield state.rebuild((b) => b
        ..typingStatusISloading = false
        ..TypingStatusSuccess = true
      );

    }
  }




}


