import 'dart:convert';
import 'dart:developer';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Profile/Challenges_Screen/bloc/Challenges_Event.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/pages/VerifyProfile.dart';
import 'package:bubbles/models/AceeptRequestModel/AceeptRequestModel.dart';
import 'package:bubbles/models/AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/ClearBadgeModel/ClearBadgeModel.dart';
import 'package:bubbles/models/CreateBubbleModel/CreateBubbleModel.dart';
import 'package:bubbles/models/DenyFriendRequestModel/DenyFriendRequestModel.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventOldMessagesModel.dart';
import 'package:bubbles/models/Event_CateogoryModel/EventCateogoryModel.dart';
import 'package:bubbles/models/FlowChatModel/FlowChatModel.dart';
import 'package:bubbles/models/FreindListSearchModel/FriendListSearchModel.dart';
import 'package:bubbles/models/FreindRequestsModel/FreindRequestsModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:bubbles/models/GetDetailedEvent/GetDetailedEvent.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/GetGenderModel/GetGender.dart';
import 'package:bubbles/models/GetInterestsModel/GetInterestsModel.dart';
import 'package:bubbles/models/GetNotificationsModel/GetnotifcationsModel.dart';
import 'package:bubbles/models/GetPointsModel/GetPointsModel.dart';
import 'package:bubbles/models/GetQuestionsModel/GetQuestionsModel.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/GetUsersInsideBubbleModel.dart';
import 'package:bubbles/models/GetWhoSavedBubblesModel/GetWhoSavedBubblesModel.dart';
import 'package:bubbles/models/GetbadgeModel/GetbadgeModel.dart';
import 'package:bubbles/models/InOutUserStatusModel/InOutUserStatusModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/NotifyMeCloseToBubbleModel/NotifyMeCloseToBubbleModel.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/RemoveFrinedModel/RemoveFriendModel.dart';
import 'package:bubbles/models/SaveBubbleModel/SaveBubbleModel.dart';
import 'package:bubbles/models/SendBubbleMessageModel/SendBubbleMessageModel.dart';
import 'package:bubbles/models/SubmitCreatorAnwersModel/SubmitCreatorAnwersModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:bubbles/models/VerifyProfileModel/VerifyProfileModel.dart';
import 'package:bubbles/models/permissionsModel/PermissionsModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart'as http;
import 'Ihttp_helper.dart';
import 'dart:io';
import 'dart:core';

class HttpHelper implements IHttpHelper {
  Dio? _dio;
  Dio? _dio2;
  var cookieJar = CookieJar();

  HttpHelper(this._dio, this._dio2) {
    _dio!.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
    ));
    _dio!.interceptors.add(CookieManager(cookieJar));

    _dio2!.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
    ));
  }



  @override
  Future<UserData> GoogleLogin(
      String Email,
      String name,
      String fcmToken,
      String avatar,
      ) async {
    try {
      final formData = {
        "email": Email,
        "name": name,
        "fcm_token": fcmToken,
        "avatar": avatar,
      };


      final response = await _dio!
          .post('sign/google', data: formData, options: Options(headers: {
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              UserData,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(UserData),
                  ],
                ),
              ],
            )) as UserData;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }
///event/12
  @override
  Future<UserData> login(
    String Email,
    String password,
    String fcmToken,
  ) async {
    try {
      final formData = {
        "email": Email,
        "password": password,
        "fcm_token": fcmToken,
      };

      final response = await _dio!
          .post('login', data: formData, options: Options(headers: {
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              UserData,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(UserData),
                  ],
                ),
              ],
            )) as UserData;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<UserData> LoginSocial(
      String Token,
      String fcmToken,
      ) async {
    try {

      final formData = {
        "provider": "facebook",
        "fcm_token": fcmToken,
        "token": Token,
      };

      final response = await _dio!
          .post('login/social', data: formData, options: Options(headers: {}));


      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              UserData,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(UserData),
                  ],
                ),
              ],
            )) as UserData;

        return baseResponse;

      } else {
        throw NetworkException();
      }
    }on SocketException catch (e) {
      throw NetworkException();
    }catch (e){
      throw NetworkException();
    }
  }

  @override
  Future<PermissionsModel> SetPermission(
      int is_notify,
      String Auth
      ) async {
    try {

      final formData = {
        "is_notify":is_notify,
      };

      final response = await _dio!
          .post('update/permissions', data: formData, options: Options(
          headers: {
            "Authorization":"Bearer $Auth",
            "Accept" :"application/json"
      }));


      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              PermissionsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(PermissionsModel),
                  ],
                ),
              ],
            )) as PermissionsModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }

      } else {
        throw NetworkException();
      }
    }on SocketException catch (e) {
      throw NetworkException();
    }catch (e){
      throw NetworkException();
    }
  }

  @override
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
  ) async {
    try {
      final formData = {
        "email": Email,
        "password": password,
        "first_name": first_name,
        "last_name": last_name,
        "interests": interests,
        "bio": bio,
        "avatar": avatarid.toInt(),
        "gender": Genter.toInt(),
        "fcm_token": fcmToken,
        "background_color": background_color,
        "alias": alias,
        "birth_date": birth_date,
      };
      print(interests);


      final response = await _dio!
          .post('register', data: formData, options: Options(headers: {
      "Content-Type":"application/json",
      }));
      log(response.data);
      print("done1");
      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              UserData,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(UserData),
                  ],
                ),
              ],
            )) as UserData;
        print(baseResponse);
        print("done2");

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
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
      ) async {
    try {

      final formData = {
        "first_name": first_name,
        "last_name": last_name,
        "interests": interests,
        "bio": bio,
        "avatar": avatarid.toInt(),
        "gender": Genter.toInt(),
        "fcm_token": fcmToken,
        "background_color": background_color,
        "alias": alias,
        "birth_date": birth_date,
      };

      final response = await _dio!
          .post('update/profile', data: formData, options: Options(headers: {
        "Content-Type":"application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $auth",
      }));
      log(response.data);
      print("done1");
      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              UpdateProfile,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(UpdateProfile),
                  ],
                ),
              ],
            )) as UpdateProfile;
        print(baseResponse);
        print("done2");

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetGenderModel> GetGenders() async {
    try {
      final response =
          await _dio!.get('genders', options: Options(headers: {
            "Accept" :"application/json"
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetGenderModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetGenderModel),
                  ],
                ),
              ],
            )) as GetGenderModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<GetInterestsModel> GetInterests() async {
    try {
      final response =
          await _dio!.get('interests', options: Options(headers: {
            "Accept" :"application/json"
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetInterestsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetInterestsModel),
                  ],
                ),
              ],
            )) as GetInterestsModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<GetSubGender> GetSubGenders() async {
    try {
      final response =
          await _dio!.get('sub/genders', options: Options(headers: {
            "Accept" :"application/json"
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetSubGender,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetSubGender),
                  ],
                ),
              ],
            )) as GetSubGender;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<GetAvatarsModel> GetAvatars() async {
    try {
      final response =
          await _dio!.get('avatars', options: Options(headers: {
            "Accept" :"application/json"
          }));
      print("here 1");
      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetAvatarsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetAvatarsModel),
                  ],
                ),
              ],
            )) as GetAvatarsModel;
        print("here 2");
        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<UpdateBoiModel> updateProfile(
      String alias, String bio, String auth) async {
    try {
      final formData = {
        "alias": alias,
        "bio": bio,
      };

      final response = await _dio!.post('update/bio',
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              UpdateBoiModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(UpdateBoiModel),
                  ],
                ),
              ],
            )) as UpdateBoiModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<ChangeAvatarModel> ChangeAvatar(int AvatarID, String auth) async {
    try {
      final formData = {
        "avatar": AvatarID.toInt(),
      };

      final response = await _dio!.post('update/avatar',
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              ChangeAvatarModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(ChangeAvatarModel),
                  ],
                ),
              ],
            )) as ChangeAvatarModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<AddNewFriendModel> AddFriend(String serial, String auth) async {
    try {
      final formData = {
        "serial": serial,
      };

      final response = await _dio!.post('add/friend/serial',
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              AddNewFriendModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(AddNewFriendModel),
                  ],
                ),
              ],
            )) as AddNewFriendModel;

          return baseResponse;
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<GetFriendsModel> GetFreinds(String auth) async {
    try {
      print(auth);
      final response = await _dio!.get('get/friends',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetFriendsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetFriendsModel),
                  ],
                ),
              ],
            )) as GetFriendsModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<RemoveFriendModel> RemoveFriend(int friend_id, String auth) async {
    try {
      final formData = {
        "friend_id": friend_id,
      };

      final response = await _dio!.post('remove/friend',
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              RemoveFriendModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(RemoveFriendModel),
                  ],
                ),
              ],
            )) as RemoveFriendModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<CheckMailModel> CheckEmail(String Email) async {
    try {
      final formData = {
        "email": Email,
      };

      final response = await _dio!.post('check/mail',
          data: formData,
          options: Options(headers: {
            "Accept" :"application/json"
          }));


      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              CheckMailModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(CheckMailModel),
                  ],
                ),
              ],
            )) as CheckMailModel;


          return baseResponse;
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<GetQuestionsModel> QuestionCreator() async
      {
    try {

      final response = await _dio!
          .get('/question/creator', options: Options(headers: {
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetQuestionsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetQuestionsModel),
                  ],
                ),
              ],
            )) as GetQuestionsModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<SubmitCreatorAnwersModel> CreatorSubmit(
      List<int> Answers,
      String Auth,
      List<int> questions,
      ) async{
    try {
      final formData = {
          "questions": questions,
          "answers": Answers
      };
      final response = await _dio!
          .post('request/creator',   data: formData,
          options: Options(headers: {
            "Accept": "application/vnd.api+json",
            "Authorization": "Bearer $Auth",
            // "Content-Type": "application/json",
            // "Content-Length": "<calculated when request is sent>",
            // "Host": "<calculated when request is sent>",
            // "Accept-Encoding": "gzip, deflate, br",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SubmitCreatorAnwersModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SubmitCreatorAnwersModel),
                  ],
                ),
              ],
            )) as SubmitCreatorAnwersModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<DenyFriendRequestModel> DenyRequest(
      int  friend_id,
      String Auth,
      ) async{
    try {
      final formData = {
        "friend_id": friend_id,
      };
      final response = await _dio!
          .post('deny/friend/request',   data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));



      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              DenyFriendRequestModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(DenyFriendRequestModel),
                  ],
                ),
              ],
            )) as DenyFriendRequestModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<AceeptRequestModel> AceeptRequest(
      int  friend_id,
      String Auth,
      ) async{
    try {
      final formData = {
        "friend_id": friend_id,
      };
      final response = await _dio!
          .post('accept/friend/request',   data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));



      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              AceeptRequestModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(AceeptRequestModel),
                  ],
                ),
              ],
            )) as AceeptRequestModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<FreindRequestsModel> FreindRequests(String Auth) async {
    try {
      final response = await _dio!.get('request/friend',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              FreindRequestsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(FreindRequestsModel),
                  ],
                ),
              ],
            )) as FreindRequestsModel;
        print("done");

        if (baseResponse.msg == 'success') {
          return baseResponse;

        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<ProfileDateModel> GetProfile(String Auth) async {
    try {
      final response = await _dio!.get('profile',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              ProfileDateModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(ProfileDateModel),
                  ],
                ),
              ],
            )) as ProfileDateModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;

        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<LogoutModel> Logout(
      String Auth,
      ) async{
    try {

      final response = await _dio!
          .post('logout',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));



      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              LogoutModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(LogoutModel),
                  ],
                ),
              ],
            )) as LogoutModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<AddFreindBarCodeModel> AddFreindWithBarCode(
      String serial,
      String Auth,
      ) async{
    try {
      final formData = {
        "serial": serial,
      };
      final response = await _dio!
          .post('add/friend/parcode',   data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              AddFreindBarCodeModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(AddFreindBarCodeModel),
                  ],
                ),
              ],
            )) as AddFreindBarCodeModel;


          return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  //
  @override
  Future<SuggestFriendsModel> SuggestFreinds(
      String Auth,
      ) async{
    try {
      final response = await _dio!
          .get('suggest/friends',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SuggestFriendsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SuggestFriendsModel),
                  ],
                ),
              ],
            )) as SuggestFriendsModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<GetnotifcationsModel> GetNotifications(
      String Auth,
      ) async{
    try {
      final response = await _dio!
          .get('notifications',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetnotifcationsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetnotifcationsModel),
                  ],
                ),
              ],
            )) as GetnotifcationsModel;

        if (baseResponse.msg == 'success') {
          return baseResponse;
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<VerifyProfileModel> VerifyProfile(
      String Image2,
      String Image1,
      String Auth,
      ) async {
    try {



    final formData = {
      "image1":Image1,
      "image2":Image2
    };

    final response = await _dio!
        .post('verify/profile'
        , data: formData,
        options: Options(headers: {
          "Accept" :"application/json",
          "Authorization" :"Bearer $Auth",
          "Accept-Encoding" :"gzip, deflate, br",
        }));//todo : check if this is working on the new release that you will make and on the emulator

      // var url = Uri.parse("https://admin.bubbles.app/api/verify/profile");
      // final response = await http.post(url,
      //    headers: {
      //      "Host" :"<calculated when request is sent>",
      //      "Connection" :"keep-alive",
      //      "Accept" :"application/json",
      //       'Authorization': 'Bearer  $Auth',
      // });
      // print(response.body);

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              VerifyProfileModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(VerifyProfileModel),
                  ],

                ),
              ],
            )) as VerifyProfileModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetPointsModel> GetPoints(
      int challenge_id,
      String Auth
      ) async {
    try {
      final formData = {
        "challenge_id": challenge_id,
      };


      final response = await _dio!
          .post('get/points', data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetPointsModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetPointsModel),
                  ],
                ),
              ],
            )) as GetPointsModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<GetChallengesModel> GetChallenges(
      String Auth,
      ) async{
    try {
      final response = await _dio!
          .get('challenges',
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetChallengesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetChallengesModel),
                  ],
                ),
              ],
            )) as GetChallengesModel;


          return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }
//
@override
Future<GetPrimeBubblesModel> GetPrimeBubblees(
    String Auth,
    ) async{
  try {
    final response = await _dio!
        .get('prime/event',
        options: Options(headers:{
          "Accept": "application/json",
          "Authorization": "Bearer $Auth",
        }
        ));

    if (response.statusCode == 200) {
      final baseResponse = serializers.deserialize(json.decode(response.data),
          specifiedType: const FullType(
            GetPrimeBubblesModel,
            [
              FullType(
                BuiltList,
                [
                  FullType(GetPrimeBubblesModel),
                ],
              ),
            ],
          )) as GetPrimeBubblesModel;


        return baseResponse;

    } else {
      throw NetworkException();
    }
  } on SocketException catch (e) {
    throw NetworkException();
  } catch (e) {
    throw NetworkException();
  }
}


  @override
  Future<GetPrimeBubblesModel> GetAllBubbles(
      String Auth,
      ) async{
    try {
      final response = await _dio!
          .get('/events',
          options: Options(headers:{
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }
          ));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetPrimeBubblesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetPrimeBubblesModel),
                  ],
                ),
              ],
            )) as GetPrimeBubblesModel;


          return baseResponse;

      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetPrimeBubblesModel> GetNewBubbles(
      String Auth,
      ) async{
    try {
      final response = await _dio!
          .get('normal/event/last',
          options: Options(headers:{
            "Accept": "application/json",
            "Authorization": "Bearer $Auth",
          }
          ));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetPrimeBubblesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetPrimeBubblesModel),
                  ],
                ),
              ],
            )) as GetPrimeBubblesModel;


        return baseResponse;

      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }



  @override
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
      ) async {
    try {
      print(images.length);
      print("Length :");
      final formData = {
        "title": title,
        "location": location,
        "images": images,//LIST
        "color": color,
        "description": description,
        "organizers": organizers,
        "start_event_date": start_event_date,
        "end_event_date": end_event_date,
        "dates":dates,
        "lng": lng,
        "lat": lat,
        "radius": radius,
        "status": 1,
        "category": 7,//todo: category fix
      };
      print(formData);
      final response = await _dio!
          .post('event/store', data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth"
      }));

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              CreateBubbleModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(CreateBubbleModel),
                  ],
                ),
              ],
            )) as CreateBubbleModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }


  @override
  Future<PostMessagesModel> PostMessage(
      String Auth,
      String Message,
      String sms_type,
      String send_by,
      int Reciver_ID,
      ) async {
    try {
      final formData = {
        "receiver_id": Reciver_ID,
        "message": Message,
        "sms_type": sms_type,
        "send_by": send_by,
      };

      final response = await _dio!
          .post('save/message', data: formData, options: Options(headers: {
        "Authorization" :"Bearer  $Auth",
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              PostMessagesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(PostMessagesModel),
                  ],
                ),
              ],
            )) as PostMessagesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<OldMessagesModel> GetOldMessages(
      String Auth,
      String send_by,
      int Reciver_ID,
      ) async {
    try {
      final formData = {
        "receiver_id": Reciver_ID,
        "send_by": send_by,
      };


      final response = await _dio!
          .post('messages/user', data: formData, options: Options(headers: {
        "Authorization" :"Bearer  $Auth",
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              OldMessagesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(OldMessagesModel),
                  ],
                ),
              ],
            )) as OldMessagesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<OldMessagesModel> GetLastMessageBetweenMeAndAllUsers(
      String Auth,
      ) async {
    try {


      final response = await _dio!
          .get(
         // 'messages/users',
          'all_list_messages',
          options: Options(headers: {
        "Authorization" :"Bearer  $Auth",
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              OldMessagesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(OldMessagesModel),
                  ],
                ),
              ],
            )) as OldMessagesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetAliasModel> GetAlias(
      String Auth,
      int friend_id
      ) async {
    try {
      final formData = {
        "friend_id": friend_id,
      };

      final response = await _dio!
          .post('get/friend',data: formData, options: Options(headers: {
        "Authorization" :"Bearer  $Auth",
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetAliasModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetAliasModel),
                  ],
                ),
              ],
            )) as GetAliasModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<AddreplyModel> AddReply(
      String Auth,
      String comment,
      int message_id,
      ) async {
    try {
      final formData = {
        "message_id": message_id,
        "comment": comment,
      };

      final response = await _dio!
          .post('save/reply', data: formData, options: Options(headers: {
        "Authorization" :"Bearer  $Auth",
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              AddreplyModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(AddreplyModel),
                  ],
                ),
              ],
            )) as AddreplyModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetDetailedEvent> GetEventDetails(
      int Event_id,
      String Auth,
      ) async {
    try {

      final response = await _dio!
          .get('event/$Event_id', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetDetailedEvent,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetDetailedEvent),
                  ],
                ),
              ],
            )) as GetDetailedEvent;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<AddreplyModel> RemoveFromDirect(
      String Auth,
      int receiver_id,
      ) async {
    try {
      final formData = {
        "receiver_id": receiver_id,
      };


      final response = await _dio!
          .post('remove_user_from_list_message', data: formData, options: Options(headers: {
        "Authorization" :"Bearer  $Auth",
        "Accept" :"application/json"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              AddreplyModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(AddreplyModel),
                  ],
                ),
              ],
            )) as AddreplyModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }



  @override
  Future<OldMessagesModel> SearchDMlistt(
      String Keyword,
      String Auth,
      ) async {
    try {

      final response = await _dio!
          .get('search', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              OldMessagesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(OldMessagesModel),
                  ],
                ),
              ],
            )) as OldMessagesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }



  @override
  Future<FriendListSearchModel> SearchFriendList(
      String Keyword,
      String Auth,
      ) async {
    try {


      final response = await _dio!
          .get('user_friends/?name=$Keyword', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              FriendListSearchModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(FriendListSearchModel),
                  ],
                ),
              ],
            )) as FriendListSearchModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<GetPrimeBubblesModel> NearByEventList(
      double lat,
      double lng,
      String Auth,
      ) async {
    try {

      final response = await _dio!
          .get('events/nearby?user_latitude=$lat&user_longitude=$lng', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetPrimeBubblesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetPrimeBubblesModel),
                  ],
                ),
              ],
            )) as GetPrimeBubblesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<GetDetailedEvent> SearchEventLists(//dont need this one for now
      String Keyword,
      String Auth,
      ) async {
    try {


      final response = await _dio!
          .get('search/events', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetDetailedEvent,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetDetailedEvent),
                  ],
                ),
              ],
            )) as GetDetailedEvent;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<ClearBadgeModel> ClearBadge(
      String Auth,
      ) async {
    try {


      final response = await _dio!
          .get('clear/counter/notifications', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              ClearBadgeModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(ClearBadgeModel),
                  ],
                ),
              ],
            )) as ClearBadgeModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<SendBubbleMessageModel> SendMessageEVENT(
      String Auth,
      String type,
      String message,
      int Event_id,
      int main_type,
      ) async {
    try {
      final formData = {
        "bubble_id": Event_id,
        "type": type,
        "main_type": main_type,
        "message": message,
      };


      final response = await _dio!
          .post('save/bubble/message',data: formData, options: Options(headers: {
        "Accept-Encoding" :"gzip, deflate, br",
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<SendBubbleMessageModel> SendReplyMessageEVENT(
      String Auth,
      String comment,
      int message_id,
      ) async {
    try {
      final formData = {
        "comment": comment,
        "message_id": message_id,
      };


      final response = await _dio!
          .post('save/reply/group',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }



  @override
  Future<InOutUserStatusModel> ChangeUserStatusToOut(
      String Auth,
      int bubble_id,
      )async {
    try {
      final formData = {
        "bubble_id": bubble_id,
      };

      final response = await _dio!
          .post('out/bubble',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              InOutUserStatusModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(InOutUserStatusModel),
                  ],
                ),
              ],
            )) as InOutUserStatusModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }


  @override
  Future<InOutUserStatusModel> ChangeUserStatusToIN(
      String Auth,
      int bubble_id,
      )async {
    try {
      final formData = {
        "bubble_id": bubble_id,
      };

      final response = await _dio!
          .post('in/bubble',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
        "Accept-Encoding" :"gzip, deflate, br"
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              InOutUserStatusModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(InOutUserStatusModel),
                  ],
                ),
              ],
            )) as InOutUserStatusModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }



  @override
  Future<GetUsersInsideBubbleModel> GetUsersInsideBubble(
      String Auth,
      int bubble_id,
      )async {
    try {


      final response = await _dio!
          .get('bubble/users?buuble_id=$bubble_id', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetUsersInsideBubbleModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetUsersInsideBubbleModel),
                  ],
                ),
              ],
            )) as GetUsersInsideBubbleModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<EventOldMessagesModel> GetEventMessages(
      String Auth,
      int bubble_id
      )async {
    try {

      final response = await _dio!
          .get('get/bubble/message?bubble_id=$bubble_id', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              EventOldMessagesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(EventOldMessagesModel),
                  ],
                ),
              ],
            )) as EventOldMessagesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetbadgeModel> Getbadge(
      String Auth,
      )async {
    try {

      final response = await _dio!
          .get('counter/notifications', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetbadgeModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetbadgeModel),
                  ],
                ),
              ],
            )) as GetbadgeModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetPrimeBubblesModel> PopularNowBubbles(
      String Auth,
      )async {
    try {

      final response = await _dio!
          .get('popular/events', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer  $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetPrimeBubblesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetPrimeBubblesModel),
                  ],
                ),
              ],
            )) as GetPrimeBubblesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<NotifyMeCloseToBubbleModel> NotifyMeImCloseToBubble(
      String Auth,
      String distance,
      String Title,
      )async {
    try {
      var formData={
        "distance": distance,
        "title":  Title
      };

      final response = await _dio!
          .post('alert/event/away/from',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      //  "Accept-Encoding" :"gzip, deflate, br",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              NotifyMeCloseToBubbleModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(NotifyMeCloseToBubbleModel),
                  ],
                ),
              ],
            )) as NotifyMeCloseToBubbleModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }







  @override
  Future<SendBubbleMessageModel> SendTopicFlow(
      String Auth,
      int bubble_id,
      String content,
      String title,
      int main_type,
      ) async {
    try {
      var formData={
        "content": content,
        "title":  title,
        "main_type":  main_type,
        "bubble_id":  bubble_id
      };

      final response = await _dio!
          .post('save/topic',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));


      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }


  @override
  Future<FlowChatModel> GetFlowOldMessages(
      String Auth,
      int message_id,
      ) async {
    try {

      final response = await _dio!
          .get('get/nested/chat?message_id=$message_id', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));


      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              FlowChatModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(FlowChatModel),
                  ],
                ),
              ],
            )) as FlowChatModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<SendBubbleMessageModel> SendMessageInFlows(
      String Auth,
      String message,
      String type,
      int message_id,
      ) async {
    try {
      var formData={
        "message": message,
        "type":  type,
        "message_id":  message_id,
      };

      final response = await _dio!
          .post('save/nested/chat',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));


      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }


  @override
  Future<SendBubbleMessageModel> SendReplyInFlows(
      String Auth,
      String comment,
      int sub_message_id,
      ) async {
    try {
      var formData={
        "comment": comment,
        "sub_message_id":  sub_message_id
      };

      final response = await _dio!
          .post('save/reply/nested/chat',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<SendBubbleMessageModel> SendPollFlow(
      String Auth,
      String Question,
      int bubble_id,
      List<String> answers
      ) async {
    try {
      var formData={
        "main_type":5,
        "type":"new_poll",
        "bubble_id":bubble_id,
        "title":Question,
        "answers":answers
      };

      final response = await _dio!
          .post('save/poll/message',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }


  @override
  Future<SendBubbleMessageModel> SendFootPrintFlow(
      String Auth,
      String title,
      String image,//base64
      int type,//new_poll
      int bubble_id,
      ) async {
    try {
      var formData={
        "main_type":3,
        "bubble_id":bubble_id,
        "title":title,
        "image":image
      };

      final response = await _dio!
          .post('save/post/photo',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }
  //

  @override
  Future<SendBubbleMessageModel> SendMediaDumpFlow(
      String Auth,
      String title,
      String image,//base64
      int type,//new_poll
      int bubble_id,
      ) async {
    try {
      var formData={
        "main_type":2,
        "bubble_id":bubble_id,
        "title":title,
        "image":image
      };

      final response = await _dio!
          .post('save/media/dump',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SendBubbleMessageModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SendBubbleMessageModel),
                  ],
                ),
              ],
            )) as SendBubbleMessageModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }


  @override
  Future<SaveBubbleModel> SaveBubble(
      String Auth,
      int bubble_id,
      ) async {
    try {
      var formData={
        "bubble_id":bubble_id,
      };

      final response = await _dio!
          .post('bubble/favourite/store',data: formData, options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              SaveBubbleModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(SaveBubbleModel),
                  ],
                ),
              ],
            )) as SaveBubbleModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetPrimeBubblesModel> GetSavedBubbles(
      String Auth,
      int User_id,
      ) async {
    try {

      final response = await _dio!
          .get('bubble/favourite/$User_id', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetPrimeBubblesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetPrimeBubblesModel),
                  ],
                ),
              ],
            )) as GetPrimeBubblesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<GetWhoSavedBubblesModel> GetWhoSavedBubble(
      String Auth,
      int Bubble_id,
      ) async {
    try {
      
      final response = await _dio!
          .get('bubble/favourite/$Bubble_id/users', options: Options(headers: {
        "Accept" :"application/json",
        "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              GetWhoSavedBubblesModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(GetWhoSavedBubblesModel),
                  ],
                ),
              ],
            )) as GetWhoSavedBubblesModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  @override
  Future<EventCateogoryModel> GetEventCateogories(
      String Auth,
      ) async {
    try {

      final response = await _dio!
          .get('event_category', options: Options(headers: {
        "Accept" :"application/json",
     //   "Authorization" :"Bearer $Auth",
      }));

      if (response.statusCode == 200) {

        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: const FullType(
              EventCateogoryModel,
              [
                FullType(
                  BuiltList,
                  [
                    FullType(EventCateogoryModel),
                  ],
                ),
              ],
            )) as EventCateogoryModel;

        return baseResponse;
      } else {
        throw NetworkException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetworkException();
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

}

class NetworkException implements Exception {}
