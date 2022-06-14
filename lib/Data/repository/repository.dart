import 'dart:convert';
import 'dart:io';

import 'package:bubbles/models/AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
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
import 'package:bubbles/models/permissionsModel/PermissionsModel.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/AceeptRequestModel/AceeptRequestModel.dart';
import '../../models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
import '../../models/GetChallengesModel/GetChallengesModel.dart';
import '../http_helper/Ihttp_helper.dart';
import '../prefs_helper/iprefs_helper.dart';
import 'irepository.dart';

class Repository implements IRepository {
  IHttpHelper _ihttpHelper;
  IPrefsHelper _iprefHelper;

  Repository(this._ihttpHelper, this._iprefHelper);


  Future<UserData> GoogleLogin(
      String Email,
      String name,
      String fcmToken,
      String avatar,
      )async{
    final Data = await _ihttpHelper.GoogleLogin(Email, name, fcmToken, avatar);

    return Data;
  }
  
  @override
  Future<UserData> login(String Email,
      String password,
      String fcmToken,) async {
    final Data = await _ihttpHelper.login(Email, password, fcmToken);

    return Data;
  }

  @override
  Future<UserData> SignUp(String Email,
      String password,
      String fcmToken,
      String first_name,
      String last_name,
      int Genter,
      String background_color,
      String bio,
      String birth_date,
      List<int> interests,
      int avatarID,
      String alias,) async {
    final Data = await _ihttpHelper.SignUp(
        Email,
        password,
        fcmToken,
        first_name,
        last_name,
        Genter,
        background_color,
        bio,
        birth_date,
        interests,
        avatarID,
        alias);

    return Data;
  }

  Future<UserData> LoginSocial(String Token,
      String fcmToken,) async {
    final Data = await _ihttpHelper.LoginSocial(Token, fcmToken);

    return Data;
  }

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
      String alias,) async {
    String auth = await _iprefHelper.getToken();
    print(auth);
    final Data = await _ihttpHelper.upDateSocailProfile(
        fcmToken,
        first_name,
        last_name,
        Genter,
        background_color,
        bio,
        birth_date,
        interests,
        avatarid,
        alias,
        auth);
    return Data;
  }

  Future<PermissionsModel> SetPermission(int is_notify,) async {
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.SetPermission(is_notify, auth);
    return Data;
  }

  Future<GetGenderModel> GetGenders() async {
    final Data = await _ihttpHelper.GetGenders();
    return Data;
  }

  Future<GetInterestsModel> GetInterests() async {
    final Data = await _ihttpHelper.GetInterests();
    return Data;
  }

  Future<GetSubGender> GetSubGenders() async {
    final Data = await _ihttpHelper.GetSubGenders();
    return Data;
  }

  Future<GetAvatarsModel> GetAvatars() async {
    final Data = await _ihttpHelper.GetAvatars();
    return Data;
  }

  Future<UpdateBoiModel> updateProfile(String alias, String bio) async {
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.updateProfile(alias, bio, auth);
    return Data;
  }


  Future<ChangeAvatarModel> ChangeAvatar(int AvatarID,) async {
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.ChangeAvatar(AvatarID, auth);
    return Data;
  }


  Future<AddNewFriendModel> AddFriend(String serial,) async {
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.AddFriend(serial, auth);
    return Data;
  }


  Future<RemoveFriendModel> RemoveFriend(int friend_id,) async {
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.RemoveFriend(friend_id, auth);
    return Data;
  }


  Future<GetFriendsModel> GetFreinds() async {
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetFreinds(auth);
    return Data;
  }
  Future<CheckMailModel> CheckEmail(String Email)async{
    final Data = await _ihttpHelper.CheckEmail(Email);
    return Data;
  }
  Future<GetQuestionsModel> QuestionCreator()async{

    final Data = await _ihttpHelper.QuestionCreator();
    return Data;
  }
  Future<SubmitCreatorAnwersModel> CreatorSubmit(
      List<int> Answers,
      List<int> questions,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.CreatorSubmit(Answers,auth, questions);
    return Data;
  }

  Future<FreindRequestsModel> FreindRequests()async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.FreindRequests(auth);
    return Data;

  }
  Future<ProfileDateModel> GetProfile()async{//todo : implement this on profile screen
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetProfile(auth);
    return Data;
  }
  Future<DenyFriendRequestModel> DenyRequest(
      int  friend_id,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.DenyRequest(friend_id, auth);
    return Data;
  }
  Future<AceeptRequestModel> AceeptRequest(
      int  friend_id,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.AceeptRequest(friend_id, auth);
    return Data;
  }
  Future<LogoutModel> Logout(
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.Logout(auth);
    return Data;
  }
  Future<AddFreindBarCodeModel> AddFreindWithBarCode(
      String serial,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.AddFreindWithBarCode(serial, auth);
    return Data;
  }

  Future<SuggestFriendsModel> SuggestFreinds()async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.SuggestFreinds(auth);
    return Data;
  }
  Future<GetnotifcationsModel> GetNotifications()async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetNotifications(auth);
    return Data;
  }
  Future<VerifyProfileModel> VerifyProfile(
      String Image2,
      String Image1,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.VerifyProfile(Image2, Image1, auth);
    return Data;
  }

  Future<GetChallengesModel> GetChallenges( )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetChallenges(auth);
    return Data;
  }
  Future<GetPointsModel> GetPoints(
      int challenge_id,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetPoints(challenge_id, auth);
    return Data;
  }

  Future<GetPrimeBubblesModel> GetPrimeBubblees()async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetPrimeBubblees(auth);
    return Data;
  }

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
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.CreateBubble(auth, title, location, images, color, description, organizers, start_event_date, end_event_date, dates, lng, lat, radius);
    return Data;
  }

  Future<GetPrimeBubblesModel> GetAllBubbles( )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetAllBubbles(auth);
    return Data;
  }

  Future<GetPrimeBubblesModel> GetNewBubbles(
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetNewBubbles(auth);
    return Data;
  }
  Future<OldMessagesModel> GetLastMessageBetweenMeAndAllUsers(
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetLastMessageBetweenMeAndAllUsers(auth);
    return Data;
  }
  Future<OldMessagesModel> GetOldMessages(
      int Reciver_ID,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetOldMessages(auth, Reciver_ID);
    return Data;
  }
  Future<PostMessagesModel> PostMessage(
      String Message,
      int Reciver_ID,
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.PostMessage(auth, Message, Reciver_ID);
    return Data;
  }
  Future<GetAliasModel> GetAlias(
      int friend_id
      )async{
    String auth = await _iprefHelper.getToken();
    final Data = await _ihttpHelper.GetAlias(auth, friend_id);
    return Data;
  }

}
