import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'DirectMessages_event.dart';
import 'DirectMessages_State.dart';


class DirectMessagesBloc extends Bloc<DirectMessagesEvent, DirectMessagesState> {
  IRepository _repository;

  DirectMessagesBloc(this._repository) : super(DirectMessagesState.initail()) ;

  @override
  DirectMessagesState get initialState => DirectMessagesState.initail();

  @override
  Stream<DirectMessagesState> mapEventToState(
      DirectMessagesEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetLastMessageWithAllUsers){
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..OldMessages = null
        );

        final date = await _repository.GetLastMessageBetweenMeAndAllUsers();
        print('get Success data $date');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..OldMessages.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..OldMessages = null
        );
      }
    }


  }
}
