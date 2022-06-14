
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_Event.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_State.dart';



class CreatorBloc extends Bloc<CreatorEvent, CreatorState> {

  IRepository _repository;

  CreatorBloc(this._repository) : super(CreatorState.initail()) ;

  @override
  CreatorState get initialState => CreatorState.initail();

  @override
  Stream<CreatorState> mapEventToState(
      CreatorEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b
        ..error = ""
      );
    }

    if (event is GetQuestions) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..Questions = null
        );

        final date = await _repository.QuestionCreator();


        print('get Success data ${date}');
        yield state.rebuild((b) =>b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..Questions.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..Questions = null
        );
      }
    }

    if (event is SubmitAnswers){
      try {


        final date = await _repository.CreatorSubmit(event.AnswerID!,event.QuestionId!);

        print('get Success data ${date}');

        yield state.rebuild((b) =>b
          ..error = ""
          ..success = true
          ..CreatorAnwers.replace(date)

        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..error = "Something went wrong"
          ..success = false
          ..CreatorAnwers = null
        );
      }
    }

  }
}
