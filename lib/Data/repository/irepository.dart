
import 'package:bubbles/models/AceeptRequestModel/AceeptRequestModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/ChoosePollAnswerModel/ChoosePollAnswerModel.dart';
import 'package:bubbles/models/ClearBadgeModel/ClearBadgeModel.dart';
import 'package:bubbles/models/DeleteOldmessagesModel/DeleteOldmessagesModel.dart';
import 'package:bubbles/models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventOldMessagesModel.dart';
import 'package:bubbles/models/Event_CateogoryModel/EventCateogoryModel.dart';
import 'package:bubbles/models/FlowChatModel/FlowChatModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetBubblesModel.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/GetGenderModel/GetGender.dart';
import 'package:bubbles/models/GetInterestsModel/GetInterestsModel.dart';
import 'package:bubbles/models/GetNotificationsModel/GetnotifcationsModel.dart';
import 'package:bubbles/models/GetPointsModel/GetPointsModel.dart';
import 'package:bubbles/models/GetQuestionsModel/GetQuestionsModel.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModell/GetUsersInsideBubbleModel.dart';

import 'package:bubbles/models/GetWhoSavedBubblesModel/GetWhoSavedBubblesModel.dart';
import 'package:bubbles/models/GetbadgeModel/GetbadgeModel.dart';
import 'package:bubbles/models/InOutUserStatusModel/InOutUserStatusModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/NotifyMeCloseToBubbleModel/NotifyMeCloseToBubbleModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/RemoveFrinedModel/RemoveFriendModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:bubbles/models/SendBubbleMessageModel/SendBubbleMessageModel.dart';
import 'package:bubbles/models/SprintsJoinLeaveModel/SprintsJoinLeaveModel.dart';
import 'package:bubbles/models/SprintsLobbyUsersModel/SprintsLobbyUsersModel.dart';
import 'package:bubbles/models/SubmitCreatorAnwersModel/SubmitCreatorAnwersModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:bubbles/models/VerifyProfileModel/VerifyProfileModel.dart';
import 'package:bubbles/models/permissionsModel/PermissionsModel.dart';
import '../../models/AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import '../../models/CreateBubbleModel/CreateBubbleModel.dart';
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

  Future<GetBubblesModel> GetPrimeBubblees( );
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
      int Cateogory_id,
      );
  Future<GetBubblesModel> GetAllBubbles( );
  Future<GetBubblesModel> GetNewBubbles(
      );
  Future<OldMessagesModel> GetLastMessageBetweenMeAndAllUsers(

      );
  Future<OldMessagesModel> GetOldMessages(
      String send_by,
      int Reciver_ID,
      );
  Future<PostMessagesModel> PostMessage(
      String Message,
      String sms_type,
      String send_by,
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
  Future<GetBubblesModel> NearByEventList(
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
      int bubble_id,
      );
  Future<GetUsersInsideBubbleModel> GetUsersInsideBubble(
      int bubble_id,
      );
  Future<GetbadgeModel> Getbadge(
      );
  Future<GetBubblesModel> PopularNowBubbles(
      );
  Future<NotifyMeCloseToBubbleModel> NotifyMeImCloseToBubble(
      String distance,
      String Title,
      );
  Future<SendBubbleMessageModel> SendTopicFlow(
      int bubble_id,
      String content,
      String title,
      int main_type,
      );
  Future<FlowChatModel> GetFlowOldMessages(
      int message_id,
      );
  Future<SendBubbleMessageModel> SendMessageInFlows(
      String message,
      String type,
      int message_id,
      );
  Future<SendBubbleMessageModel> SendReplyInFlows(
      String comment,
      int sub_message_id,
      );
  Future<SendBubbleMessageModel> SendPollFlow(
      String Question,
      int bubble_id,
      List<String> answers,
      bool multi_choice,
      bool show_participants,
      );



  Future<SendBubbleMessageModel> SendFootPrintFlow(

      String title,
      String image,//base64
      int type,//new_poll
      int bubble_id,
      );



  Future<SendBubbleMessageModel> SendMediaDumpFlow(

      String title,
      String image,//base64
      int type,//new_poll
      int bubble_id,
      );


  Future<SaveBubbleModel> SaveBubble(
      int bubble_id,
      );


  Future<GetBubblesModel> GetSavedBubbles(
      int User_id,
      );

  Future<GetWhoSavedBubblesModel> GetWhoSavedBubble(
      int Bubble_id,
      );
  Future<EventCateogoryModel> GetEventCateogories();
  Future<GetBubblesModel> GetActiveBubbles(
      );
  Future<GetBubblesModel> GetUpcomingBubbles(
      );
  Future<GetBubblesModel> NearByPrimes(
      double lat,
      double lng,
      );

  Future<ChoosePollAnswerModel> ChoosePollFlowAnswer(
      int answer_poll_id,
      ) ;


  Future<SprintsJoinLeaveModel> LeaveSprintsLobby(
      int event_id,
      ) ;


  Future<SprintsJoinLeaveModel> JoinSprintsLobby(
      int event_id,
      );


  Future<SprintsLobbyUsersModel> GetAllUsersInLobby(
      int event_id,
      ) ;


  Future<DeleteOldmessagesModel> DeleteOldMessages(
      int receiver_id,
      String send_by,
      );
}
