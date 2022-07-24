
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/MessageModel/MessageModel.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;


class SprintsBloc extends Bloc<SprintsEvent, SprintsState> {


  IRepository _repository;

  void sendMessage(String message, String UserDestination_ID,int message_id,String type) {
    print("EMITTTEDDDD $UserDestination_ID");

    socket!.emit("send_message",
        {  "message":"$type$message",
          "to": UserDestination_ID.toString(),
          "message_id":message_id,
        });
  }

  void sendReply(
      String message, int UserDestination_ID, String Comment, String MessageDirection_type,String Message_type) {

    socket!.emit("send_reply", {
      "message": "$Message_type${message.toString()}",
      "to": UserDestination_ID.toString(),
      "comment": Comment,
      "type": MessageDirection_type
    });
    print("Emitted");
  }


  SprintsBloc(this._repository) : super(SprintsState.initail()) ;

  @override
  SprintsState get initialState => SprintsState.initail();

  @override
  Stream<SprintsState> mapEventToState(
      SprintsEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetOldMessages) {

        yield state.rebuild((b) => b
          ..error = ""
          ..success= false
          ..isLoading = true
        );


        final date2 = await _repository.GetOldMessages(event.send_by!,event.receiver_id!);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= false
          ..OldMessages.replace(date2)
        );



        for (int i = 0;i<state.OldMessages!.messages!.length;i++){
          SprintsChat InstanceMessages = SprintsChat();
          InstanceMessages.ISNOdeJS = false;
          InstanceMessages.IsBackEnd = true;
          InstanceMessages.is_base64 = false;
          if (state.OldMessages!.messages![i].replies!.isEmpty) {

            if (state.OldMessages!.messages![i].sms_type=="text"){
              InstanceMessages.ISreply = false;
              InstanceMessages.ModelType = "Message";
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
              InstanceMessages.Type =
                  state.OldMessages!.messages![i].type.toString();

              InstanceMessages.Alias =
                  state.OldMessages!.messages![i].sender_name;
              InstanceMessages.Avatar =
                  state.OldMessages!.messages![i].sender_image.toString();
              String Value = "";
              Value = state.OldMessages!.messages![i].sender_background_color!;


              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color = BackgroundColor;
              InstanceMessages.message =
                  state.OldMessages!.messages![i].message.toString();

              DateTime datee = DateTime.parse(
                  state.OldMessages!.messages![i].CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);

            }
            if (state.OldMessages!.messages![i].sms_type.toString()=="audio") {
              InstanceMessages.ISreply = false;
              InstanceMessages.ModelType ="Voice";
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
              InstanceMessages.Type =
                  state.OldMessages!.messages![i].type.toString();

              InstanceMessages.Alias =
                  state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.Avatar =
                  state.OldMessages!.messages![i].sender_image.toString();
              String Value = "";
              Value = state.OldMessages!.messages![i].sender_background_color!;


              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color = BackgroundColor;
              InstanceMessages.message =
                  state.OldMessages!.messages![i].message.toString();

              DateTime datee = DateTime.parse(
                  state.OldMessages!.messages![i].CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);

            }
            if (state.OldMessages!.messages![i].sms_type.toString()=="image") {
              InstanceMessages.ISreply = false;
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
              InstanceMessages.ModelType ="Image";
              InstanceMessages.Image_type = "Backend";

              InstanceMessages.Type =
                  state.OldMessages!.messages![i].type.toString();

              InstanceMessages.Alias =
                  state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.Avatar =
                  state.OldMessages!.messages![i].sender_image.toString();
              String Value = "";
              Value = state.OldMessages!.messages![i].sender_background_color!;


              var myInt = int.parse(Value);
              int BackgroundColor = myInt;


              InstanceMessages.background_Color = BackgroundColor;
              InstanceMessages.message =
                  state.OldMessages!.messages![i].message.toString();
              print(InstanceMessages.message);

              DateTime datee = DateTime.parse(
                  state.OldMessages!.messages![i].CreatAt.toString());


              InstanceMessages.time = DateFormat.jm().format(datee);
            }


          } else{

            if (state.OldMessages!.messages![i].sms_type.toString()=="text") {
              InstanceMessages.ISreply = true;
              InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
              InstanceMessages.ModelType = "ReplyMessage";
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();


              String Value = state.OldMessages!.messages![i].sender_background_color.toString();

              var myInt = int.parse(Value);
              var BackgroundColor = myInt;



              InstanceMessages.RepliedTOAlias =      state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.RepliedTOMessage =  state.OldMessages!.messages![i].message.toString();
              InstanceMessages.RepliedTOAvatar =    state.OldMessages!.messages![i].sender_image.toString();
              InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



              String Value2 = state.OldMessages!.messages![i].replies![0].background.toString();
              var myInt2 = int.parse(Value2);
              var BackgroundColor2 = myInt2;

              InstanceMessages.ReplierAlias = state.OldMessages!.messages![i].replies![0].alias.toString();
              InstanceMessages.ReplierMessage = state.OldMessages!.messages![i].replies![0].comment.toString();
              InstanceMessages.ReplierAvatar =  state.OldMessages!.messages![i].replies![0].avatar.toString();
              InstanceMessages.Replierbackground_Color =BackgroundColor2;

              DateTime datee2 = DateTime.parse( state.OldMessages!.messages![i].replies![0].CreatAt.toString());

              InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
            }
            if (state.OldMessages!.messages![i].sms_type.toString()=="audio") {
              InstanceMessages.ISreply = true;
              InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
              InstanceMessages.ModelType = "ReplyVoice";
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();


              String Value = state.OldMessages!.messages![i].sender_background_color.toString();

              var myInt = int.parse(Value);
              var BackgroundColor = myInt;



              InstanceMessages.RepliedTOAlias =      state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.RepliedTOMessage =  state.OldMessages!.messages![i].message.toString();
              InstanceMessages.RepliedTOAvatar =    state.OldMessages!.messages![i].sender_image.toString();
              InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



              String Value2 = state.OldMessages!.messages![i].replies![0].background.toString();
              var myInt2 = int.parse(Value2);
              var BackgroundColor2 = myInt2;

              InstanceMessages.ReplierAlias = state.OldMessages!.messages![i].replies![0].alias.toString();
              InstanceMessages.ReplierMessage = state.OldMessages!.messages![i].replies![0].comment.toString();
              InstanceMessages.ReplierAvatar =  state.OldMessages!.messages![i].replies![0].avatar.toString();
              InstanceMessages.Replierbackground_Color =BackgroundColor2;

              DateTime datee2 = DateTime.parse( state.OldMessages!.messages![i].replies![0].CreatAt.toString());

              InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
            }
            if (state.OldMessages!.messages![i].sms_type.toString()=="image") {
              InstanceMessages.ISreply = true;
              InstanceMessages.ModelType = "ReplyImage";
              InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
              InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
              InstanceMessages.Image_type = "Backend";

              String Value = state.OldMessages!.messages![i].sender_background_color.toString();

              var myInt = int.parse(Value);
              var BackgroundColor = myInt;



              InstanceMessages.RepliedTOAlias =      state.OldMessages!.messages![i].sender_name.toString();
              InstanceMessages.RepliedTOMessage =  state.OldMessages!.messages![i].message.toString();
              InstanceMessages.RepliedTOAvatar =    state.OldMessages!.messages![i].sender_image.toString();
              InstanceMessages.ReplieDtobackground_Color =BackgroundColor;



              String Value2 = state.OldMessages!.messages![i].replies![0].background.toString();
              var myInt2 = int.parse(Value2);
              var BackgroundColor2 = myInt2;

              InstanceMessages.ReplierAlias = state.OldMessages!.messages![i].replies![0].alias.toString();
              InstanceMessages.ReplierMessage = state.OldMessages!.messages![i].replies![0].comment.toString();
              InstanceMessages.ReplierAvatar =  state.OldMessages!.messages![i].replies![0].avatar.toString();
              InstanceMessages.Replierbackground_Color =BackgroundColor2;

              DateTime datee2 = DateTime.parse( state.OldMessages!.messages![i].replies![0].CreatAt.toString());

              InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
            }


          }


          state.messages!.add(InstanceMessages);

        }
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
        );









        // yield state.rebuild((b) => b
        //   ..isLoading = false
        //   ..error = ""
        //   ..success= false
        // );


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
    //  try {
        yield state.rebuild((b) => b
          ..AliasISLoading = true
          ..error = ""
          ..MYAliasISsuccess= false
          ..GetAlias=null
        );

     final date2 = await _repository.GetAlias(event.My_ID!);
     final date1 = await _repository.GetAlias(event.HIS_ID!);


        yield state.rebuild((b) => b
          ..GetAliasMinee.replace(date2)


        );
        yield state.rebuild((b) => b
          ..GetAlias.replace(date1)


        );
        //

        yield state.rebuild((b) => b
          ..AliasISLoading = false
          ..error = ""
          ..MYAliasISsuccess= true
        );

    //  } catch (e) {
     //   print('get Error $e');
        // yield state.rebuild((b) => b
        //   ..AliasISLoading = false
        //   ..error = ""
        //   ..AliasISsuccess= false
        //   ..GetAlias = null
        // );
      //}
    }

    if (event is Get_MYAlias) {
      try {
        yield state.rebuild((b) => b
          ..AliasISLoading = true
          ..error = ""
          ..AliasISsuccess= false
          ..GetAlias=null
        );

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
          ..GetAlias = null
        );
      }
    }

    if (event is KetbaordStatus) {
      yield state.rebuild((b) => b
        ..KetbaordStatuss = event.status
      );
    }


    if (event is addReply) {
      // try {

        String base64String;
        String BACKEND_PATH="";
        File? file;
        base64String = "";

        // is_node
        //       ? InstanceMessages.Image1 = Image122
        //       : is_backend
        //       ? InstanceMessages.message = path
        //       : InstanceMessages.Image2 = filee;



        if (event.Model_Type.toString()=="Uint8List") {
          print("2");
          base64String = base64Encode(event.Uint8!);


          print(base64String);
        } else if (event.Model_Type.toString()=="File"){
          print("4");
          file = event.File_file!;
          print(file);
          Uint8List bytes = file.readAsBytesSync();
          base64String = base64Encode(bytes);
        }else if (event.Model_Type.toString()=="Backend"){
          print("4");
          BACKEND_PATH  = event.Message!;
        }





        sendReply(

            base64String.isNotEmpty
                ?base64String
                :BACKEND_PATH.isEmpty
            ?event.Message!
            :BACKEND_PATH,

            event.DestinationUser_id!,
            event.comment!,event.MessageDirection_Type!, event.Model_Type!);


        final date = await _repository.AddReply(event.comment!,event.message_id!);
        print(date);



        yield state.rebuild((b) => b
          ..Addreply.replace(date)
        );





      // } catch (e) {
      //   print('get Error $e');
      //   yield state.rebuild((b) => b
      //     ..Addreply = null
      //   );
      // }
    }

    if (event is SendMessage) {
      try {

        final date = await _repository.PostMessage(event.message!,event.Type!,event.send_by! ,event.receiver_id!);

        yield state.rebuild((b) => b
          ..PostMessages.replace(date)

        );

        state.messages![0].ID = state.PostMessages!.message_id;

        sendMessage(
            event.message!,
            state.GetAlias!.friend!.id!
                .toString(),
            state.messages![0].ID!,
          event.Type.toString()
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
          ..type = event.Model_Type
          ..Image1 = event.Image1
          ..File_image = event.File_image
          ..Image_type = event.Image_type
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

    if (event is GetUsersInsideBubble) {
        yield state.rebuild((b) => b
          ..GetInsideUsersISloading=true
          ..GetInsideUsersSuccess=false
          ..GetUsersInsideBubble=null
        );


        final date2 = await _repository.GetUsersInsideBubble(event.Bubble_id!);


        yield state.rebuild((b) => b
          ..GetUsersInsideBubble.replace(date2)
        );


        for(int i=0;i<state.GetUsersInsideBubble!.users!.length;i++){
          if (event.MY_id!=state.GetUsersInsideBubble!.users![i].id!) {
            UserDATA User = UserDATA();
            User.id = state.GetUsersInsideBubble!.users![i].id!;
            User.Avatar =
                state.GetUsersInsideBubble!.users![i].avatar.toString();
            User.Background_Color =
                state.GetUsersInsideBubble!.users![i].background_color
                    .toString();
            User.Alias = state.GetUsersInsideBubble!.users![i].alias.toString();
            User.Serial_number =
                state.GetUsersInsideBubble!.users![i].serialnumber.toString();
            User.boi = state.GetUsersInsideBubble!.users![i].bio.toString();
            User.is_frined = state.GetUsersInsideBubble!.users![i].is_friend;
            User.Serial =
                state.GetUsersInsideBubble!.users![i].serial.toString();


            String Value = state.GetUsersInsideBubble!.users![i]
                .background_color.toString();

            if (Value.contains("#", 0)) {
              Value = Value.substring(1);
              Value = "0xff$Value";
            }
            var myInt = int.parse(Value);
            var BackgroundColor = myInt;

            User.Background_Color = Value;


            state.InsideBubbleUsers!.add(User);
          }
        }
        yield state.rebuild((b) => b
          ..GetInsideUsersISloading=false
          ..GetInsideUsersSuccess=true
        );



    }




  }




}


