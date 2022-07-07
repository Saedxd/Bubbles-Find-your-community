
import 'package:bubbles/models/AceeptRequestModel/AceeptRequestModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/ClearBadgeModel/ClearBadgeModel.dart';
import 'package:bubbles/models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventOldMessagesModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/GetGenderModel/GetGender.dart';
import 'package:bubbles/models/GetInterestsModel/GetInterestsModel.dart';
import 'package:bubbles/models/GetNotificationsModel/GetnotifcationsModel.dart';
import 'package:bubbles/models/GetPointsModel/GetPointsModel.dart';
import 'package:bubbles/models/GetQuestionsModel/GetQuestionsModel.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/GetUsersInsideBubbleModel.dart';
import 'package:bubbles/models/GetbadgeModel/GetbadgeModel.dart';
import 'package:bubbles/models/InOutUserStatusModel/InOutUserStatusModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/RemoveFrinedModel/RemoveFriendModel.dart';
import 'package:bubbles/models/SendBubbleMessageModel/SendBubbleMessageModel.dart';
import 'package:bubbles/models/SubmitCreatorAnwersModel/SubmitCreatorAnwersModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:bubbles/models/VerifyProfileModel/VerifyProfileModel.dart';
import 'package:bubbles/models/permissionsModel/PermissionsModel.dart';
import 'package:built_collection/src/list.dart';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import '../../models/CreateBubbleModel/CreateBubbleModel.dart';
import '../../models/GetBubblesModel/GetPrimeBubblesModel.dart';
import '../../models/OldMessagesModel/OldMessagesModel.dart';



abstract class IRepository {

  Future<UserData> login(
      String Email,
      String password,
      String fcmToken,
      );
  Future<UserData> GoogleLogin(
      String Email,
      String name,
      String fcmToken,
      String avatar,
      );
  Future<UserData> SignUp(
      String Email,
      String password,
      String fcmToken,
      String first_name,
      String last_name,
      int Genter,
      String background_color,
      String bio,
      String birth_date,
      List<int> interests,
      int AvatarID,
      String alias,
      );
  Future<UserData> LoginSocial(
      String Token,
      String fcmToken,
      );
  Future<PermissionsModel> SetPermission(
      int is_notify,
      );
  Future<UpdateProfile> upDateSocailProfile(
      String fcmToken,
      String first_name,
      String last_name,
      int Genter,
      String background_color,
      String bio,
      String birth_date,
      List<int> interests,
      int avatarid,
      String alias,
      );
  Future<GetGenderModel> GetGenders();
  Future<GetInterestsModel> GetInterests();
  Future<GetSubGender> GetSubGenders();
  Future<GetAvatarsModel> GetAvatars();
  Future<UpdateBoiModel> updateProfile(String alias,String bio);
  Future<ChangeAvatarModel> ChangeAvatar(int AvatarID,);
  Future<AddNewFriendModel> AddFriend(String serial,);
  Future<RemoveFriendModel> RemoveFriend(int friend_id,);
  Future<GetFriendsModel> GetFreinds();
  Future<CheckMailModel> CheckEmail(String Email);
  Future<GetQuestionsModel> QuestionCreator();
  Future<FreindRequestsModel> FreindRequests();
  Future<ProfileDateModel> GetProfile();
  Future<SuggestFriendsModel> SuggestFreinds(
      );
  Future<AddFreindBarCodeModel> AddFreindWithBarCode(
      String serial,
      );
  Future<LogoutModel> Logout(
      );
  Future<DenyFriendRequestModel> DenyRequest(
      int  friend_id,
      );
  Future<AceeptRequestModel> AceeptRequest(
      int  friend_id,
      );
  Future<SubmitCreatorAnwersModel> CreatorSubmit(
      List<int> Answers,
      List<int> questions,
      );
  Future<GetnotifcationsModel> GetNotifications( );
  Future<VerifyProfileModel> VerifyProfile(
      String Image2,
      String Image1,
      );
  Future<GetChallengesModel> GetChallenges( );

  Future<GetPointsModel> GetPoints(
      int challenge_id,
      );

  Future<GetPrimeBubblesModel> GetPrimeBubblees( );
  Future<CreateBubbleModel> CreateBubble(
      String title,
      String location,
      List<String> images,
      String color,
      String description,
      List<int> organizers,
      String start_event_date,
      String end_event_date,
      List<String> dates,
      double lng,
      double lat,
      int radius,
      );
  Future<GetPrimeBubblesModel> GetAllBubbles( );
  Future<GetPrimeBubblesModel> GetNewBubbles(
      );
  Future<OldMessagesModel> GetLastMessageBetweenMeAndAllUsers(

      );
  Future<OldMessagesModel> GetOldMessages(
      int Reciver_ID,
      );
  Future<PostMessagesModel> PostMessage(
      String Message,
      int Reciver_ID,
      );
  Future<GetAliasModel> GetAlias(
      int friend_id
      );
  Future<AddreplyModel> AddReply(
      String comment,
      int message_id,
      );
  Future<GetDetailedEvent> GetEventDetails(
      int Event_id,
      );
  Future<AddreplyModel> RemoveFromDirect(

      int receiver_id,
      );
  Future<OldMessagesModel> SearchDMlistt(
      String Keyword,
      );
  Future<FriendListSearchModel> SearchFriendList(
      String Keyword,
      );
  Future<GetPrimeBubblesModel> NearByEventList(
      double lat,
      double lng,
      );
  Future<GetDetailedEvent> SearchEventLists(     //TODO: FIX RETURN TYPE
      String Keyword,
      );
  Future<ClearBadgeModel> ClearBadge();

  Future<SendBubbleMessageModel> SendMessageEVENT(
      String type,
      String message,
      int Event_id,
      int main_type,
      );


  Future<SendBubbleMessageModel> SendReplyMessageEVENT(
      String comment,
      int message_id,
      );



  Future<InOutUserStatusModel> ChangeUserStatusToOut(
      int bubble_id,
      );


  Future<InOutUserStatusModel> ChangeUserStatusToIN(
      int bubble_id,
      );
  Future<EventOldMessagesModel> GetEventMessages(
      int bubble_id
      );
  Future<GetUsersInsideBubbleModel> GetUsersInsideBubble(
      int bubble_id,
      );
  Future<GetbadgeModel> Getbadge(
      );

}
