import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'GroupChat_event.dart';
import 'GroupChat_state.dart';


class GroupChatBloc extends Bloc<GroupChatevent, GroupChatState> {
  IRepository _repository;

  GroupChatBloc(this._repository) : super(GroupChatState.initail()) ;

  @override
  GroupChatState get initialState => GroupChatState.initail();

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
    // if (event is GetOldMessages) {
    //   try {
    //     yield state.rebuild((b) => b
    //       ..isLoading = true
    //       ..error = ""
    //       ..success= false
    //       ..OldMessages=null
    //     );
    //
    //     final date = await _repository.GetOldMessages(event.receiver_id!);
    //     //   print(date);
    //
    //     yield state.rebuild((b) => b
    //       ..isLoading = true
    //       ..error = ""
    //       ..success= false
    //       ..OldMessages.replace(date)
    //     );
    //
    //
    //
    //     for (int i = 0;i<state.OldMessages!.messages!.length;i++){
    //       MessageModel InstanceMessages = MessageModel();
    //       if (state.OldMessages!.messages![i].replies!.isEmpty) {
    //         InstanceMessages.ISreply = false;
    //         InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
    //         InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
    //         print("index :${i}");
    //         print("ID :${InstanceMessages.ID}");
    //         print("Type : ${state.OldMessages!.messages![i].type.toString()} ");
    //         print("");
    //         InstanceMessages.Alias =
    //             state.OldMessages!.messages![i].sender_name.toString();
    //         InstanceMessages.Avatar =
    //             state.OldMessages!.messages![i].sender_image.toString();
    //         String Value = "";
    //         Value =state.OldMessages!.messages![i].sender_background_color!;
    //
    //
    //
    //         var myInt = int.parse(Value);
    //         int BackgroundColor = myInt;
    //
    //
    //         InstanceMessages.background_Color =BackgroundColor;
    //         InstanceMessages.message =
    //             state.OldMessages!.messages![i].message.toString();
    //
    //         DateTime datee = DateTime.parse(
    //             state.OldMessages!.messages![i].CreatAt.toString());
    //
    //
    //         InstanceMessages.time = DateFormat.jm().format(datee);
    //         InstanceMessages.Type =   state.OldMessages!.messages![i].type.toString();
    //       }
    //       if (state.OldMessages!.messages![i].replies!.isNotEmpty){
    //         InstanceMessages.ISreply = true;
    //         InstanceMessages.Type = state.OldMessages!.messages![i].type.toString();
    //         InstanceMessages.ID = state.OldMessages!.messages![i].id!.toInt();
    //         print("index :${i}");
    //         print("ID :${InstanceMessages.ID}");
    //         print("Type : ${state.OldMessages!.messages![i].type.toString()} ");
    //         print("");
    //
    //         String Value = state.OldMessages!.messages![i].sender_background_color.toString();
    //
    //         var myInt = int.parse(Value);
    //         var BackgroundColor = myInt;
    //
    //
    //
    //         InstanceMessages.RepliedTOAlias =        state.OldMessages!.messages![i].sender_name.toString();
    //         InstanceMessages.RepliedTOMessage =   state.OldMessages!.messages![i].message.toString();
    //         InstanceMessages.RepliedTOAvatar =   state.OldMessages!.messages![i].sender_image.toString();
    //         InstanceMessages.ReplieDtobackground_Color =BackgroundColor;
    //
    //
    //
    //         String Value2 =state.OldMessages!.messages![i].replies![0].background.toString();
    //         var myInt2 = int.parse(Value2);
    //         var BackgroundColor2 = myInt2;
    //
    //         InstanceMessages.ReplierAlias = state.OldMessages!.messages![i].replies![0].alias.toString();
    //         InstanceMessages.ReplierMessage = state.OldMessages!.messages![i].replies![0].comment.toString();
    //         InstanceMessages.ReplierAvatar = state.OldMessages!.messages![i].replies![0].avatar.toString();
    //         InstanceMessages.Replierbackground_Color =BackgroundColor2;
    //
    //         DateTime datee2 = DateTime.parse(state.OldMessages!.messages![i].replies![0].CreatAt.toString());
    //
    //         InstanceMessages.Repliertime =DateFormat.jm().format(datee2);
    //       }
    //
    //       state.messages!.add(InstanceMessages);
    //
    //
    //     }
    //
    //
    //     yield state.rebuild((b) => b
    //       ..isLoading = false
    //       ..error = ""
    //       ..success= true
    //     );
    //
    //
    //
    //
    //   } catch (e) {
    //     print('get Error $e');
    //     yield state.rebuild((b) => b
    //       ..isLoading = false
    //       ..error = "Something Went Wrong"
    //       ..success= false
    //       ..OldMessages = null
    //     );
    //   }
    // }
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
         // ..GetAlias.replace(date1)
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
    if (event is MakeTextFieldSumToNormal) {
      try {
        yield state.rebuild((b) => b
          ..TextfieldSum =2
        );
      } catch (e) {
        print('get Error $e');

      }
    }
  }
}
