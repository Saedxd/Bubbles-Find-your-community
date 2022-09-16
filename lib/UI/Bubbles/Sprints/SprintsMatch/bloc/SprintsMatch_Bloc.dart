
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_Event.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_state.dart';
import 'package:bubbles/UI/Bubbles/Sprints/SprintsMatch/bloc/SprintsMatch_Event.dart';
import 'package:bubbles/UI/Bubbles/Sprints/SprintsMatch/bloc/SprintsMatch_state.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/Classes/Classes.dart';

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;



class SprintsMatchBloc extends Bloc<SprintsMatchEvent, SprintsMatchState> {


  IRepository _repository;
  //
  // void sendMessage(String message, String UserDestination_ID,int message_id,String type) {
  //   print("EMITTTEDDDD $UserDestination_ID");
  //
  //   socket!.emit("send_message",
  //       {  "message":"$type$message",
  //         "to": UserDestination_ID.toString(),
  //         "message_id":message_id,
  //       });
  // }
  //
  // void sendReply(
  //     String message, int UserDestination_ID, String Comment, String MessageDirection_type,String Message_type) {
  //
  //   socket!.emit("send_reply", {
  //     "message": "$Message_type${message.toString()}",
  //     "to": UserDestination_ID.toString(),
  //     "comment": Comment,
  //     "type": MessageDirection_type
  //   });
  //   print("Emitted");
  // }


  SprintsMatchBloc(this._repository) : super(SprintsMatchState.initail()) ;

  @override
  SprintsMatchState get initialState => SprintsMatchState.initail();

  @override
  Stream<SprintsMatchState> mapEventToState(
      SprintsMatchEvent event,
      ) async* {




  }
}


