
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';

import 'package:bubbles/UI/Home/Options_screen/bloc/Options_event.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_state.dart';






class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {

  final IRepository _repository;


  OptionsBloc(this._repository) : super(OptionsState.initail()) ;

  @override
  OptionsState get initialState => OptionsState.initail();

  @override
  Stream<OptionsState> mapEventToState(
      OptionsEvent event,
      ) async* {

    if (event is ClearError) {

    }

    if (event is ChangeDone1) {
      yield state.rebuild((b) => b
        ..DoneChoose1 = event.DoneColor1
      );
    }

    if (event is ChangeDone2) {
      yield state.rebuild((b) => b
        ..DoneChoose2 = event.DoneColor2
      );
    }
    if (event is ChangeDone3) {
      yield state.rebuild((b) => b
        ..ChangeDone33 = event.ChangeDone33
      );
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


        print('get Success data $date');
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
          ..error = "Something went wrong"
          ..success = false
          ..GetFriends = null
        );
      }
    }

    if (event is CreateBubble) {
      try {
        yield state.rebuild((b) =>
        b
          ..CreateBubbleISloading = true
          ..CreateBubbleError = ""
          ..CreateBUbbleSuccess = false
        ..CreateBubble = null
        );

   final date = await _repository.CreateBubble(event.Title!, event.LOcation!, event.Base64Images!, event.ColorS!, event.Description!, event.OrganizersId!, event.Start_Date!, event.End_Date!, event.Dates!, event.lng!, event.lat!, event.raduis!);


      print('get Success data $date');
        yield state.rebuild((b) =>
        b
          ..CreateBubbleISloading = false
          ..CreateBubbleError = ""
          ..CreateBUbbleSuccess = true
        ..CreateBubble.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..CreateBubbleISloading = false
          ..CreateBubbleError = "Something Went Wrong"
          ..CreateBUbbleSuccess = false
          ..CreateBubble = null
        );
      }
    }
  }
}
