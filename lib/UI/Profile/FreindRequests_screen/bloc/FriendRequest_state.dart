// // ignore_for_file: file_names
//
// library FriendRequest_state;
//
// import 'package:bubbles/models/AceeptRequestModel/AceeptRequestModel.dart';
// import 'package:bubbles/models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
// import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
// import 'package:built_value/built_value.dart';
//
//
//
// part 'FriendRequest_state.g.dart';
//
//
// abstract class FreindRequestState implements Built<FreindRequestState,FreindRequestStateBuilder> {
//   // fields go here
//
//   String? get error;
//   bool? get isLoading;
//   bool? get success;
//
//   FreindRequestsModel? get FreindRequests;
//   DenyFriendRequestModel? get DenyFriendRequest;
//   AceeptRequestModel? get AceeptRequest;
//
//
//   FreindRequestState._();
//
//   factory FreindRequestState([updates(FreindRequestStateBuilder b)]) = _$FreindRequestState;
//   factory FreindRequestState.initail() {
//     return FreindRequestState((b) => b
//       ..error = ""
//       ..isLoading = false
//       ..success = false
//         ..FreindRequests =null
//         ..DenyFriendRequest=null
//         ..AceeptRequest=null
//     );
//   }
// }
