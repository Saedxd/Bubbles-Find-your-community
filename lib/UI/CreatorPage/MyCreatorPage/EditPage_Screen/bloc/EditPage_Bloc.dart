
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditPage_Screen/bloc/EditPage_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditPage_Screen/bloc/EditPage_State.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class EditPageBloc extends Bloc<EditPageEvent, EditPageState> {




  IRepository _repository;

  EditPageBloc(this._repository) : super(EditPageState.initail()) ;

  @override
  EditPageState get initialState => EditPageState.initail();

  @override
  Stream<EditPageState> mapEventToState(
      EditPageEvent event,
      ) async* {

    if (event is SelectColor) {
      try {
        yield state.rebuild((b) =>
        b ..IsChosen_Colors = List.filled(20,false)
        );

        yield state.rebuild((b) =>
        b
          ..IsChosen_Colors![event.Index!] = true
          ..PickedColor = event.PickedColor
        );

        print(state.IsChosen_Colors);

        print("Clicked2");
      } catch (e) {
        print('get Error $e');
      }
    }

  }
}


