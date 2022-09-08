
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class CreatorMain_Bloc extends Bloc<SeeAllEvent, SeeAllState> {




  IRepository _repository;

  CreatorMain_Bloc(this._repository) : super(SeeAllState.initail()) ;

  @override
  SeeAllState get initialState => SeeAllState.initail();

  @override
  Stream<SeeAllState> mapEventToState(
      SeeAllEvent event,
      ) async* {



  }
}


