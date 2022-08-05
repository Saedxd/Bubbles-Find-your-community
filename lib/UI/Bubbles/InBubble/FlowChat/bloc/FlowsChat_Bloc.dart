import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/Data/Data.dart';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/bloc/FlowsChat_event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/bloc/FlowsChat_state.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:intl/intl.dart';




class FlowsBloc extends Bloc<FlowsChatEvent, FlowsChatState> {
  IRepository _repository;

  FlowsBloc(this._repository) : super(FlowsChatState.initail()) ;

  @override
  FlowsChatState get initialState => FlowsChatState.initail();
//emit => send_topic_to_bubble
// listen => receive_topic_message_send
// دي رسائل من النوع  New Topic


  void sendMessage(String message,String type,int bubble_id,int Message_id) {
    socket!.emit("send_dm_to_message_in_bubble",
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


    socket!.emit("reply_on_nested_messages_in_bubble", {
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
  Stream<FlowsChatState> mapEventToState(
      FlowsChatEvent event,
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
    if (event is ShowFloatingActionButton) {

      yield state.rebuild((b) => b
        ..ShowFloatingActionButtonn = event.status!
      );
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


        final date2 = await _repository.GetFlowOldMessages(event.message_id!);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= false
          ..FlowOldMessages.replace(date2)
        );


        for (int i = 0;i<state.FlowOldMessages!.messages!.length;i++){
          GroupChatFlowsMessage InstanceMessages =GroupChatFlowsMessage();
          InstanceMessages.ISNOdeJS = false;
          InstanceMessages.MessageSettledWIthID =true;
          InstanceMessages.IsBackEnd = true;
          InstanceMessages.is_base64 = false;
          InstanceMessages.ID = state.FlowOldMessages!.messages![i].id!.toInt();
          InstanceMessages.Type =  state.FlowOldMessages!.messages![i].type.toString();

          if (state.FlowOldMessages!.messages![i].replies!.isEmpty) {


            InstanceMessages.ISreply = false;
            InstanceMessages.Alias = state.FlowOldMessages!.messages![i].sender_name.toString();
            InstanceMessages.Avatar =  state.FlowOldMessages!.messages![i].sender_image.toString();
            String Value = state.FlowOldMessages!.messages![i].sender_background_color!;
            InstanceMessages.background_Color = int.parse(Value);
            InstanceMessages.message = state.FlowOldMessages!.messages![i].message.toString();
            DateTime datee = DateTime.parse( state.FlowOldMessages!.messages![i].CreatAt.toString());
            InstanceMessages.time = DateFormat.jm().format(datee);



            if (state.FlowOldMessages!.messages![i].type.toString()=="text"){
              InstanceMessages.ModelType = "Message";
            }
            if (state.FlowOldMessages!.messages![i].type.toString()=="audio") {
              InstanceMessages.ModelType ="Voice";
            }
            if (state.FlowOldMessages!.messages![i].type.toString()=="image") {
              InstanceMessages.ModelType ="Image";
              InstanceMessages.Image_type = "Backend";
            }



          }else{
            InstanceMessages.ISreply = true;
            String Value = state.FlowOldMessages!.messages![i].sender_background_color.toString();
            InstanceMessages.RepliedTOAlias =      state.FlowOldMessages!.messages![i].sender_name.toString();
            InstanceMessages.RepliedTOMessage =  state.FlowOldMessages!.messages![i].message.toString();
            InstanceMessages.RepliedTOAvatar =    state.FlowOldMessages!.messages![i].sender_image.toString();
            InstanceMessages.ReplieDtobackground_Color =int.parse(Value);
            String Value2 = state.FlowOldMessages!.messages![i].replies![0].background.toString();
            InstanceMessages.ReplierAlias = state.FlowOldMessages!.messages![i].replies![0].alias.toString();
            InstanceMessages.ReplierMessage = state.FlowOldMessages!.messages![i].replies![0].comment.toString();
            InstanceMessages.ReplierAvatar =  state.FlowOldMessages!.messages![i].replies![0].avatar.toString();
            InstanceMessages.Replierbackground_Color =int.parse(Value2);
            DateTime datee2 = DateTime.parse( state.FlowOldMessages!.messages![i].replies![0].CreatAt.toString());
            InstanceMessages.Repliertime =DateFormat.jm().format(datee2);



              if (state.FlowOldMessages!.messages![i].type.toString()=="text") {
                InstanceMessages.ModelType = "ReplyMessage";
              }
              if (state.FlowOldMessages!.messages![i].type.toString()=="audio") {
                InstanceMessages.ModelType = "ReplyVoice";
              }
              if (state.FlowOldMessages!.messages![i].type.toString()=="image") {
                InstanceMessages.ModelType = "ReplyImage";
                InstanceMessages.Image_type = "Backend";
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
   //  try {
        yield state.rebuild((b) => b
          ..error = ""
          ..SendMessageISloading= true
          ..SendMessageSuccess = false
            ..SendBubbleMessage = null
        );


//(, , event.bubble_id!, event.main_type!);
       final date2 = await _repository.SendMessageInFlows(event.message!, event.type!, event.FlowMessage_Id!);

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



      // } catch (e) {
      //   print('get Error $e');
      //   yield state.rebuild((b) => b
      //     ..SendMessageISloading= false
      //     ..SendMessageSuccess = false
      //     ..SendBubbleMessage = null
      //   );
      //
      // }
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
                  :BACKEND_PATH.isEmpty
                  ?event.Message!
                  :BACKEND_PATH,
              event.comment!,
              event.message_id!.toInt(),
              event.Bubble_id!,
              event.RepliedToAlias!,
              event.RepliedToAvatar!,
              event.RepliedToColor!,
                   event.type!
          );



        final date2 = await _repository.SendReplyInFlows(event.comment!, event.message_id!);

        yield state.rebuild((b) => b
          ..SendBubbleReply.replace(date2)
        );

        // state.messages![0].ID = state.SendBubbleReply!.message_id!.toInt();




        print("Emitteddd");
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


    // if (event is SendTopicFlow) {
    //   try {
    //
    //
    //
    //     final date2 = await _repository.SendTopicFlow(event.Bubble_id!, event.Content!, event.Title!, 4);
    //
    //     yield state.rebuild((b) => b
    //       ..SendBubbleTopicFlow.replace(date2)
    //     );
    //
    //     state.messages![0].ID = state.SendBubbleTopicFlow!.message_id!.toInt();
    //     // print( state.messages![0].ID);
    //     // print( state.messages![0].Avatar);
    //     // print( state.messages![0].message);
    //
    //
    //     // SendTopicFloww(event.message!,
    //     //     event.type!,event.bubble_id!, state.SendBubbleMessage!.message_id!.toInt());
    //
    //     print("Emitteddd");
    //
    //
    //
    //   } catch (e) {
    //     print('get Error $e');
    //     yield state.rebuild((b) => b
    //       ..SendMessageISloading= false
    //       ..SendMessageSuccess = false
    //       ..SendBubbleMessage = null
    //     );
    //
    //   }
    // }

  }

}
