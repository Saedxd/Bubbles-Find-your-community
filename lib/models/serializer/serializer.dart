library serializer;

import 'package:bubbles/models/AceeptRequestModel/AceeptRequestModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/ChoosePollAnswerModel/ChoosePollAnswerModel.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/DeleteOldmessagesModel/DeleteOldmessagesModel.dart';
import 'package:bubbles/models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventMessagesListModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventOldMessagesModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventdetialMessageModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/NewPollAnswersModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/PollParticipantsModel.dart';
import 'package:bubbles/models/Event_CateogoryModel/CateogoryList.dart';
import 'package:bubbles/models/Event_CateogoryModel/EventCateogoryModel.dart';
import 'package:bubbles/models/FlowChatModel/FlowChatModel.dart';
import 'package:bubbles/models/FlowChatModel/FlowMessagesModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FreindsFilteredListModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
import 'package:bubbles/models/FreindRequestsModel/UsersRequestsModel.dart';
import 'package:bubbles/models/GetAliasModel/FreindModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetAvatarsModel/AvatarListModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetBubblesModel/CreatedByModel.dart';
import 'package:bubbles/models/GetBubblesModel/DataPrimeBubbles.dart';
import 'package:bubbles/models/GetBubblesModel/DatesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/EventCategoryModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetBubblesModel.dart';
import 'package:bubbles/models/GetBubblesModel/ImagesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/OrganizersListModel.dart';
import 'package:bubbles/models/GetBubblesModel/UserMadeBubbleModel.dart';
import 'package:bubbles/models/GetChallengesModel/ChallengesListModel.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/GetFriendsModel/FriendsListModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/GetGenderModel/GendersListModel.dart';
import 'package:bubbles/models/GetGenderModel/GetGender.dart';
import 'package:bubbles/models/GetInterestsModel/GetInterestsModel.dart';
import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:bubbles/models/GetNotificationsModel/GetnotifcationsModel.dart';
import 'package:bubbles/models/GetPointsModel/GetPointsModel.dart';
import 'package:bubbles/models/GetQuestionsModel/AnswersListModel.dart';
import 'package:bubbles/models/GetQuestionsModel/GetQuestionsModel.dart';
import 'package:bubbles/models/GetQuestionsModel/QuestionsListModel.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/GetSubGenders/SubgendersListModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/GetUsersInsideBubbleModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/UsersInsideBubbleListModel.dart';
import 'package:bubbles/models/GetWhoSavedBubblesModel/GetWhoSavedBubblesModel.dart';
import 'package:bubbles/models/GetbadgeModel/GetbadgeModel.dart';
import 'package:bubbles/models/InOutUserStatusModel/InOutUserStatusModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/NotifyMeCloseToBubbleModel/NotifyMeCloseToBubbleModel.dart';
import 'package:bubbles/models/OldMessagesModel/MessagesListModel.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:bubbles/models/ProfileDataModel/InterestsProfileModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/ProfileDataModel/UserProfileData.dart';
import 'package:bubbles/models/RemoveFrinedModel/RemoveFriendModel.dart';
import 'package:bubbles/models/RemoveFromDirectModel/RemoveFromDirectModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:bubbles/models/SearchFrinedsModel/SearchFrinedsModel.dart';
import 'package:bubbles/models/SearchFrinedsModel/UserModell.dart';
import 'package:bubbles/models/SendBubbleMessageModel/SendBubbleMessageModel.dart';
import 'package:bubbles/models/SprintsJoinLeaveModel/SprintsJoinLeaveModel.dart';
import 'package:bubbles/models/SprintsLobbyUsersModel/SprintsLobbyUsersModel.dart';
import 'package:bubbles/models/SubmitCreatorAnwersModel/SubmitCreatorAnwersModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestedListModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UserDataModel/User.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:bubbles/models/UserDataModel/DataModel.dart';
import 'package:bubbles/models/VerifyProfileModel/VerifyProfileModel.dart';
import 'package:bubbles/models/permissionsModel/PermissionsModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import '../AddReplyModel/AddreplyModel.dart';
import '../ClearBadgeModel/ClearBadgeModel.dart';
import '../GetNotificationsModel/NotificationsListModel.dart';
import '../OldMessagesModel/ReplieslISTModel.dart';


part 'serializer.g.dart';


@SerializersFor([
 //model class name
  EventCateogoryModel,
  CateogoryList,
  SaveBubbleModel,
  NotifyMeCloseToBubbleModel,
  GetUsersInsideBubbleModel,
  InOutUserStatusModel,
  SendBubbleMessageModel,
  FriendListSearchModel,
  FreindsFilteredListModel,
  // DataEventDetailModel,
  GetDetailedEvent,
  ChoosePollAnswerModel,
  SprintsJoinLeaveModel,
  SearchFrinedsModel,
  UserModell,
  ReplieslISTModel,
  GetAliasModel,
  MessagesListModel,
  OldMessagesModel,
  PostMessagesModel,
  ChallengesListModel,
  GetChallengesModel,
  GetnotifcationsModel,
  NotificationsListModel,
  DenyFriendRequestModel,
  AceeptRequestModel,
  FreindRequestsModel,
  UsersRequestsModel,
  SubmitCreatorAnwersModel,
  GetQuestionsModel,
  QuestionsListModel,
  AnswersListModel,
  UpdateProfile,
  PermissionsModel,
  DateModel,
  UserModel,
  UserData,
  AddNewFriendModel,
  ChangeAvatarModel,
  AvatarListModel,
  GetAvatarsModel,
  FriendsListModel,
  GetFriendsModel,
  GendersListModel,
  GetGenderModel,
  GetInterestsModel,
  InterestsListModel,
  GetSubGender,
  SubgendersListModel,
  RemoveFriendModel,
  SuggestedListModel,
  SuggestFriendsModel,
  UpdateBoiModel,
  CheckMailModel,
  InterestsProfileModel,
  ProfileDateModel,
  UserProfileData,
  LogoutModel,
  AddFreindBarCodeModel,
  VerifyProfileModel,
  GetPointsModel,
  CreateBubbleModel,
  CreatedByModel,
  DataPrimeBubbles,
  GetBubblesModel,
  ImagesEventListModel,
  OrganizersListModel,
  UserMadeBubbleModel,
  DatesEventListModel,
  FreindModel,
  AddreplyModel,
  RemoveFromDirectModel,
  ClearBadgeModel,
  EventOldMessagesModel,
  EventMessagesListModel,
  EventdetialMessageModel,
  GetbadgeModel,
  NewPollAnswersModel,
  FlowChatModel,
  FlowMessagesModel,
  GetWhoSavedBubblesModel,
  EventCategoryModel,
  PollParticipantsModel,
  DeleteOldmessagesModel,
  SprintsLobbyUsersModel
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(RemoveFromDirectModel),
        ],
      )),
          () => ListBuilder<RemoveFromDirectModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SprintsLobbyUsersModel),
        ],
      )),
          () => ListBuilder<SprintsLobbyUsersModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(DeleteOldmessagesModel),
        ],
      )),
          () => ListBuilder<DeleteOldmessagesModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SprintsJoinLeaveModel),
        ],
      )),
          () => ListBuilder<SprintsJoinLeaveModel>())

  //  ,
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(PollParticipantsModel),
        ],
      )),
          () => ListBuilder<PollParticipantsModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ChoosePollAnswerModel),
        ],
      )),
          () => ListBuilder<ChoosePollAnswerModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(EventCategoryModel),
        ],
      )),
          () => ListBuilder<EventCategoryModel>())
  //
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(CateogoryList),
        ],
      )),
          () => ListBuilder<CateogoryList>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(EventCateogoryModel),
        ],
      )),
          () => ListBuilder<EventCateogoryModel>())
  //  ,
//   ,
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetWhoSavedBubblesModel),
        ],
      )),
          () => ListBuilder<GetWhoSavedBubblesModel>())
  //
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SaveBubbleModel),
        ],
      )),
          () => ListBuilder<SaveBubbleModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FlowChatModel),
        ],
      )),
          () => ListBuilder<FlowChatModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FlowMessagesModel),
        ],
      )),
          () => ListBuilder<FlowMessagesModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(NewPollAnswersModel),
        ],
      )),
          () => ListBuilder<NewPollAnswersModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(NotifyMeCloseToBubbleModel),
        ],
      )),
          () => ListBuilder<NotifyMeCloseToBubbleModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetUsersInsideBubbleModel),
        ],
      )),
          () => ListBuilder<GetUsersInsideBubbleModel>())
  //
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetbadgeModel),
        ],
      )),
          () => ListBuilder<GetbadgeModel>())
  //
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(InOutUserStatusModel),
        ],
      )),
          () => ListBuilder<InOutUserStatusModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(EventOldMessagesModel),
        ],
      )),
          () => ListBuilder<EventOldMessagesModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(EventdetialMessageModel),
        ],
      )),
          () => ListBuilder<EventdetialMessageModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(EventMessagesListModel),
        ],
      )),
          () => ListBuilder<EventMessagesListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SendBubbleMessageModel),
        ],
      )),
          () => ListBuilder<SendBubbleMessageModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ClearBadgeModel),
        ],
      )),
          () => ListBuilder<ClearBadgeModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FriendListSearchModel),
        ],
      )),
          () => ListBuilder<FriendListSearchModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FreindsFilteredListModel),
        ],
      )),
          () => ListBuilder<FreindsFilteredListModel>())


  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UserModell),
        ],
      )),
          () => ListBuilder<UserModell>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SearchFrinedsModel),
        ],
      )),
          () => ListBuilder<SearchFrinedsModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetDetailedEvent),
        ],
      )),
          () => ListBuilder<GetDetailedEvent>())
  // ..addBuilderFactory(
  //     (const FullType(
  //       BuiltList,
  //       [
  //         FullType(DataEventDetailModel),
  //       ],
  //     )),
  //         () => ListBuilder<DataEventDetailModel>())
  //  ,
//   ,
//   ,
//   ,
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(CheckMailModel),
        ],
      )),
          () => ListBuilder<CheckMailModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ReplieslISTModel),
        ],
      )),
          () => ListBuilder<ReplieslISTModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(AddreplyModel),
        ],
      )),
          () => ListBuilder<AddreplyModel>())
  //
  //
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FreindModel),
        ],
      )),
          () => ListBuilder<FreindModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetAliasModel),
        ],
      )),
          () => ListBuilder<GetAliasModel>())
  //
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(PostMessagesModel),
        ],
      )),
          () => ListBuilder<PostMessagesModel>())
  ..addBuilderFactory(

      (const FullType(
        BuiltList,
        [
          FullType(OldMessagesModel),
        ],
      )),
          () => ListBuilder<OldMessagesModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(MessagesListModel),
        ],
      )),
          () => ListBuilder<MessagesListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(DatesEventListModel),
        ],
      )),
          () => ListBuilder<DatesEventListModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(CreateBubbleModel),
        ],
      )),
          () => ListBuilder<CreateBubbleModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(CreatedByModel),
        ],
      )),
          () => ListBuilder<CreatedByModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(DataPrimeBubbles),
        ],
      )),
          () => ListBuilder<DataPrimeBubbles>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetBubblesModel),
        ],
      )),
          () => ListBuilder<GetBubblesModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ImagesEventListModel),
        ],
      )),
          () => ListBuilder<ImagesEventListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(OrganizersListModel),
        ],
      )),
          () => ListBuilder<OrganizersListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UserMadeBubbleModel),
        ],
      )),
          () => ListBuilder<UserMadeBubbleModel>())

//  ,
//   ,
//   ,
//   ,
//   ,
//   ,
//   ,

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetPointsModel),
        ],
      )),
          () => ListBuilder<GetPointsModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetChallengesModel),
        ],
      )),
          () => ListBuilder<GetChallengesModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ChallengesListModel),
        ],
      )),
          () => ListBuilder<ChallengesListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(VerifyProfileModel),
        ],
      )),
          () => ListBuilder<VerifyProfileModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(NotificationsListModel),
        ],
      )),
          () => ListBuilder<NotificationsListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetnotifcationsModel),
        ],
      )),
          () => ListBuilder<GetnotifcationsModel>())


  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(AddFreindBarCodeModel),
        ],
      )),
          () => ListBuilder<AddFreindBarCodeModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(LogoutModel),
        ],
      )),
          () => ListBuilder<LogoutModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UserProfileData),
        ],
      )),
          () => ListBuilder<UserProfileData>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ProfileDateModel),
        ],
      )),
          () => ListBuilder<ProfileDateModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(InterestsProfileModel),
        ],
      )),
          () => ListBuilder<InterestsProfileModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(AceeptRequestModel),
        ],
      )),
          () => ListBuilder<AceeptRequestModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(DenyFriendRequestModel),
        ],
      )),
          () => ListBuilder<DenyFriendRequestModel>())
  // ,
//   ,
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UsersRequestsModel),
        ],
      )),
          () => ListBuilder<UsersRequestsModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FreindRequestsModel),
        ],
      )),
          () => ListBuilder<FreindRequestsModel>())
  // ,
//   ,
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SubmitCreatorAnwersModel),
        ],
      )),
          () => ListBuilder<SubmitCreatorAnwersModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UpdateProfile),
        ],
      )),
          () => ListBuilder<UpdateProfile>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetQuestionsModel),
        ],
      )),
          () => ListBuilder<GetQuestionsModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(QuestionsListModel),
        ],
      )),
          () => ListBuilder<QuestionsListModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(AnswersListModel),
        ],
      )),
          () => ListBuilder<AnswersListModel>())

      ..addBuilderFactory(
          (const FullType(
            BuiltList,
            [
              FullType(DateModel),
            ],
          )),
          () => ListBuilder<DateModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UserModel),
        ],
      )),
          () => ListBuilder<UserModel>())


  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UserData),
        ],
      )),
          () => ListBuilder<UserData>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SuggestFriendsModel),
        ],
      )),
          () => ListBuilder<SuggestFriendsModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(UpdateBoiModel),
        ],
      )),
          () => ListBuilder<UpdateBoiModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GendersListModel),
        ],
      )),
          () => ListBuilder<GendersListModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetGenderModel),
        ],
      )),
          () => ListBuilder<GetGenderModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetInterestsModel),
        ],
      )),
          () => ListBuilder<GetInterestsModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(InterestsListModel),
        ],
      )),
          () => ListBuilder<InterestsListModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetSubGender),
        ],
      )),
          () => ListBuilder<GetSubGender>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SubgendersListModel),
        ],
      )),
          () => ListBuilder<SubgendersListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(RemoveFriendModel),
        ],
      )),
          () => ListBuilder<RemoveFriendModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(SuggestedListModel),
        ],
      )),
          () => ListBuilder<SuggestedListModel>())


  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(AddNewFriendModel),
        ],
      )),
          () => ListBuilder<AddNewFriendModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(ChangeAvatarModel),
        ],
      )),
          () => ListBuilder<ChangeAvatarModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(AvatarListModel),
        ],
      )),
          () => ListBuilder<AvatarListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetAvatarsModel),
        ],
      )),
          () => ListBuilder<GetAvatarsModel>())

  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(FriendsListModel),
        ],
      )),
          () => ListBuilder<FriendsListModel>())
  ..addBuilderFactory(
      (const FullType(
        BuiltList,
        [
          FullType(GetFriendsModel),
        ],
      )),
          () => ListBuilder<GetFriendsModel>())




)
    .build();

//Serializers used for converting json unUsed Code to a code of object
//which i can intract with and use serializer is one of the ways of handleing this
// json data thing. we have chosen this way because it gets genrated easily and
//fastly and has lots of features.

//Make sure you add the StandardJsonPlugin whenever you want to use the generated
// JSON with a RESTful API. By default, BuiltValue's JSON output aren't key-value
// pairs, but instead a list containing [key1, value1, key2, value2, ...]. This is
// not what most of the APIs expect.