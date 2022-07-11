import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/Data/Data.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'GroupChat_event.dart';
import 'GroupChat_state.dart';


class GroupChatBloc extends Bloc<GroupChatevent, GroupChatState> {
  IRepository _repository;

  GroupChatBloc(this._repository) : super(GroupChatState.initail()) ;

  @override
  GroupChatState get initialState => GroupChatState.initail();

  void sendMessage(String message,String type,int bubble_id,int Message_id) {
    socket!.emit("send_dm_to_bubble",
        {
          "message":message,
          "room":"bubble_$bubble_id",
          "type":type,
          "message_id":Message_id,
        });
  }



  void sendReply(
      String message,
      String Comment,
      int Replymessage_id,
      int bubble_id,
      String RepliedToAlias,
      String RepliedToAvatar
      ,String RepliedtoColor
      ,String type
      ){


    socket!.emit("send_reply_dm_bubble", {
      "message": message.toString(),
      "comment": Comment,
      "room": "bubble_${bubble_id}",
      "message_id": Replymessage_id,
      "HisAlias": RepliedToAlias,
      "Hisavatar": RepliedToAvatar,
      "Hiscolor": "${RepliedtoColor}${type}",
    });


  }





  @override
  Stream<GroupChatState> mapEventToState(
      GroupChatevent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is KetbaordStatus) {
      yield state.rebuild((b) => b
        ..KetbaordStatuss = event.status
      );
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

    if (event is ShowReplyWidget) {
      try {


        yield state.rebuild((b) => b
          ..AvatarPathForRepliedTo = event.AvatarPathForRepliedTo
          ..RepliedToMessage = event.RepliedToMessage
          ..ColorForRepliedTo = event.ColorForRepliedTo
          ..AliasForRepliedTo = event.AliasForRepliedTo
          ..Isreply = event.Isreply
            ..type = event.Type
            ..Image1 = event.Image1
            ..File_image = event.File_image
            ..Image_type = event.Image_type
            // ..is_Backend = event.is_Backend
            // ..is_Nodejs = event.is_Nodejs
            // ..is_base64 = event.Is_base64
        );




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
          ..GetAliasMinee=null
        );

       // final date1 = await _repository.GetAlias(event.HIS_ID!);
        final date2 = await _repository.GetAlias(event.My_ID!);



        yield state.rebuild((b) => b
          ..AliasISLoading = false
          ..error = ""
          ..AliasISsuccess= true
          ..GetAliasMinee.replace(date2)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..AliasISLoading = false
          ..error = ""
          ..AliasISsuccess= false
          ..GetAliasMinee = null
        );
      }
    }

    if (event is GetAliasForInsideUser) {
      try {
        yield state.rebuild((b) => b
          ..UserINbubbleAliasISLoading = true
          ..error = ""
          ..UserINbubbleAliasISsuccess= false
          ..GetAliasForInsideBubbleUser=null
        );

        final date2 = await _repository.GetAlias(event.User_id!);



        yield state.rebuild((b) => b
          ..UserINbubbleAliasISLoading = true
          ..error = ""
          ..UserINbubbleAliasISsuccess= false
          ..GetAliasForInsideBubbleUser.replace(date2)
        );

        UserDATA User =UserDATA();
        User.id = state.GetAliasForInsideBubbleUser!.friend!.id;
        User.Avatar = state.GetAliasForInsideBubbleUser!.friend!.avatar.toString();
        User.Background_Color = state.GetAliasForInsideBubbleUser!.friend!.background_color.toString();
        User.Alias = state.GetAliasForInsideBubbleUser!.friend!.alias.toString();
        state.User!.add(User);

        yield state.rebuild((b) => b
          ..UserINbubbleAliasISLoading = false
          ..error = ""
          ..UserINbubbleAliasISsuccess= true
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..UserINbubbleAliasISLoading = false
          ..error = ""
          ..UserINbubbleAliasISsuccess= false
          ..GetAliasForInsideBubbleUser=null
        );
      }
    }

    // if (event is AddUserDataToList) {
    //   try {
    //
    //
    //
    //   } catch (e) {
    //     print('get Error $e');
    //   }
    // }


    if (event is DescriptionLength) {
      try {
        yield state.rebuild((b) => b
          ..DescriptionLength = event.DescriptionLengthh
        );

      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is ChangeCheckboxStatus1) {
      try {
        yield state.rebuild((b) => b
          ..CheckboxStatuss1 = event.CheckboxStatus1
        );

      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is ChangeCheckboxStatus2) {
      try {
        yield state.rebuild((b) => b
          ..CheckboxStatuss2 = event.CheckboxStatus2
        );

      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is ChangeTextfieldSum) {
      try {
        yield state.rebuild((b) => b
          ..TextfieldSum =b.TextfieldSum! + event.num!
        );
      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is MakeTextFieldSumToNormal) {
      try {
        yield state.rebuild((b) => b
          ..TextfieldSum =2
        );
      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is GetOldMessages) {
      try {
        yield state.rebuild((b) => b
          ..error = ""
          ..success= false
          ..isLoading = true
        );


        final date2 = await _repository.GetEventMessages(event.bubble_id!);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= false
          ..EventOldMessages.replace(date2)
        );



        for (int i = 0;i<state.EventOldMessages!.messages!.length;i++){
          GroupChatMessage InstanceMessages = GroupChatMessage();
          InstanceMessages.ISNOdeJS = false;
          InstanceMessages.IsBackEnd = true;
          InstanceMessages.is_base64 = false;
          if (state.EventOldMessages!.messages![i].replies!.isEmpty) {

            if (state.EventOldMessages!.messages![i].message!.type.toString()=="text"){

              InstanceMessages.ISreply = false;
              InstanceMessages.ModelType = "Message";
              InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();
              InstanceMessages.Type =
                  state.EventOldMessages!.messages![i].type.toString();

              InstanceMessages.Alias =
                  state.EventOldMessages!.messages![i].message!.sender_name.toString();
              InstanceMessages.Avatar =
                  state.EventOldMessages!.messages![i].message!.sender_image.toString();
              String Value = "";
              Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;


              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color = BackgroundColor;
              InstanceMessages.message =
                  state.EventOldMessages!.messages![i].message!.message.toString();

              DateTime datee = DateTime.parse(
                  state.EventOldMessages!.messages![i].message!.CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);

            }
            if (state.EventOldMessages!.messages![i].message!.type.toString()=="audio") {
              InstanceMessages.ISreply = false;
              InstanceMessages.ModelType ="Voice";
              InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();
              InstanceMessages.Type =
                  state.EventOldMessages!.messages![i].type.toString();

              InstanceMessages.Alias =
                  state.EventOldMessages!.messages![i].message!.sender_name.toString();
              InstanceMessages.Avatar =
                  state.EventOldMessages!.messages![i].message!.sender_image.toString();
              String Value = "";
              Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;


              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color = BackgroundColor;
              InstanceMessages.message =
                  state.EventOldMessages!.messages![i].message!.message.toString();

              DateTime datee = DateTime.parse(
                  state.EventOldMessages!.messages![i].message!.CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);

            }
            if (state.EventOldMessages!.messages![i].message!.type.toString()=="image") {
              InstanceMessages.ISreply = false;
              InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();
              InstanceMessages.ModelType ="Image";
              InstanceMessages.Image_type = "Backend";


              InstanceMessages.Type =
                  state.EventOldMessages!.messages![i].type.toString();

              InstanceMessages.Alias =
                  state.EventOldMessages!.messages![i].message!.sender_name.toString();
              InstanceMessages.Avatar =
                  state.EventOldMessages!.messages![i].message!.sender_image.toString();
              String Value = "";
              Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;


              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color = BackgroundColor;
              InstanceMessages.message =
                  state.EventOldMessages!.messages![i].message!.message.toString();
              print(InstanceMessages.message);

              DateTime datee = DateTime.parse(
                  state.EventOldMessages!.messages![i].message!.CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);
            }


          }else{

              if (state.EventOldMessages!.messages![i].message!.type.toString()=="text") {
                InstanceMessages.ISreply = true;
                InstanceMessages.Type = state.EventOldMessages!.messages![i].type.toString();
                InstanceMessages.ModelType = "ReplyMessage";
                InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();


                String Value = state.EventOldMessages!.messages![i].message!.sender_background_color.toString();

                var myInt = int.parse(Value);
                var BackgroundColor = myInt;



                InstanceMessages.RepliedTOAlias =      state.EventOldMessages!.messages![i].message!.sender_name.toString();
                InstanceMessages.RepliedTOMessage =  state.EventOldMessages!.messages![i].message!.message.toString();
                InstanceMessages.RepliedTOAvatar =    state.EventOldMessages!.messages![i].message!.sender_image.toString();
                InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



                String Value2 = state.EventOldMessages!.messages![i].replies![0].background.toString();
                var myInt2 = int.parse(Value2);
                var BackgroundColor2 = myInt2;

                InstanceMessages.ReplierAlias = state.EventOldMessages!.messages![i].replies![0].alias.toString();
                InstanceMessages.ReplierMessage = state.EventOldMessages!.messages![i].replies![0].comment.toString();
                InstanceMessages.ReplierAvatar =  state.EventOldMessages!.messages![i].replies![0].avatar.toString();
                InstanceMessages.Replierbackground_Color =BackgroundColor2;

                DateTime datee2 = DateTime.parse( state.EventOldMessages!.messages![i].replies![0].CreatAt.toString());

                InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
              }
              if (state.EventOldMessages!.messages![i].message!.type.toString()=="audio") {
                InstanceMessages.ISreply = true;
                InstanceMessages.Type = state.EventOldMessages!.messages![i].type.toString();
                InstanceMessages.ModelType = "ReplyVoice";
                InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();


                String Value = state.EventOldMessages!.messages![i].message!.sender_background_color.toString();

                var myInt = int.parse(Value);
                var BackgroundColor = myInt;



                InstanceMessages.RepliedTOAlias =      state.EventOldMessages!.messages![i].message!.sender_name.toString();
                InstanceMessages.RepliedTOMessage =  state.EventOldMessages!.messages![i].message!.message.toString();
                InstanceMessages.RepliedTOAvatar =    state.EventOldMessages!.messages![i].message!.sender_image.toString();
                InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



                String Value2 = state.EventOldMessages!.messages![i].replies![0].background.toString();
                var myInt2 = int.parse(Value2);
                var BackgroundColor2 = myInt2;

                InstanceMessages.ReplierAlias = state.EventOldMessages!.messages![i].replies![0].alias.toString();
                InstanceMessages.ReplierMessage = state.EventOldMessages!.messages![i].replies![0].comment.toString();
                InstanceMessages.ReplierAvatar =  state.EventOldMessages!.messages![i].replies![0].avatar.toString();
                InstanceMessages.Replierbackground_Color =BackgroundColor2;

                DateTime datee2 = DateTime.parse( state.EventOldMessages!.messages![i].replies![0].CreatAt.toString());

                InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
              }
              if (state.EventOldMessages!.messages![i].message!.type.toString()=="image") {
                InstanceMessages.ISreply = true;
                InstanceMessages.ModelType = "ReplyImage";
                InstanceMessages.Type = state.EventOldMessages!.messages![i].type.toString();
                InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();
                InstanceMessages.Image_type = "Backend";

                String Value = state.EventOldMessages!.messages![i].message!.sender_background_color.toString();

                var myInt = int.parse(Value);
                var BackgroundColor = myInt;



                InstanceMessages.RepliedTOAlias =      state.EventOldMessages!.messages![i].message!.sender_name.toString();
                InstanceMessages.RepliedTOMessage =  state.EventOldMessages!.messages![i].message!.message.toString();
                InstanceMessages.RepliedTOAvatar =    state.EventOldMessages!.messages![i].message!.sender_image.toString();
                InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



                String Value2 = state.EventOldMessages!.messages![i].replies![0].background.toString();
                var myInt2 = int.parse(Value2);
                var BackgroundColor2 = myInt2;

                InstanceMessages.ReplierAlias = state.EventOldMessages!.messages![i].replies![0].alias.toString();
                InstanceMessages.ReplierMessage = state.EventOldMessages!.messages![i].replies![0].comment.toString();
                InstanceMessages.ReplierAvatar =  state.EventOldMessages!.messages![i].replies![0].avatar.toString();
                InstanceMessages.Replierbackground_Color =BackgroundColor2;

                DateTime datee2 = DateTime.parse( state.EventOldMessages!.messages![i].replies![0].CreatAt.toString());

                InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
              }


          }

          state.messages!.add(InstanceMessages);
          // print("Added");
          // print(InstanceMessages.message);


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
          ..error = "something went wrong"
          ..success= false
          ..GetAliasMinee = null
        );
      }
    }

    if (event is SendMessage) {
     try {
        yield state.rebuild((b) => b
          ..error = ""
          ..SendMessageISloading= true
          ..SendMessageSuccess = false
            ..SendBubbleMessage = null
        );



        final date2 = await _repository.SendMessageEVENT(event.type!, event.message!, event.bubble_id!, event.main_type!);

        yield state.rebuild((b) => b
          ..error = ""
          ..SendMessageISloading= false
          ..SendMessageSuccess = true
          ..SendBubbleMessage.replace(date2)
        );

       state.messages![0].ID = state.SendBubbleMessage!.message_id!.toInt();
        // print( state.messages![0].ID);
        // print( state.messages![0].Avatar);
        // print( state.messages![0].message);



        sendMessage(event.message!,
            event.type!,event.bubble_id!, state.SendBubbleMessage!.message_id!.toInt());

print("Emitteddd");



      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..SendMessageISloading= false
          ..SendMessageSuccess = false
          ..SendBubbleMessage = null
        );

      }
    }

    if (event is addReply) {
        String base64String;
        String BACKEND_PATH="";
        File? file;
        base64String = "";

        // is_node
        //       ? InstanceMessages.Image1 = Image122
        //       : is_backend
        //       ? InstanceMessages.message = path
        //       : InstanceMessages.Image2 = filee;



          if (event.type.toString()=="Uint8List") {
            print("2");
            base64String = base64Encode(event.Uint8!);


            print(base64String);
          } else if (event.type.toString()=="File"){
            print("4");
            file = event.File_file!;
            print(file);
            Uint8List bytes = file.readAsBytesSync();
            base64String = base64Encode(bytes);
          }else if (event.type.toString()=="Backend"){
            print("4");
            BACKEND_PATH  = event.Message!;
          }






        print(base64String);
        print("base64String");

          sendReply(
              base64String.isNotEmpty
                        ?base64String
                        :BACKEND_PATH,
              event.comment!,
              event.message_id!.toInt(),
              event.Bubble_id!,
              event.RepliedToAlias!,
              event.RepliedToAvatar!,
              event.RepliedToColor!,
                   event.type!
          );



        final date2 = await _repository.SendReplyMessageEVENT(event.comment!, event.message_id!);

        yield state.rebuild((b) => b
          ..SendBubbleReply.replace(date2)
        );

        // state.messages![0].ID = state.SendBubbleReply!.message_id!.toInt();




        print("Emitteddd");
    }


    if (event is GetUsersInsideBubble) {

      try {
        yield state.rebuild((b) => b
          ..GetInsideUsersISloading=true
          ..GetInsideUsersSuccess=false
          ..GetUsersInsideBubble=null
        );


        final date2 = await _repository.GetUsersInsideBubble(event.Bubble_id!);


        yield state.rebuild((b) => b
          ..GetUsersInsideBubble.replace(date2)
        );

        state.FilteredInsideBubbleUsers!.clear();
        state.InsideBubbleUsers!.clear();
        for(int i=0;i<state.GetUsersInsideBubble!.users!.length;i++){


          UserDATA User =UserDATA();
          User.id = state.GetUsersInsideBubble!.users![i].id!;
          User.Avatar = state.GetUsersInsideBubble!.users![i].avatar.toString();
          User.Background_Color = state.GetUsersInsideBubble!.users![i].background_color.toString();
          User.Alias = state.GetUsersInsideBubble!.users![i].alias.toString();
          User.Serial_number = state.GetUsersInsideBubble!.users![i].serialnumber.toString();
          User.boi = state.GetUsersInsideBubble!.users![i].bio.toString();
          User.is_frined = state.GetUsersInsideBubble!.users![i].is_friend;
          User.Serial = state.GetUsersInsideBubble!.users![i].serial.toString();


          String Value = state.GetUsersInsideBubble!.users![i].background_color.toString();

          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          User.Background_Color = Value;

          state.FilteredInsideBubbleUsers!.add(User);
          state.InsideBubbleUsers!.add(User);
        }
        yield state.rebuild((b) => b
          ..GetInsideUsersISloading=false
          ..GetInsideUsersSuccess=true
        );


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b

        );
      }








    }

    if (event is SearchInsideBubbleUser) {

      try {
        state.FilteredInsideBubbleUsers!.clear();


        state.InsideBubbleUsers!.forEach((BubbbleOBject) {
          if (BubbbleOBject.Alias!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
            state.FilteredInsideBubbleUsers!.add(BubbbleOBject);
          }
        });

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b

        );
      }








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
    if (event is RemoveFriend) {
      try {

        final date = await _repository.RemoveFriend(event.friend_id!);




      } catch (e) {
        print('get Error $e');
      }
    }
  }

}

//todo : when user joins bubble send his id to all memebers
// then when they all get it store it and call request to get his data (alias/color)
// then store his data(color/avatar) in class model then
// when you recieve a message from listener make a for loop on all id's
// and know which id comes from listener matches the id you have then if it matches get his avatar and color and place it