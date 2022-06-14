import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'SuggestedFrineds_event.dart';
import 'SuggestedFrineds_state.dart';


class SuggestedFrinedsBloc extends Bloc<SuggestedFrinedsEvent, SuggestedFreindsState> {
  IRepository _repository;

  SuggestedFrinedsBloc(this._repository) : super(SuggestedFreindsState.initail()) ;

  @override
  SuggestedFreindsState get initialState => SuggestedFreindsState.initail();

  @override
  Stream<SuggestedFreindsState> mapEventToState(
      SuggestedFrinedsEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetSuggestedFriends){
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..SuggestFriends = null
        );

        final date = await _repository.SuggestFreinds();
        print('get Success data $date');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..SuggestFriends.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..SuggestFriends = null
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
  }
}
