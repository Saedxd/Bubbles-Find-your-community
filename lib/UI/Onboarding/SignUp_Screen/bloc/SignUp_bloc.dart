// ignore_for_file: file_names


import 'package:bubbles/Data/repository/irepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SignUp_event.dart';
import 'SignUp_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  IRepository _repository;

  SignUpBloc(this._repository) : super(SignUpState.initail());

  @override
  SignUpState get initialState => SignUpState.initail();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event,) async* {
    if (event is ClearError) {
      yield state.rebuild((b) =>
      b
        ..error = ""
      );
    }
    if (event is HideSpaceOnSignUP) {
      yield state.rebuild((b) =>
      b
        ..iSHideSpaceOnSignUP = true
      );
    }
    if (event is ChangePickedColor) {
      yield state.rebuild((b) =>
      b
        ..PickedColor = event.PickedColor
      );
    }

    if (event is PostSignUp) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..data = null
            ..UserDataINDEX = 5
        );

        final date = await _repository.SignUp(
          event.Email!,
          event.password!,
          event.fcmToken!,
          event.first_name!,
          event.last_name!,
          event.Genter!,
          event.background_color!,
          event.bio!,
          event.birth_date!,
          event.interests!,
          event.avatarID!,
          event.alias!,
        );
        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..data.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..data = null
        );
      }
    }

    if (event is SocialUpdateProfile) {
      try {
        yield state.rebuild((b) =>b
          ..isLoading = true
          ..error = ""
          ..UpdateSocialProfile = null
          ..UpdateProfileINDEX = 6
        );

        final date = await _repository.upDateSocailProfile(
            event.fcmToken!,
            event.first_name!,
            event.last_name!,
            event.Genter!,
            event.background_color!,
            event.bio!,
            event.birth_date!,
            event.interests!,
            event.avatarid!,
            event.alias!);
        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..UpdateSocialProfileSuccess = true
          ..UpdateSocialProfile.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..UpdateSocialProfile = null
        );
      }
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

    if (event is GetSubGenders) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetSubGenders = null
        );

        final date = await _repository.GetSubGenders(

        );
        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetSubGenders.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetSubGenders = null
        );
      }
    }

    if (event is GetInterests) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetInterests = null
        );

        final date = await _repository.GetInterests();
        print('get Success data ${date}');

        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetInterests.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetInterests = null
        );
      }
    }

    if (event is GetGender) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetGender = null
        );

        final date = await _repository.GetGenders();


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetGender.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetGender = null
        );
      }
    }

    if (event is CheckEmails) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
            ..Checkemail = null
        );

        final date = await _repository.CheckEmail(event.Email!);
        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..Checkemail.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..Checkemail = null
        );
      }
    }

    if (event is ChangeSelected){
      yield state.rebuild((b) =>
      b
        ..ChangeSelectedd = event.status!
      );
    }

  }
}
