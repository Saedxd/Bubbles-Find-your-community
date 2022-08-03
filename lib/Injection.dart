// ignore_for_file: constant_identifier_names, file_names

import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/bloc/FlowsChat_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/bloc/PrimePlan_bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_Bloc.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Bloc.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_Bloc.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_bloc.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_Bloc.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_bloc.dart';
import 'package:bubbles/UI/Notifications/bloc/Notifications_Bloc.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_Bloc.dart';
import 'package:bubbles/UI/Profile/CameraVerification_screen/bloc/VerfiyProfile_Bloc.dart';
import 'package:bubbles/UI/Profile/Challenges_Screen/bloc/Challenges_Bloc.dart';
import 'package:bubbles/UI/Profile/FindFriends_Screen/bloc/FindFriends_bloc.dart';
import 'package:bubbles/UI/Profile/FreindRequests_screen/bloc/FriendRequest_Bloc.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/bloc/FriendList_bloc.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_bloc.dart';
import 'package:bubbles/UI/Profile/QrScanner_Screen/bloc/QrScreen_bloc.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_Bloc.dart';
import 'package:bubbles/UI/Profile/Settings_screen/bloc/Settings_bloc.dart';
import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/bloc/SuggestedFrineds_Bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'Data/http_helper/Ihttp_helper.dart';
import 'Data/http_helper/http_helper.dart';
import 'Data/prefs_helper/iprefs_helper.dart';
import 'Data/prefs_helper/prefs_helper.dart';
import 'Data/repository/irepository.dart';
import 'Data/repository/repository.dart';

final sl = GetIt.instance;

const BaseUrl = "https://admin.bubbles.app/api/";

Future iniGetIt() async {
  sl.registerLazySingleton(() => Dio(
      BaseOptions(baseUrl: BaseUrl, headers: {

      }, responseType: ResponseType.plain)

  ));

//DATA
  sl.registerLazySingleton<IHttpHelper>(() => HttpHelper(sl(), sl()));
  sl.registerLazySingleton<IRepository>(() => Repository(sl(), sl()));
  sl.registerLazySingleton<IPrefsHelper>(() => PrefsHelper());

  //factory means this dependency injection will provide us with new instance of get it everytime its called
  //so sometimes we call bloc in dispose which leads stream to close so useing the same instance that means it will be closed.
  sl.registerFactory(() => SignUpBloc(sl()));
  sl.registerFactory(() => SprintsBloc(sl()));
  sl.registerFactory(() => loginBloc(sl()));
  sl.registerFactory(() => NotificationsBloc(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => FriendListBloc(sl()));
  sl.registerFactory(() => ProfileBloc(sl()));
  sl.registerFactory(() => DirectMessagesBloc(sl()));
  sl.registerFactory(() => QrScreenBLoc(sl()));
  sl.registerFactory(() => TopBarBloc(sl()));
  sl.registerFactory(() => CreatorBloc(sl()));
  sl.registerFactory(() => SuggestedFrinedsBloc(sl()));
  sl.registerFactory(() => VerifyProfileBloc(sl()));
  sl.registerFactory(() => OptionsBloc(sl()));
  sl.registerFactory(() => FindFriends(sl()));
  sl.registerFactory(() => ChallengesBloc(sl()));
  sl.registerFactory(() => GroupChatBloc(sl()));
  //sl.registerFactory(() => DmChat_Bloc(sl()));
  sl.registerFactory(() => PlanPageBloc(sl()));
  sl.registerFactory(() => FlowsBloc(sl()));
  sl.registerFactory(() => SavedBubblesBloc(sl()));
  sl.registerFactory(() => SettingsBloc(sl()));
  sl.registerFactory(() => PrimePlanBloc(sl()));
}
//we use this package for dependency injection and use for connecting all our APP with each other
//for example we give in constructor this get_it in both http and repository so the object can come IN the Easy Way.
