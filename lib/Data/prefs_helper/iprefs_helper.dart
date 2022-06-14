

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
  Future<void> SetLatLng(double Lat,double Lng);//
  Future<void> saveUser(UserData user, String token,bool active);//
  Future<bool> getIsLogin();//
  Future<void> SETISsoical();
  Future<bool> GETISsoical();
  Future<void> SetThemeON() ;
  Future<bool> GetThemeON() ;


  Future<double> Getlat() ;//
  Future<double> GetLng() ;//
  Future<void> setIsLogin();//
  Future<void> logout();//

  Future<String> getimage();//
  // Future<String> getMobileNumber();
  Future<void> setIMage(String Image);//


// Future<UserData> getUser();
 Future<bool> getNotification();
 Future<void> setNotification(bool value);
// Future<void> SetEmail(String Email);
// Future<void> Setpass(String pass);
// Future<String> Getpass();
// Future<String> GetEmail();



}
