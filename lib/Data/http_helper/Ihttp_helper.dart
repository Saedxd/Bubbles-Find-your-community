// ignore_for_file: file_names

import 'dart:io';

import 'package:bubbles/models/AceeptRequestModel/AceeptRequestModel.dart';
import 'package:bubbles/models/AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:bubbles/models/GetGenderModel/GetGender.dart';
import 'package:bubbles/models/GetInterestsModel/GetInterestsModel.dart';
import 'package:bubbles/models/GetNotificationsModel/GetnotifcationsModel.dart';
import 'package:bubbles/models/GetPointsModel/GetPointsModel.dart';
import 'package:bubbles/models/GetQuestionsModel/GetQuestionsModel.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/RemoveFrinedModel/RemoveFriendModel.dart';
import 'package:bubbles/models/SubmitCreatorAnwersModel/SubmitCreatorAnwersModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:bubbles/models/VerifyProfileModel/VerifyProfileModel.dart';
import 'package:built_collection/src/list.dart';
import 'package:built_collection/built_collection.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/GetFriendsModel/GetFriendsModel.dart';
import '../../models/permissionsModel/PermissionsModel.dart';



abstract class IHttpHelper {



  Future<UserData> GoogleLogin(
      String Email,
      String password,
      String fcmToken,
      String avatar,
      );

  Future<UserData> login(
      String Email,
      String password,
      String fcmToken,
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
      int avatarid,
      String alias,
  );
  Future<UserData> LoginSocial(
      String Token,
      String fcmToken,
      );
  Future<PermissionsModel> SetPermission(
      int is_notify,
      String Auth
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
      String auth
      );
  Future<GetQuestionsModel> QuestionCreator();
  Future<GetGenderModel> GetGenders();
  Future<GetInterestsModel> GetInterests();
  Future<GetSubGender> GetSubGenders();
  Future<GetAvatarsModel> GetAvatars();
  Future<UpdateBoiModel> updateProfile(String alias,String bio,String auth);
  Future<ChangeAvatarModel> ChangeAvatar(int AvatarID, String auth);
  Future<AddNewFriendModel> AddFriend(String serial,String auth);
  Future<RemoveFriendModel> RemoveFriend(int friend_id,String auth);
  Future<GetFriendsModel> GetFreinds(String auth);
  Future<CheckMailModel> CheckEmail(String Email);
  Future<FreindRequestsModel> FreindRequests(String Auth);
  Future<ProfileDateModel> GetProfile(String Auth);
  Future<SuggestFriendsModel> SuggestFreinds(
      String Auth,
      );
  Future<AddFreindBarCodeModel> AddFreindWithBarCode(
      String serial,
      String Auth,
      );
  Future<LogoutModel> Logout(
      String Auth,
      );
  Future<AceeptRequestModel> AceeptRequest(
      int  friend_id,
      String Auth,
      );
  Future<DenyFriendRequestModel> DenyRequest(
      int  friend_id,
      String Auth,
      );
  Future<SubmitCreatorAnwersModel> CreatorSubmit(
      List<int> Answers,
      String Auth,
      List<int> questions,
      );
  Future<GetnotifcationsModel> GetNotifications(
      String Auth,
      );
  Future<VerifyProfileModel> VerifyProfile(
      String Image2,
      String Image1,
      String Auth,
      );

  Future<GetPointsModel> GetPoints(
      int challenge_id,
      String Auth
      );

  Future<GetChallengesModel> GetChallenges(
      String Auth,
      );

  Future<GetPrimeBubblesModel> GetPrimeBubblees(
      String Auth,
      );

  Future<CreateBubbleModel> CreateBubble(
      String Auth,
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

  Future<GetPrimeBubblesModel> GetAllBubbles(
      String Auth,
      );
  Future<GetPrimeBubblesModel> GetNewBubbles(
      String Auth,
      );
  Future<OldMessagesModel> GetLastMessageBetweenMeAndAllUsers(
      String Auth,
      );
  Future<OldMessagesModel> GetOldMessages(
      String Auth,
      int Reciver_ID,
      );
  Future<PostMessagesModel> PostMessage(
      String Auth,
      String Message,
      int Reciver_ID,
      );
  Future<GetAliasModel> GetAlias(
      String Auth,
      int friend_id
      );
}
//ihttp_helper is the abstaction class for http_helper
