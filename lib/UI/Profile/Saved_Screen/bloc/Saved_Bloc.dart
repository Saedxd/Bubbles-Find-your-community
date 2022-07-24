// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';

import '../Pages/SavedBubbles_Screen.dart';
import 'Saved_event.dart';
import 'Saved_State.dart';


class SavedBubblesBloc extends Bloc<SavedEvent, SavedBubblesState> {

  IRepository _repository;

  SavedBubblesBloc(this._repository) : super(SavedBubblesState.initail()) ;

  @override
  SavedBubblesState get initialState => SavedBubblesState.initail();

  @override
  Stream<SavedBubblesState> mapEventToState(
      SavedEvent event,
      ) async* {

    if (event is GetSavedBubbles) {

        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetSavedBubbles = null
        );

        final date = await _repository.GetSavedBubbles(event.User_id!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetSavedBubbles.replace(date)

        );
        for(int i=0;i<state.GetSavedBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();

          Bubbledata.Title = state.GetSavedBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetSavedBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetSavedBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetSavedBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetSavedBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetSavedBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetSavedBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetSavedBubbles!.data![i].created_by!.user!.alias;
          Bubbledata.Creator_Avatar = state.GetSavedBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetSavedBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetSavedBubbles!.data![i].created_by!.type;
          Bubbledata.Description = state.GetSavedBubbles!.data![i].description.toString();
          Bubbledata.Organizers = state.GetSavedBubbles!.data![i].organizers!;
          Bubbledata.dates = state.GetSavedBubbles!.data![i].dates!;
          String Value = state.GetSavedBubbles!.data![i].color.toString();


          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }

          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.SavedBubbleList!.add(Bubbledata);
        }
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
        );

    }
    if (event is UnSaveBubble) {
        try {

          yield state.rebuild((b) =>
          b ..UnSaveIsloading = true  );
          state.SavedBubbleList!.removeAt(event.index!);
        final date = await _repository.SaveBubble(event.Bubble_id!);

        yield state.rebuild((b) =>
        b..UnSaveIsloading = false
          ..SaveBubble.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..SaveBubble = null
        );
      }
    }
    if (event is ChangeShapStatus) {
      try {
        yield state.rebuild((b) => b
          ..ShapStatus = !b.ShapStatus!
        );



      } catch (e) {
        print('get Error $e');

      }
    }

  }
}
