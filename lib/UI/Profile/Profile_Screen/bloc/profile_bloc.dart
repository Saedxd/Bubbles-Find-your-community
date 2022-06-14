// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';

import 'profile_event.dart';
import 'profile_state.dart';


class ProfileBloc extends Bloc<profileEvent, profileState> {

  IRepository _repository;

  ProfileBloc(this._repository) : super(profileState.initail()) ;

  @override
  profileState get initialState => profileState.initail();

  @override
  Stream<profileState> mapEventToState(
      profileEvent event,
      ) async* {


    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetAvatars) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetAvatar = null
        );

        final date = await _repository.GetAvatars();


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetAvatar.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetAvatar = null
        );
      }
    }

    if (event is ChangeAvatar) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoadingAvatar = true
          ..error = ""
          ..successAvatar = false
          ..Changeavatarr =null
        );


        final date = await _repository.ChangeAvatar(event.AvatarId!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoadingAvatar = false
          ..error = ""
          ..successAvatar = true
          ..Changeavatarr.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoadingAvatar = false
          ..error = "Something went wrong"
          ..successAvatar = false
          ..Changeavatarr =null
        );
      }
    }

    if (event is UpdateProfile) {
      try {
        yield state.rebuild((b) => b
          ..isLoadingProfileUpdate = true
          ..error = ""
          ..ProfileUpdated = false
          ..UpdateBoiUSERNAME =null
        );

        final date = await _repository.updateProfile(event.Username!,event.Boi!);

        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoadingProfileUpdate = false
          ..error = ""
          ..ProfileUpdated = true
          ..UpdateBoiUSERNAME.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoadingProfileUpdate = false
          ..error = "Something went wrong"
          ..ProfileUpdated = false
          ..UpdateBoiUSERNAME =null
        );
      }
    }

    if (event is Toggle) {
      try {
        yield state.rebuild((b) => b
            ..ToggleStatus = event.Status!

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..error = "Something went wrong"
        );
      }
    }

    if (event is GOtoFrinedlIST) {
      print(state.GOtoFrined);
      print("inside the bloc 1");
      try {
        yield state.rebuild((b) => b
            ..GOtoFrined = !b.GOtoFrined!
        );
        print(state.GOtoFrined);
        print("inside the bloc 2");
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..error = "Something went wrong"
        );
      }
    }

    if (event is GetProfile){
      try {

        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetprofileSuccess = false
          ..ProfileDate = null
        );

       final date = await _repository.GetProfile();
        print('get Success data $date');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetprofileSuccess = true
         ..ProfileDate.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetprofileSuccess = false
          ..ProfileDate = null
        );
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
        print('get Error $e');
        yield state.rebuild((b) => b
          ..error = "Something went wrong"
          ..LOgedOUT = false
          ..ISloadingLogout = false
          ..Logout =null

        );
      }
    }




  }
}
