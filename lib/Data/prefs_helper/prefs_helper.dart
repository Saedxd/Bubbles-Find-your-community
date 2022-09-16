


import 'dart:io';


import 'package:bubbles/models/UserDataModel/User.dart';
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
var  Avatar = "Avatar";
var  Alias = "Alias";
var  Gender = "Gender";
var is_Creator = "is_Creator";
var BackGround_Color = "BackGround_Color";


 const  IS_LOGIN = "IS_LOGIN";
 const  Time_Zone = "Time_Zone";

const  APP_LANGUAGE = "APP_LANGUAGE";
const  lng = "lng";
const  lat = "lat";
const  access_token = "access_token";

const  refresh_token = "refresh_token";
const  Verified = "Verified";
// const  Pass = "Pass";
const  SetThemeON1 = "SetThemeON";
// const  NOTIFI = "NOTIFI";
const  IS_soical = "IS_soical";
const  isFirstTimeLogin = "isFirstTimeLogin";


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
    print("IN Getislogin Fucntion :");
print((await getPrefs()).getBool(IS_LOGIN));
    print("Dot");
    return (((await getPrefs()).getBool(IS_LOGIN)) ?? false);
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
  Future<void> saveUser(UserModel user, String token,bool active) async {

    (await getPrefs()).setInt(ID, user.data!.id??0);
    (await getPrefs()).setString(Avatar, user.data!.avatar??"");
    (await getPrefs()).setString(Alias, user.data!.alias??"");
    (await getPrefs()).setString(BackGround_Color, user.data!.background_color??"");
    (await getPrefs()).setString(first_name, user.data!.first_name?? "");
    (await getPrefs()).setString(last_name,user.data!.last_name ?? "");
    (await getPrefs()).setString(EMAIL, user.data!.email?? "");
 //   (await getPrefs()).setString(Gender, user.data!.gender?? "");
 user.token!.isNotEmpty?
    (await getPrefs()).setString(access_token, user.token ?? "")
     :print("token empty");
    (await getPrefs()).setInt(is_Creator, user.data!.is_creator?? 0);
    // (await getPrefs()).setDouble(lat, user.user!.data!.langtitude ?? 0);
    // (await getPrefs()).setDouble(lng, user.user!.data!.lattitude ?? 0);
  //  (await getPrefs()).setString(refresh_token, user.data!.token!.refresh_token ?? "");
    (await getPrefs()).setString(TOKEN, "Bearer ${user.token}");
    if(active){
      (await getPrefs()).setBool(IS_LOGIN, true);
    }

    print(((await getPrefs()).getInt(ID)));
    print(((await getPrefs()).getString(Avatar)));
    print(((await getPrefs()).getString(first_name)));
    print(((await getPrefs()).getString(last_name)));
    print(((await getPrefs()).getString(EMAIL)));
   // print(((await getPrefs()).getString(Gender)));
    print(((await getPrefs()).getString(TOKEN)));
    print(((await getPrefs()).getBool(IS_LOGIN)));
    print("Stored in Shared");

  }


  @override
  Future<UserModel> getUser() async{
  int id =  (await getPrefs()).getInt(ID)??0;
   String avatar = (await getPrefs()).getString(Avatar)??"";
   String alias = (await getPrefs()).getString(Alias)??"";
   String BackGround_color = (await getPrefs()).getString(BackGround_Color)??"";
  String first_namee =  (await getPrefs()).getString(first_name)??"";
  String last_namee =  (await getPrefs()).getString(last_name)??"";
  String email = (await getPrefs()).getString(EMAIL)??"";
 // String gender =  (await getPrefs()).getString(Gender)??"";
  String token =  (await getPrefs()).getString(TOKEN)??"";
  int is_Creatorr =  (await getPrefs()).getInt(is_Creator)??0;
  double latt =  (await getPrefs()).getDouble(lat)??0;
  double lngg =  (await getPrefs()).getDouble(lng)??0;
    // (await getPrefs()).setDouble(lat, user.user!.data!.langtitude ?? 0);
    // (await getPrefs()).setDouble(lng, user.user!.data!.lattitude ?? 0);
    //  (await getPrefs()).setString(refresh_token, user.data!.token!.refresh_token ?? "");


  UserModel user = UserModel((b) => b
    ..data.is_creator = is_Creatorr
     // ..data.gender = gender
      ..data.first_name = first_namee
      ..data.last_name = last_namee
      ..data.avatar = avatar
      ..data.alias = alias
      ..data.email = email
      ..data.id = id
      ..token =token
      ..data.background_color = BackGround_color
  );
  return user;
  }


  @override
  Future<void> SetIsCreator(int Creatorr)async{
    (await getPrefs()).setInt(is_Creator,Creatorr);
  }

  Future<int> GetIsCreator() async{
    return ((await getPrefs()).getInt(is_Creator))??0;
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
  @override
  Future<void> logout() async{
    (await getPrefs()).setBool(IS_LOGIN, false);
    (await getPrefs()).setString(access_token,"");
    (await getPrefs()).setString(TOKEN,"");
  }

  @override
  Future<void> SetisFirstTimeLogin() async{
    (await getPrefs()).setBool(isFirstTimeLogin, false);
  }

  @override
  Future<bool> GetisFirstTimeLogin() async{
    return ((await getPrefs()).getBool(isFirstTimeLogin)??true);
  }



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
  // @override
  // Future<bool> getNotification() async{
  //
  //   return (await getPrefs()).getBool(NOTIFI) ?? false;
  // }
  //
  // @override
  // Future<void> setNotification(bool value)async {
  //
  //   (await getPrefs()).setBool(NOTIFI, value);
  // }


@override
Future<void> SetLatLng(double Lat,double Lng)async {
  (await getPrefs()).setDouble(lat, Lat);
  (await getPrefs()).setDouble(lng, Lng);
}

@override
Future<String> getToken() async {
  return ((await getPrefs()).getString(access_token)??"");
}
  @override
  Future<void> SetToken(String token) async{
    (await getPrefs()).setString(access_token,token);
  }//


  @override
Future<int> getUserId() async {
  return ((await getPrefs()).getInt(ID)??0);
}


  Future<String> GetTimeZone() async {
    return ((await getPrefs()).getString(Time_Zone)??"");
  }

  Future<void> SetTimeZone(String TimeZone)async{
    (await getPrefs()).setString(Time_Zone,TimeZone);
  }

}


