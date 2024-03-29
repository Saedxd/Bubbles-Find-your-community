import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:intl/intl.dart';
import 'GroupChat_event.dart';
import 'GroupChat_state.dart';



class GroupChatBloc extends Bloc<GroupChatevent, GroupChatState> {
  IRepository _repository;
  List<String> Colorss =["0xff8D4624","0xff31576D",
    "0xffE0A41E","0xffE0A41E","0xff4ECEB6","0xff303030"
    ,"0xffDEDDBF","0xff77C08A","0xffD588B1","0xff7B78F5","0xffBA477A","0xff80BFC5","0xffEB9B5D","0xffCD6356"];
  GroupChatBloc(this._repository) : super(GroupChatState.initail()) ;

  @override
  GroupChatState get initialState => GroupChatState.initail();


  void SendTopicFloww(String Title,String content,int BUbble_id,int message_id,String type) {
    socket!.emit("send_topic_to_bubble",
        {
          "title":Title,
          "content":content,
          "room":"bubble_$BUbble_id",
          "type":type,
          "message_id":message_id,
        });
  }


  void SendPollFlow(String Question, List<PollFlowAnswers>? PollAnswers,int bubble_id,int message_id,bool isShow_participants ,bool  isMultible_answers) {

   List<String> Answers =[];
   List<int> Answers_id =[];
   for(int i=0;i<PollAnswers!.length;i++){
     Answers.add(PollAnswers[i].Answer.toString());
     Answers_id.add(PollAnswers[i].id!);
   }

    socket!.emit("send_poll_message_bubble",
        {
          "title": Question,
          "answers": Answers,
          "Answers_id": Answers_id,
          "message_id": message_id,
          "room":"bubble_$bubble_id",
          "type": "Newpoll",
          "isShow_participants": isShow_participants,
          "isMultible_answers": isMultible_answers,
        });
  }

  void SendMediadump(String MediaDumpImage, String MediaDumpTitle,int message_id,String type,int bubble_id) {
    socket!.emit("send_media_to_bubble",
        {
          "title":MediaDumpTitle,
          "image":MediaDumpImage,
          "room":"bubble_$bubble_id",
          "type":type,
          "message_id":message_id,
        })

    ;
  }

  void sendMessage(String message,String type,int bubble_id,int Message_id) {
    socket!.emit("send_dm_to_bubble",
        {
          "message":message,
          "room":"bubble_$bubble_id",
          "type":type,
          "message_id":Message_id,
        });
  }


  void ChoosePollFlowAnswerr(int Answer_id,int Index,int bubble_id) {
    print("Emitttttted");
    socket!.emit("listen_chosen_answer",
        {
          "room":"bubble_$bubble_id",
          "Answer_id":Answer_id,
          "index":Index,
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
    if (event is ChoosePollFlowAnswer) {
   //   try {

      print(" rate ${state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].rate}");
      print("persentage ${state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].Presentage}" );
      print("Chat index${event.Chat_index!}");
      print("answer index${event.ANswers_index!}");
      print("Flow index${event.Flow_Index!}");
        yield state.rebuild((b) => b
          ..PollFlow_AnsweredSuccess = false
        );
        state.FlowList![event.Flow_Index!].is_chosen = true;
        state.FlowList![event.Flow_Index!].PollAnswers![event.ANswers_index!].rate =  state.FlowList![event.Flow_Index!].PollAnswers![event.ANswers_index!].rate !+ 1;
        state.FlowList![event.Flow_Index!].Total_Rate =  state.FlowList![event.Flow_Index!].Total_Rate + 1;
        state.FlowList![event.Flow_Index!].PollAnswers![event.ANswers_index!].Presentage =
        ( state.FlowList![event.Flow_Index!].PollAnswers![event.ANswers_index!].rate! /
            state.FlowList![event.Flow_Index!].Total_Rate).toInt() * 100;



        state.messages![event.Chat_index!].is_Chosen = true;
        state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].rate =   state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].rate !+ 1 ;
        state.messages![event.Chat_index!].Total_Rate =  state.messages![event.Chat_index!].Total_Rate + 1;
        state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].Presentage =
            (   state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].rate! /
                state.messages![event.Chat_index!].Total_Rate).toInt()* 100;
      print(" rate ${state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].rate}");
      print("persentage ${state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].Presentage}" );


        yield state.rebuild((b) => b
          ..PollFlow_AnsweredSuccess = true
        );
                if (event.Want_Request!) {
                  ChoosePollFlowAnswerr( state.messages![event.Chat_index!].PollAnswers![event.ANswers_index!].id!,event.Chat_index!,event.bubble_id!);
                  final date2 = await _repository.ChoosePollFlowAnswer(   event.Answer_id!);
                }
      // } catch (e) {
      //   print('get Error $e ChoosePollFlowAnswer');
      //
      // }
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
    if (event is ChangeFlowOptionsStatus) {
      try {
        yield state.rebuild((b) => b
          ..FlowOptionsOpened = event.status
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

        FrinedsData User =FrinedsData();
        User.ID = state.GetAliasForInsideBubbleUser!.friend!.id;
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
    //  try {
        yield state.rebuild((b) => b
          ..error = ""
          ..success= false
          ..isLoading = true
        );


        final date2 = await _repository.GetEventMessages(event.bubble_id!,);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= false
          ..EventOldMessages.replace(date2)
        );


        for (int i = 0;i<state.EventOldMessages!.messages!.length;i++){
          GroupChatMessage InstanceMessages = GroupChatMessage();
          DateTime datee = DateTime.parse( state.EventOldMessages!.messages![i].message!.CreatAt.toString());
          InstanceMessages.ISNOdeJS = false;
          InstanceMessages.IsBackEnd = true;
          InstanceMessages.is_base64 = false;
          InstanceMessages.MessageSettledWIthID = true;
          InstanceMessages.ID = state.EventOldMessages!.messages![i].id!.toInt();
          InstanceMessages.Type = state.EventOldMessages!.messages![i].type.toString();
          InstanceMessages.FlowSettledWithID =true;
          InstanceMessages.time = DateFormat.jm().format(datee.toLocal());
          String Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;
          FrinedsData data = FrinedsData();
          data.interests = state.EventOldMessages!.messages![i].message!.sender_interests;
          data.is_Frined = state.EventOldMessages!.messages![i].message!.is_friend;
          data.boi = state.EventOldMessages!.messages![i].message!.sender_bio.toString();
          data.His_id = state.EventOldMessages!.messages![i].message!.sender_id;
          data.Background_Color = Value;
          data.Alias = state.EventOldMessages!.messages![i].message!.sender_name;


          data.Avatar = state.EventOldMessages!.messages![i].message!.sender_image;
          data.Serial = state.EventOldMessages!.messages![i].message!.sender_serial;
          InstanceMessages.Sender_data = data;

          if (state.EventOldMessages!.messages![i].replies!.isEmpty) {



            InstanceMessages.ISreply = false;
            InstanceMessages.Alias = state.EventOldMessages!.messages![i].message!.sender_name.toString();
            InstanceMessages.Avatar =  state.EventOldMessages!.messages![i].message!.sender_image.toString();



            InstanceMessages.background_Color = int.parse(Value);
            InstanceMessages.message = state.EventOldMessages!.messages![i].message!.message.toString();





            if (state.EventOldMessages!.messages![i].message!.type.toString()=="text"){
              InstanceMessages.ModelType = "Message";
            }

            if (state.EventOldMessages!.messages![i].message!.type.toString()=="audio") {
              InstanceMessages.ModelType ="Voice";
            }

            if (state.EventOldMessages!.messages![i].message!.type.toString()=="image") {
              InstanceMessages.ModelType ="Image";
              InstanceMessages.Image_type = "Backend";
            }

            if (state.EventOldMessages!.messages![i].message!.type.toString()=="topic") {
              InstanceMessages.ModelType ="TopicFlow";
              InstanceMessages.TopicFlowDescription = state.EventOldMessages!.messages![i].message!.content.toString();
              InstanceMessages.TopicFlowTitle = state.EventOldMessages!.messages![i].message!.title.toString();
              InstanceMessages.CanReply = false;
        //      InstanceMessages.ID =  state.EventOldMessages!.messages![i].message!.id!.toInt();

              FlowData data = FlowData();
              data.FlowMessage_id = state.EventOldMessages!.messages![i].id!.toInt();
              int x = Random().nextInt(Colorss.length);
              String Colorr = Colorss[x];
              data.Color = int.parse(Colorr);

              data.time =  DateFormat.jm().format(datee.toLocal());
              data.Flow_type ="TopicFlow";
              data.ISMediaDump = false;
              data.Title = state.EventOldMessages!.messages![i].message!.title.toString();
              data.Content =state.EventOldMessages!.messages![i].message!.content.toString();
              print(data.Content);
              data.Who_Made_it_Alias =state.EventOldMessages!.messages![i].message!.sender_name.toString();
              data.Who_Made_it_Avatar = state.EventOldMessages!.messages![i].message!.sender_image.toString();
              data.Who_Made_it_ID = state.EventOldMessages!.messages![i].message!.sender_id!.toInt();
              data.Flow_Icon = "Assets/images/notifiy.svg";

//      "Assets/images/12123123.svg", footprint Icon


              String Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;
              data.Who_Made_it_Color = int.parse(Value);

              state.FlowList!.add(data);
              print("added");

            }

            if (state.EventOldMessages!.messages![i].message!.type.toString()=="media") {
              InstanceMessages.ModelType ="MediaDump";
              InstanceMessages.MediaDumpImagePath = state.EventOldMessages!.messages![i].message!.image.toString();
              InstanceMessages.MediaDumpTitle = state.EventOldMessages!.messages![i].message!.title.toString();
              InstanceMessages.Image_type = "backend";
              InstanceMessages.CanReply = false;
             // InstanceMessages.ID =  state.EventOldMessages!.messages![i].message!.id!.toInt();



              FlowData data = FlowData();
              data.FlowMessage_id = state.EventOldMessages!.messages![i].id!.toInt();
              int x = Random().nextInt(Colorss.length);
              String Colorr = Colorss[x];
              data.Color = int.parse(Colorr);
              data.Flow_Icon =  "Assets/images/Layer_1-2_1_.svg";
              data.ISMediaDump = true;
              data.Title = state.EventOldMessages!.messages![i].message!.title.toString();
              data.Image = state.EventOldMessages!.messages![i].message!.image.toString();
              data.Image_type =  "backend";
              data.Who_Made_it_Alias =state.EventOldMessages!.messages![i].message!.sender_name.toString();
              data.Who_Made_it_Avatar = state.EventOldMessages!.messages![i].message!.sender_image.toString();
              data.Who_Made_it_ID = state.EventOldMessages!.messages![i].message!.sender_id!.toInt();
              data.Flow_type ="MediaDump";
              data.time =  DateFormat.jm().format(datee.toLocal());
              String Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;
              data.Who_Made_it_Color = int.parse(Value);

              state.FlowList!.add(data);
            }

            if (state.EventOldMessages!.messages![i].message!.type.toString()=="poll") {
              InstanceMessages.ModelType = "PollFlow";
              InstanceMessages.PollQuestion =
                  state.EventOldMessages!.messages![i].message!.title
                      .toString();
              bool is_chosen = false;
              int Total_Rate = 0;
              //   InstanceMessages.ID =  state.EventOldMessages!.messages![i].message!.id!.toInt();
              List<PollFlowAnswers>? PollAnswers= [];
              for (int j=0;j<state.EventOldMessages!.messages![i].message!.answers!.length; j++){
                Total_Rate += state.EventOldMessages!.messages![i].message!.answers![j].rate!;
              }
              for (int j=0;j<state.EventOldMessages!.messages![i].message!.answers!.length; j++){
                PollFlowAnswers PollFlowAnswer = PollFlowAnswers();
                PollFlowAnswer.Answer = state.EventOldMessages!.messages![i].message!.answers![j].answer;
                PollFlowAnswer.id = state.EventOldMessages!.messages![i].message!.answers![j].id;
                PollFlowAnswer.is_checked = state.EventOldMessages!.messages![i].message!.answers![j].is_checked;
                PollFlowAnswer.rate =state.EventOldMessages!.messages![i].message!.answers![j].rate;
                PollFlowAnswer.users_Choose_it =state.EventOldMessages!.messages![i].message!.answers![j].participants;

                if (Total_Rate!=0)
              PollFlowAnswer.Presentage =  (PollFlowAnswer.rate !/ Total_Rate).toInt() * 100;
                PollAnswers.add(PollFlowAnswer);

                is_chosen =   PollFlowAnswer.is_checked!;
                bool DidITonce = true;
                if (is_chosen && DidITonce){
                  InstanceMessages.is_Chosen = is_chosen;
                  DidITonce = false;
                }
              }
              InstanceMessages.PollAnswers = PollAnswers;
              InstanceMessages.Total_Rate = Total_Rate;





              FlowData data = FlowData();
              for (int j=0;j<state.EventOldMessages!.messages![i].message!.answers!.length; j++) {
                PollFlowAnswers PollFlowAnswer = PollFlowAnswers();
                PollFlowAnswer.Answer = state.EventOldMessages!.messages![i].message!.answers![j] .answer;
                PollFlowAnswer.id = state.EventOldMessages!.messages![i].message!.answers![j].id;
                PollFlowAnswer.is_checked =   state.EventOldMessages!.messages![i].message!.answers![j]  .is_checked;
                PollFlowAnswer.rate = state.EventOldMessages!.messages![i].message!.answers![j]  .rate;
                PollFlowAnswer.users_Choose_it =   state.EventOldMessages!.messages![i].message!.answers![j] .participants;


              }
                int x = Random().nextInt(Colorss.length);
              String Colorr = Colorss[x];
              data.Color = int.parse(Colorr);
              data.is_chosen = is_chosen;
              data.Flow_Icon =  "Assets/images/123323232.svg";
              data.ISMediaDump = true;
              data.FlowMessage_id = state.EventOldMessages!.messages![i].id!.toInt();
              data.Title = state.EventOldMessages!.messages![i].message!.title.toString();
                  data.time =  DateFormat.jm().format(datee.toLocal());
              data.Flow_type ="PollFlow";
              data.Who_Made_it_Alias =state.EventOldMessages!.messages![i].message!.sender_name.toString();
              data.Who_Made_it_Avatar = state.EventOldMessages!.messages![i].message!.sender_image.toString();
              data.Who_Made_it_ID = state.EventOldMessages!.messages![i].message!.sender_id!.toInt();
              data.PollAnswers = PollAnswers;
              data.Total_Rate = Total_Rate;
              String Value = state.EventOldMessages!.messages![i].message!.sender_background_color!;
              data.Who_Made_it_Color = int.parse(Value);

              state.FlowList!.add(data);

            }


          }else{
            InstanceMessages.CanReply = false;
            InstanceMessages.ISreply = true;
            String Value = state.EventOldMessages!.messages![i].message!.sender_background_color.toString();
            DateTime datee = DateTime.parse(state.EventOldMessages!.messages![i].replies![0].CreatAt.toString());
            String Value2 = state.EventOldMessages!.messages![i].replies![0].background.toString();

            InstanceMessages.RepliedTOAlias =      state.EventOldMessages!.messages![i].message!.sender_name.toString();
            InstanceMessages.RepliedTOMessage =  state.EventOldMessages!.messages![i].message!.message.toString();
            InstanceMessages.RepliedTOAvatar =    state.EventOldMessages!.messages![i].message!.sender_image.toString();
            InstanceMessages.ReplieDtobackground_Color =int.parse(Value);


            InstanceMessages.ReplierAlias = state.EventOldMessages!.messages![i].replies![0].alias.toString();
            InstanceMessages.ReplierMessage = state.EventOldMessages!.messages![i].replies![0].comment.toString();
            InstanceMessages.ReplierAvatar =  state.EventOldMessages!.messages![i].replies![0].avatar.toString();


            InstanceMessages.Replierbackground_Color =int.parse(Value2);
            InstanceMessages.Repliertime = DateFormat.jm().format(datee.toLocal());


              if (state.EventOldMessages!.messages![i].message!.type.toString()=="text") {
                InstanceMessages.ModelType = "ReplyMessage";
              }

              if (state.EventOldMessages!.messages![i].message!.type.toString()=="audio") {
                InstanceMessages.ModelType = "ReplyVoice";
              }

              if (state.EventOldMessages!.messages![i].message!.type.toString()=="image") {
                InstanceMessages.ModelType = "ReplyImage";
                InstanceMessages.Image_type = "Backend";
              }
          }
          state.messages!.add(InstanceMessages);
        }

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
        );
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
          ..SendMessageISloading= true
          ..SendMessageSuccess = false
          ..SendBubbleMessage.replace(date2)
        );


       state.messages![0].ID = state.SendBubbleMessage!.message_id!.toInt();
       state.messages![0].MessageSettledWIthID = true;

        yield state.rebuild((b) => b

          ..SendMessageISloading= false
          ..SendMessageSuccess = true

        );
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


          FrinedsData User =FrinedsData();
          User.ID = state.GetUsersInsideBubble!.users![i].id!;
          User.Avatar = state.GetUsersInsideBubble!.users![i].avatar.toString();
          User.Background_Color = state.GetUsersInsideBubble!.users![i].background_color.toString();
          User.Alias = state.GetUsersInsideBubble!.users![i].alias.toString();
          User.Serial_Number = state.GetUsersInsideBubble!.users![i].serialnumber.toString();
          User.boi = state.GetUsersInsideBubble!.users![i].bio.toString();
          User.is_Frined = state.GetUsersInsideBubble!.users![i].is_friend;
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
//
        yield state.rebuild((b) => b
          ..GetInsideUsersSuccess=false
            ..ChangeSearchStatus = event.Keyword!.isEmpty
        );


        state.InsideBubbleUsers!.forEach((BubbbleOBject) {
          if (BubbbleOBject.Alias!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
            state.FilteredInsideBubbleUsers!.add(BubbbleOBject);
          }
        });

        yield state.rebuild((b) => b
          ..GetInsideUsersSuccess=true
        );



      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b

        );
      }








    }
    if (event is AddFrined) {
      try {
        state.FilteredInsideBubbleUsers![event.index!].is_Frined = true;
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

        state.FilteredInsideBubbleUsers![event.index!].is_Frined = false;
        yield state.rebuild((b) => b
          ..FreindAddlOADING = true
          ..error = ""
          ..AddFreindSuccess = false
          ..AddNewFriend = null
        );


        final date = await _repository.RemoveFriend(event.friend_id!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..FreindAddlOADING = false
          ..error = ""
          ..AddFreindSuccess = true
        );


      } catch (e) {
        print('get Error $e');
      }
    }
    if (event is SendTopicFlow) {
     // try {



        final date2 = await _repository.SendTopicFlow(event.Bubble_id!, event.Content!, event.Title!, 4);

        yield state.rebuild((b) => b
          ..SendBubbleTopicFlow.replace(date2)
          ..SendMessageISloading= true
          ..SendMessageSuccess = false
        );

        state.messages![0].ID = state.SendBubbleTopicFlow!.message_id!.toInt();

        state.FlowList!.insert(0,event.Flow!);
        state.FlowList![0].FlowMessage_id = state.SendBubbleTopicFlow!.message_id!.toInt();
        state.messages![0].FlowSettledWithID = true;
        print( state.FlowList![0].Who_Made_it_ID);
        print( state.FlowList![0].Who_Made_it_Alias);





        SendTopicFloww(event.Title!,
            event.Content!,event.Bubble_id!, state.SendBubbleTopicFlow!.message_id!.toInt(),"TopicFlow");

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
    if (event is SendMediaDumpFlow) {
     // try {



        final date2 = await _repository.SendMediaDumpFlow(event.title!, event.image!, 2,event.Bubble_id! );

        yield state.rebuild((b) => b
          ..SendBubbleMediaDump.replace(date2)
          ..SendMessageISloading= true
          ..SendMessageSuccess = false
        );

        state.messages![0].ID = state.SendBubbleMediaDump!.message_id!.toInt();

        //todo : make state.success in true so we could after that let users use the join flow button
        state.FlowList!.insert(0,event.Flow!);
        state.FlowList![0].FlowMessage_id = state.SendBubbleMediaDump!.message_id!.toInt();
        state.messages![0].FlowSettledWithID = true;
        print( state.FlowList![0].Who_Made_it_ID);
        print( state.FlowList![0].Who_Made_it_Alias);

        SendMediadump(event.image!,event.title!,state.messages![0].ID! ,"Base64",event.Bubble_id!);
    }
    if (event is SendPollFloww) {
     // try {


       final date2 = await _repository.SendPollFlow(event.Question!,event.bubble_id!,event.answers!,event.isMultible_answers!,event.isShow_participants!);

        yield state.rebuild((b) => b
          ..SendBubblePollFow.replace(date2)
        );
        yield state.rebuild((b) => b
          ..SendMessageISloading= true
          ..SendMessageSuccess = false
        );
       List<PollFlowAnswers>? PollAnswers= [];
       for (int j=0;j<state.SendBubblePollFow!.data!.message!.answers!.length; j++){
         PollFlowAnswers PollFlowAnswer = PollFlowAnswers();
         PollFlowAnswer.Answer = state.SendBubblePollFow!.data!.message!.answers![j].answer;
         PollFlowAnswer.id = state.SendBubblePollFow!.data!.message!.answers![j].id;
         PollFlowAnswer.is_checked =state.SendBubblePollFow!.data!.message!.answers![j].is_checked;
         PollFlowAnswer.rate =state.SendBubblePollFow!.data!.message!.answers![j].rate;
         PollFlowAnswer.users_Choose_it =state.SendBubblePollFow!.data!.message!.answers![j].participants;
         PollAnswers.add(PollFlowAnswer);
       }

        state.messages![0].PollAnswers = PollAnswers;
        state.messages![0].ID = state.SendBubblePollFow!.message_id!.toInt();
        state.messages![0].FlowSettledWithID = true;



       List<PollFlowAnswers>? PollAnswers_FlowList= [];
       for (int j=0;j<state.SendBubblePollFow!.data!.message!.answers!.length; j++){
         PollFlowAnswers PollFlowAnswer = PollFlowAnswers();
         PollFlowAnswer.Answer = state.SendBubblePollFow!.data!.message!.answers![j].answer;
         PollFlowAnswer.id = state.SendBubblePollFow!.data!.message!.answers![j].id;
         PollFlowAnswer.is_checked =state.SendBubblePollFow!.data!.message!.answers![j].is_checked;
         PollFlowAnswer.rate =state.SendBubblePollFow!.data!.message!.answers![j].rate;
         PollFlowAnswer.users_Choose_it =state.SendBubblePollFow!.data!.message!.answers![j].participants;
         PollAnswers_FlowList.add(PollFlowAnswer);
       }


       state.FlowList!.insert(0,event.Flow!);
        state.FlowList![0].FlowMessage_id = state.SendBubblePollFow!.message_id!.toInt();
       state.FlowList![0].PollAnswers = PollAnswers_FlowList;





        SendPollFlow(event.Question!,PollAnswers,event.bubble_id!,state.SendBubblePollFow!.message_id!.toInt(),event.isShow_participants!,event.isMultible_answers!);

        print("Emitteddd");



    }
    if (event is ChangeMediaImageTaken) {

      yield state.rebuild((b) => b
        ..MediaImageTaken = event.status!
      );
    }
    if (event is ShowFloatingActionButton) {

      yield state.rebuild((b) => b
        ..ShowFloatingActionButtonn = event.status!
      );
    }
    if (event is AddFlowModel) {
      try {


        state.FlowList!.insert(0,event.Flow!);


      } catch (e) {
        print('get Error $e');

      }
    }
  }
}

