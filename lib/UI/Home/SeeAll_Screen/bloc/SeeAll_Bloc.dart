
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class SeeAllBloc extends Bloc<SeeAllEvent, SeeAllState> {




  IRepository _repository;

  SeeAllBloc(this._repository) : super(SeeAllState.initail()) ;

  @override
  SeeAllState get initialState => SeeAllState.initail();

  @override
  Stream<SeeAllState> mapEventToState(
      SeeAllEvent event,
      ) async* {


    if (event is ChangeShapStatus) {
      try {
        yield state.rebuild((b) => b
          ..ShapStatus = !b.ShapStatus!
        );



      } catch (e) {
        print('get Error $e');

      }
    }
    if (event is ToggleSaveBubbleEventScreen) {

      yield state.rebuild((b) =>
      b
        ..isLoading = true
          ..success = true
      );
      state.Saved_Status![event.index!] = !event.Saved_Status!;
      print("im not  inside");

      yield state.rebuild((b) =>
      b
        ..isLoading = false
      );

      print(event.Bubble_id!);

      final date = await _repository.SaveBubble(event.Bubble_id!);
      print(date);

      yield state.rebuild((b) =>
      b
      //..ToggleSaveIsloading = false
        ..SaveBubble.replace(date)
      );


    }
    if (event is GiveHimListOfBoolean) {
      try {

        yield state.rebuild((b) =>
        b

            ..Saved_Status = event.List_Saved_Status
          ..success = true
        );

      } catch (e) {

      }
    }
    if (event is ChangeToDetailUiState) {
      try {


        yield state.rebuild((b) =>
        b ..DetailBubbledata = event.Bubbledata
        );

        yield state.rebuild((b) =>b
          ..ShowBubbleDetailsUI = event.Status
        );
      } catch (e) {

      }
    }

  }
}


