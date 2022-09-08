
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/CreatorPage/HisCreatorPage/CreatorMain/bloc/CreatorMain_Event.dart';
import 'package:bubbles/UI/CreatorPage/HisCreatorPage/CreatorMain/bloc/CreatorMain_State.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class CreatorMain_Bloc extends Bloc<CreatorMainEvent, CreatorMainState> {




  IRepository _repository;

  CreatorMain_Bloc(this._repository) : super(CreatorMainState.initail()) ;

  @override
  CreatorMainState get initialState => CreatorMainState.initail();

  @override
  Stream<CreatorMainState> mapEventToState(
      CreatorMainEvent event,
      ) async* {



  }
}


