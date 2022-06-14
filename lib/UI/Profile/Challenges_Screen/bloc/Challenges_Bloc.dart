import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Challenges_Event.dart';
import 'Challenges_State.dart';


class ChallengesBloc extends Bloc<ChallengesEvent, ChallengesState> {

  IRepository _repository;


  ChallengesBloc(this._repository) : super(ChallengesState.initail()) ;

  @override
  ChallengesState get initialState => ChallengesState.initail();

  @override
  Stream<ChallengesState> mapEventToState(
      ChallengesEvent event,
      ) async* {

    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is GetChallenges) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetChallenges = null
        );

        final date = await _repository.GetChallenges();

        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..GetChallenges.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetChallenges = null
        );
      }
    }

    if (event is GetPoints) {
      try {
        yield state.rebuild((b) => b
          ..GetPointsisLoading = true
          ..error = ""
          ..GetPointsSuccess = false
          ..GetPoints = null
        );

        final date = await _repository.GetPoints(event.ChallengeId!);

        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..GetPointsisLoading = false
          ..error = ""
          ..GetPointsSuccess = true
          ..GetPoints.replace(date)
        );
      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..GetPointsisLoading = false
          ..error = "Something went wrong"
          ..GetPointsSuccess = false
          ..GetPoints = null
        );
      }
    }

  }
}

