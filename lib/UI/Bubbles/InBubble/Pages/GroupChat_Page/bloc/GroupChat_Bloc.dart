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


  }
}
