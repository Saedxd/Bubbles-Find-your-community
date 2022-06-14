// ignore_for_file: non_constant_identifier_names, file_names

library FriendRequest_event;


import 'package:built_value/built_value.dart';


part 'FriendRequest_event.g.dart';

abstract class FriendRequestEvent {}

abstract class Toggle extends FriendRequestEvent
    implements Built<Toggle,ToggleBuilder> {

  Toggle._();
  factory Toggle([updates(ToggleBuilder b)]) = _$Toggle;
}
abstract class FreindsRequests extends FriendRequestEvent
    implements Built<FreindsRequests,FreindsRequestsBuilder> {

  FreindsRequests._();
  factory FreindsRequests([updates(FreindsRequestsBuilder b)]) = _$FreindsRequests;
}

abstract class AceeptRequest extends FriendRequestEvent
    implements Built<AceeptRequest,AceeptRequestBuilder> {
int? get friend_id;

  AceeptRequest._();
  factory AceeptRequest([updates(AceeptRequestBuilder b)]) = _$AceeptRequest;
}


abstract class DenyRequest extends FriendRequestEvent
    implements Built<DenyRequest,DenyRequestBuilder> {
  int? get friend_id;

  DenyRequest._();
  factory DenyRequest([updates(DenyRequestBuilder b)]) = _$DenyRequest;
}
