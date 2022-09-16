

import 'package:bubbles/models/UserDataModel/User.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'prefs_helper.dart';

abstract class IPrefsHelper {

  // Future<int> getAppLanguage();
  // Future<String> getCurrency();
  // Future<void> setAppLanguage(int value);
  // Future<void> setCurrency(String value);



  Future<SharedPreferences> getPrefs();
  Future<String> getToken();
  Future<void> SetToken(String token);
  Future<int> getUserId();
  Future<void> SetLatLng(double Lat,double Lng);
  Future<void> saveUser(UserModel user, String token,bool active);

  Future<void> SETISsoical();
  Future<bool> GETISsoical();


  Future<void> SetThemeON() ;
  Future<bool> GetThemeON() ;

  Future<void> SetisFirstTimeLogin();
  Future<bool> GetisFirstTimeLogin();

  Future<double> Getlat() ;
  Future<double> GetLng() ;

  Future<void> setIsLogin();
  Future<void> logout();



  Future<void> SetIsCreator(int Creatorr);
  Future<int> GetIsCreator();
  Future<bool> getIsLogin();

  Future<String> GetTimeZone();
  Future<void> SetTimeZone(String TimeZone);


 // Future<String> getimage();

 // Future<void> setIMage(String Image);


 Future<UserModel> getUser();
//  Future<bool> getNotification();
//  Future<void> setNotification(bool value);
// Future<void> SetEmail(String Email);
// Future<void> Setpass(String pass);
// Future<String> Getpass();
// Future<String> GetEmail();



}
