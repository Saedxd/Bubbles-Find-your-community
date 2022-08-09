
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'login_event.dart';
import 'login_state.dart';


class loginBloc extends Bloc<LOginEvent, loginState> {

  IRepository _repository;

  loginBloc(this._repository) : super(loginState.initail()) ;

  @override
  loginState get initialState => loginState.initail();

  @override
  Stream<loginState> mapEventToState(
      LOginEvent event,
      ) async* {

    if (event is SetPermission) {
      try {

        final date = await _repository.SetPermission(event.is_notify!);
        print(date);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
          ..Permissions.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..Permissions = null
        );
      }
    }

    if (event is ClearError) {
      yield state.rebuild((b) => b
        ..error = ""
      );
    }

    if (event is PostLOgin) {
      try {

        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..data = null
        );
// print("im here");
// print(event.Email!);
// print(event.fcmToken!);
// print(event.password!);
        final date = await _repository.login(event.Email!, event.password!,event.fcmToken!);
print(date);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
          ..data.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..data = null
        );
      }
    }

    if (event is LoginSocial) {
      try {

        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..data = null
        );

        final date = await _repository.LoginSocial(event.Token!,event.fcmToken!);
print(date);

        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
          ..data.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..data = null
        );
      }
    }

    if (event is LoginGoogle) {
      try {

        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..data = null
        );

        final date = await _repository.GoogleLogin(event.Email!,event.name!, event.fcmToken!,event.avatar!);
        print(date);
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success= true
          ..data.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..data = null
        );
      }
    }


  }
}
