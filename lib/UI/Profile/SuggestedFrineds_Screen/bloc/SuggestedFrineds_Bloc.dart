// import 'package:bloc/bloc.dart';
// import 'package:bubbles/Data/repository/irepository.dart';
// import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
// import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/pages/SuggestedFrineds_screen.dart';
// import 'package:bubbles/core/Colors/constants.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'SuggestedFrineds_event.dart';
// import 'SuggestedFrineds_state.dart';
//
//
// class SuggestedFrinedsBloc extends Bloc<SuggestedFrinedsEvent, SuggestedFreindsState> {
//   IRepository _repository;
//
//   SuggestedFrinedsBloc(this._repository) : super(SuggestedFreindsState.initail()) ;
//
//   @override
//   SuggestedFreindsState get initialState => SuggestedFreindsState.initail();
//
//   @override
//   Stream<SuggestedFreindsState> mapEventToState(
//       SuggestedFrinedsEvent event,
//       ) async* {
//
//     if (event is ClearError) {
//       yield state.rebuild((b) => b..error = "");
//     }
//
//     if (event is GetSuggestedFriends){
//       try {
//         yield state.rebuild((b) => b
//           ..isLoading = true
//           ..error = ""
//           ..success = false
//           ..SuggestFriends = null
//         );
//
//         final date = await _repository.SuggestFreinds();
//         print('get Success data $date');
//         yield state.rebuild((b) => b
//           ..isLoading = true
//           ..error = ""
//           ..success = false
//           ..SuggestFriends.replace(date)
//         );
//         for (int i =0;i<state.SuggestFriends!.users!.length;i++){
//           Data Dataa =Data();
//           Dataa.Color = state.SuggestFriends!.users![i].background_color.toString();
//           Dataa.Alias = state.SuggestFriends!.users![i].alias.toString();
//           Dataa.AvatarPath = state.SuggestFriends!.users![i].avatar.toString();
//           Dataa.Serial_Number = state.SuggestFriends!.users![i].serialnumber.toString();
//           Dataa.MY_id = state.SuggestFriends!.users![i].me_id;
//           Dataa.His_id = state.SuggestFriends!.users![i].id;
//           state.ListOFSUggested!.add(Dataa);
//         }
//
//         yield state.rebuild((b) => b
//           ..isLoading = false
//           ..error = ""
//           ..success = true
//         );
//
//
//       } catch (e) {
//         print('get Error $e');
//         yield state.rebuild((b) => b
//           ..isLoading = false
//           ..error = "Something went wrong"
//           ..success = false
//           ..SuggestFriends = null
//         );
//       }
//     }
//
//     if (event is AddFrined) {
//       try {
//         yield state.rebuild((b) => b
//           ..FreindAddlOADING = true
//           ..error = ""
//           ..AddFreindSuccess = false
//           ..AddNewFriend = null
//         );
//
//         final date = await _repository.AddFriend(event.serial!);
//
//         print('get Success data ${date}');
//         yield state.rebuild((b) =>
//         b
//           ..FreindAddlOADING = false
//           ..error = ""
//           ..AddFreindSuccess = true
//           ..AddNewFriend.replace(date)
//         );
//       } catch (e) {
//         print('get Error $e');
//         yield state.rebuild((b) =>
//         b
//           ..FreindAddlOADING = false
//           ..error = "Something went wrong"
//           ..AddFreindSuccess = false
//           ..AddNewFriend = null
//         );
//       }
//     }
//
//
//     if (event is DeleteFromList) {
//       try {
//
//
//         state.ListOFSUggested!.removeAt(event.index!);
//
//       } catch (e) {
//         print('get Error $e');
//         yield state.rebuild((b) =>
//         b
//           ..FreindAddlOADING = false
//           ..error = "Something went wrong"
//           ..AddFreindSuccess = false
//           ..AddNewFriend = null
//         );
//       }
//     }
//   }
// }
