
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_State.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_State.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/Subscribers_Screen/bloc/Subscribers_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/Subscribers_Screen/bloc/Subscribers_State.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';





class SubscribersBloc extends Bloc<SubscribersEvent, SubscribersState> {


  IRepository _repository;

  SubscribersBloc(this._repository) : super(SubscribersState.initail()) ;

  @override
  SubscribersState get initialState => SubscribersState.initail();

  @override
  Stream<SubscribersState> mapEventToState(
      SubscribersEvent event,
      ) async* {



  }
}


