// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Profile/Settings_screen/bloc/Settings_event.dart';
import 'package:bubbles/UI/Profile/Settings_screen/bloc/Settings_state.dart';

import 'Settings_event.dart';
import 'Settings_state.dart';


class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  IRepository _repository;

  SettingsBloc(this._repository) : super(SettingsState.initail()) ;

  @override
  SettingsState get initialState => SettingsState.initail();

  @override
  Stream<SettingsState> mapEventToState(
      SettingsEvent event,
      ) async* {

    if (event is UserLeftBubble) {

      try {

        final date = await _repository.ChangeUserStatusToOut(event.Bubble_id!);

      } catch (e) {
        print('get Error $e');

      }
    }
    if (event is Logout) {
      try {
        yield state.rebuild((b) => b
          ..error = ""
          ..LOgedOUT = false
          ..ISloadingLogout = true
          ..Logout =null
        );

        final date = await _repository.Logout();
        print('get Success data ${date}');
        yield state.rebuild((b) => b
          ..error = ""
          ..LOgedOUT= true
          ..ISloadingLogout = false
          ..Logout.replace(date)
        );
      } catch (e) {
        print(e);
      }
    }




  }
}
