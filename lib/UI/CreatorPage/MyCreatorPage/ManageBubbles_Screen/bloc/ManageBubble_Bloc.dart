
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_State.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class ManageBubble_Bloc extends Bloc<ManageBubbleEvent, ManageBubbleState> {


  IRepository _repository;

  ManageBubble_Bloc(this._repository) : super(ManageBubbleState.initail()) ;

  @override
  ManageBubbleState get initialState => ManageBubbleState.initail();

  @override
  Stream<ManageBubbleState> mapEventToState(
      ManageBubbleEvent event,
      ) async* {

    if (event is Change_Chosen_Category) {
      try {
        // yield state.rebuild((b) => b
        //   ..ChooseFrined_isLoading = true
        //
        // );
        //
        yield state.rebuild((b) =>
        b ..Category_Chosen = List.filled(4,false)
        );

        yield state.rebuild((b) => b
          ..Category_Chosen![event.Index!] = true
        );



      } catch (e) {
        print('get Error $e');

      }
    }

  }
}


