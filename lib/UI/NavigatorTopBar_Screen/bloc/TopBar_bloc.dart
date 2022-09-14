import 'package:bloc/bloc.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Data/repository/irepository.dart';
import 'TopBar_Event.dart';
import 'TopBar_State.dart';


class TopBarBloc extends Bloc<TopBarEvent, TopBarState> {
  IRepository _repository;

  TopBarBloc(this._repository) : super(TopBarState.initail()) ;

  @override
  TopBarState get initialState => TopBarState.initail();

  @override
  Stream<TopBarState> mapEventToState(
      TopBarEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is ChangeIndex1) {
      try {

        yield state.rebuild((b) => b
        ..Index1 = !b.Index1!
        );

      } catch (e) {

        print('get Error $e');
        yield state.rebuild((b) => b
        );

      }
    }
    if (event is ChangeIndex2) {
      try {

        yield state.rebuild((b) => b
          ..Index2 = !b.Index2!
        );

      } catch (e) {

        print('get Error $e');
        yield state.rebuild((b) => b
        );

      }
    }
    if (event is ChangeIndex3) {
      try {

        yield state.rebuild((b) => b
          ..Index3 = !b.Index3!
        );

      } catch (e) {

        print('get Error $e');
        yield state.rebuild((b) => b
        );

      }
    }
    if (event is ChangeIndex4) {
      try {

        yield state.rebuild((b) => b
          ..Index4 = !b.Index4!
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
        );
      }
    }
    if (event is ChangeIndex5) {
      try {

        yield state.rebuild((b) => b
          ..Index5 = !b.Index5!
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
        );
      }
    }
    if (event is ChangePAGEINDEX) {
      try {

        yield state.rebuild((b) => b
          ..INDEX = event.num
        );

      } catch (e) {

        print('get Error $e');
        yield state.rebuild((b) => b
        );

      }
    }

    if (event is Change_Is_Creator) {
      try {

        yield state.rebuild((b) => b
          ..is_Creator = event.ChangeISCreator
        );

      } catch (e) {

        print('get Error $e');
        yield state.rebuild((b) => b
        );

      }
    }

    if (event is GetProfile){
      try {

        yield state.rebuild((b) => b
          ..GetprofileLoading = true
          ..error = ""
          ..GetprofileSuccess = false
          ..ProfileDate = null
        );

        final date = await _repository.GetProfile();
        print('get Success data $date');
        yield state.rebuild((b) => b
          ..GetprofileLoading = false
          ..error = ""
          ..GetprofileSuccess = true
          ..ProfileDate.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetprofileLoading = false

          ..GetprofileSuccess = false
          ..ProfileDate = null
        );
      }
    }

    if (event is GetFreinds) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetFriends = null
        );

        final date = await _repository.GetFreinds();


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetFriends.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..success = false
          ..error = "Something went wrong"
        );
      }
    }
    if (event is ClearBadge) {
      try {
        yield state.rebuild((b) =>
        b
          ..BadgeCounter = 0
        );

        final date = await _repository.ClearBadge();

      } catch (e) {
        print('get Error $e');
      }
    }
    if (event is GetBadge) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetbadgeSucess = false
          ..Getbadge = null
        );


        final date = await _repository.Getbadge();


     //   print('get Success data ${date}');
        yield state.rebuild((b) =>
        b..isLoading = false
          ..error = ""
          ..success = true
          ..GetbadgeSucess = true
          ..Getbadge.replace(date)

       );
        yield state.rebuild((b) =>
        b
          ..BadgeCounter = state.Getbadge!.count!.toInt()
        );
        print(state.BadgeCounter);
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..success = false
          ..Getbadge = null
        );
      }
    }



  }
}
