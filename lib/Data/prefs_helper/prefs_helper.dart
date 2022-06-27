


import 'dart:io';


import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'iprefs_helper.dart';

 const  ID = "ID";
const  first_name = "first_name";
const  last_name = "last_name";
 const  MOBILE = "MOBILE";
const  EMAIL = "EMAIL";
 const  IMAGE = "IMAGE";
var  TOKEN = "TOKEN";
 const  IS_LOGIN = "IS_LOGIN";
const  APP_LANGUAGE = "APP_LANGUAGE";
const  lng = "lng";
const  lat = "lat";
const  access_token = "access_token";
const  refresh_token = "refresh_token";
const  Verified = "Verified";
const  Pass = "Pass";
const  SetThemeON1 = "SetThemeON";
const  NOTIFI = "NOTIFI";
const  IS_soical = "IS_soical";


class PrefsHelper implements IPrefsHelper {

  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
    // we cant
  }

  // @override
  // Future<int?> getAppLanguage() async {
  //   return (await getPrefs()).getInt(APP_LANGUAGE)
  //       ?? AppLanguageKeys.EN
  //   ;
  // }
  //
  // @override
  // Future<void> setAppLanguage(int value) async {
  //   (await getPrefs()).setInt(APP_LANGUAGE, value);
  // }
  // @override
  // Future<void> SetEmail(String Email) async {
  //   (await getPrefs()).setString(EMAIL, Email);
  // }
  // @override
  // Future<void> Setpass(String pass) async {
  //   (await getPrefs()).setString(Pass, pass);
  // }
  // @override
  // Future<String> Getpass() async {
  //   return ((await getPrefs()).getString(Pass))!;
  // }
  // @override
  // Future<String> GetEmail() async {
  //   return ((await getPrefs()).getString(EMAIL))!;
  // }


  @override
  Future<double> Getlat() async {
    return ((await getPrefs()).getDouble(lat)??0);
  }
  @override
  Future<double> GetLng() async {
    return ((await getPrefs()).getDouble(lng)??0);
  }


// void deleteeverything(){
//   SharedPreferences.remove();
//   return;
//
// }
  @override
  Future<bool> getIsLogin() async {
    return (await getPrefs()).getBool(IS_LOGIN) ?? false;
  }

  @override
  Future<String> getimage() async {
    return (await getPrefs()).getString(IMAGE) ?? "";
  }

  @override
  Future<void> setIMage(String Image) async{
    (await getPrefs()).setString(IMAGE, Image);
  }


  //
  // Future<String> getMobileNumber() async {
  //   return ((await getPrefs()).getString(MOBILE))!;
  // }
  @override
  Future<void> SetThemeON()async{
    (await getPrefs()).setBool(SetThemeON1, !( ((await getPrefs()).getBool(SetThemeON1))??false));
  }

  Future<bool> GetThemeON() async{
    return ((await getPrefs()).getBool(SetThemeON1)??true);
  }

  @override
  Future<void> saveUser(UserData user, String token,bool active) async {

    (await getPrefs()).setInt(ID, user.user!.data!.id??0);
    (await getPrefs()).setString(first_name, user.user!.data!.first_name?? "");
   // (await getPrefs()).setString(MOBILE, user.data!.user!.mobile ?? "");
    (await getPrefs()).setString(EMAIL, user.user!.data!.email?? "");
   // (await getPrefs()).setString(IMAGE, user.user!.data!.avatar ?? "");
    (await getPrefs()).setString(access_token, user.user!.token ?? "");
    // (await getPrefs()).setDouble(lat, user.user!.data!.langtitude ?? 0);
    // (await getPrefs()).setDouble(lng, user.user!.data!.lattitude ?? 0);
  //  (await getPrefs()).setString(refresh_token, user.data!.token!.refresh_token ?? "");
    (await getPrefs()).setString(TOKEN, "Bearer ${user.user!.token}");
    if(active){
      (await getPrefs()).setBool(IS_LOGIN, true);
    }

  }


  @override
  Future<void> logout() async{
    (await getPrefs()).setBool(IS_LOGIN, false);
  }

  @override
  Future<void> SETISsoical() async{
    (await getPrefs()).setBool(IS_soical, !( ((await getPrefs()).getBool(IS_soical)??false)));
  }
  @override
  Future<bool> GETISsoical() async{
    return ((await getPrefs()).getBool(IS_soical)??false);
  }
//IS_soical
  @override
  Future<void> setIsLogin() async{
    (await getPrefs()).setBool(IS_LOGIN, true);
  }//




  // @override
  // Future<String> getCurrency() async{
  //
  //   return (await getPrefs()).getString(APP_Currency) ?? 'USD';
  // }
  //
  // @override
  // Future<void> setCurrency(String value)async {
  //
  //   (await getPrefs()).setString(APP_Currency, value);
  // }
  //
  @override
  Future<bool> getNotification() async{

    return (await getPrefs()).getBool(NOTIFI) ?? false;
  }

  @override
  Future<void> setNotification(bool value)async {

    (await getPrefs()).setBool(NOTIFI, value);
  }


@override
Future<void> SetLatLng(double Lat,double Lng)async {
  (await getPrefs()).setDouble(lat, Lat);
  (await getPrefs()).setDouble(lng, Lng);
}

@override
Future<String> getToken() async {
  return ((await getPrefs()).getString(access_token))!;
}
  @override
  Future<void> SetToken(String? token) async{
    (await getPrefs()).setString(access_token, token??" ");
  }//


  @override
Future<int> getUserId() async {
  return ((await getPrefs()).getInt(ID)??0);
}

}
