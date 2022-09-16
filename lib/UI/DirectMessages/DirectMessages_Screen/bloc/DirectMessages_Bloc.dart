import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'DirectMessages_event.dart';
import 'DirectMessages_State.dart';

class DirectMessagesBloc
    extends Bloc<DirectMessagesEvent, DirectMessagesState> {
  IRepository _repository;

  DirectMessagesBloc(this._repository) : super(DirectMessagesState.initail());

  @override
  DirectMessagesState get initialState => DirectMessagesState.initail();

  @override
  Stream<DirectMessagesState> mapEventToState(
    DirectMessagesEvent event,
  ) async* {
    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is RefreshState) {
      try {
        yield state.rebuild((b) => b
          ..ChangeStateLoading = true
          ..ChangeStateSuccess = false);

        yield state.rebuild((b) => b
          ..ChangeStateLoading = false
          ..ChangeStateSuccess = true);
      } catch (e) {
        print('get Error $e');
      }
    }
    if (event is DeleteChat) {

      yield state.rebuild((b) => b
        ..DeleteChatSuccess= false
      );


      final date2 = await _repository.DeleteOldMessages(event.Reciver_id!,event.send_by!);

      yield state.rebuild((b) => b
        ..DeleteChatSuccess= true
        ..DeleteOldmessages.replace(date2)
      );


    }

    if (event is GetLastMessageWithAllUsers) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..OldMessages = null);

        final date = await _repository.GetLastMessageBetweenMeAndAllUsers();
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..OldMessages.replace(date));

        state.FilteredDmlist!.clear();
        state.Dmlist!.clear();
        for (int i = 0; i < state.OldMessages!.messages!.length; i++) {
          DmlistData DmData = DmlistData();

          DmData.Avatar =
              state.OldMessages!.messages![i].receiver_image.toString();
          DmData.alias =
              state.OldMessages!.messages![i].receiver_name.toString();
          String value = state
              .OldMessages!.messages![i].receiver_background_color
              .toString();
          var myInt = int.parse(value);
          var BackgroundColor = myInt;
          DmData.backgroundColor = BackgroundColor;
          DateTime datee = DateTime.parse(
              state.OldMessages!.messages![i].CreatAt.toString());
          DmData.time = DateFormat.jm().format(datee);
          DmData.lastMessage =
              state.OldMessages!.messages![i].message.toString();
          DmData.receiver_id = state.OldMessages!.messages![i].receiver_id;
          DmData.MY_id = state.OldMessages!.messages![i].me;
          DmData.send_by = state.OldMessages!.messages![i].send_by;
          // DmData.Msg_Type = state.OldMessages!.messages![i].sms_type;
          DmData.lastMessage.toString().length > 5
              ? DmData.lastMessage.toString().substring(0, 5) == "https"
                  ? DmData.lastMessage = "Sticker"
                  : print("NVM")
              : print("length less than 5");
          DmData.Replies = state.OldMessages!.messages![i].replies!.isNotEmpty
              ? state.OldMessages!.messages![i].replies![0].comment.toString()
              : "";

          state.FilteredDmlist!.add(DmData);
          state.Dmlist!.add(DmData);
        }

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true);
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something Went Wrong"
          ..success = false
            ..OldMessages = null
        );
      }
    }

    if (event is SearchDMlist) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false);

        state.FilteredDmlist!.clear();
        print("Cleared");

        state.Dmlist!.forEach((DmObject) {
          if (DmObject.alias!
              .toLowerCase()
              .contains(event.Keyword!.toLowerCase())) {
            state.FilteredDmlist!.add(DmObject);
          }
        });

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true);
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..DMListSearchResult = null);
      }
    }
    if (event is DeleteFromList) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
        );

        state.FilteredDmlist!.removeAt(event.index!);
        final date = await _repository.RemoveFromDirect(event.receiver_id!);

        yield state.rebuild((b) => b
          ..isLoading = false
        );

      } catch (e) {
        print(e);
      }
    }
  }
}
