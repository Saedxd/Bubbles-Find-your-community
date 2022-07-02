import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'DetailedAvatar_Screen.dart';

class ChooseAvatar extends StatefulWidget {
  UsersData? Users;
  ChooseAvatar({this.Users});



  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  String Image2 = "";
  final _SignUpBloc = sl<SignUpBloc>();
  bool Selected = false;
  int AvatarID = 10000012;

  @override
  void initState() {
    super.initState();
    _SignUpBloc.add(GetAvatars());
  }

  String? SelectedAvatar;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc: _SignUpBloc,
        builder: (BuildContext context, SignUpState state) {
          // if (state.success == true &&
          //     _formkey1.currentState!.validate() &&
          //     DiDitOnce == true) {
          //   if (state.data!.msg == "success") {
          //
          //     pref.saveUser(
          //       state.data as UserData,
          //       state.data!.user!.token!,
          //       true,
          //     );
          //
          //     WidgetsBinding.instance!.addPostFrameCallback(
          //             (_) { Navigator.of(context).push(
          //           CupertinoPageRoute(
          //             builder: (BuildContext context) {
          //               return NavigatorTopBar();
          //             },
          //           ),
          //         );
          //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //         }
          //     );
          //     DiDitOnce = false;
          //
          //   }
          //   else if (state.data!.msg == "Email or password incorrect") {
          //
          //
          //     Future.delayed(Duration.zero, () {
          //       Page2().method(_scaffoldKey.currentContext!, "Error",
          //           state.data!.msg!, "Back");
          //     });
          //     DiDitOnce = false;
          //   }
          // }
          return Scaffold(
            resizeToAvoidBottomInset : false,
            backgroundColor: ChooseAvatarBack,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      Container(
                        margin: EdgeInsets.only(right: h/20,top: h/30,bottom: h/40),
                        child: Center(
                          child: Text(
                            'Choose your avatar',
                            textAlign: TextAlign.left,
                            style:_TextTheme.headlineLarge!.copyWith(
                                fontSize: 3.5 *
                                    SizeConfig
                                        .blockSizeVertical!
                                        .toDouble(),
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            )

                          ),
                        ),
                      ),


                  Stack(
                    children: [
                      (state.success == true)
                          ? Container(
                              width: w / 1.1,
                              height: h / 1.319,
                              child:  ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child:  Container(
                                        child:  GridView.builder(
                                            cacheExtent : 500,
                                            shrinkWrap: true,
                                            itemCount: state.GetAvatar!.avatars!.length,
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              childAspectRatio: (5 / 5.5),
                                            ),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                  onTap: () {
                                                    SelectedAvatar = state
                                                        .GetAvatar!.avatars![index].image!
                                                        .toString();
                                                    Selected = true;
                                                    AvatarID = state
                                                        .GetAvatar!.avatars![index].id!;
                                                    print(AvatarID);
                                                    widget.Users!.SetAvatar(AvatarID);
                                                    Selected
                                                        ? WidgetsBinding.instance!
                                                        .addPostFrameCallback((_) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => DetailAvatar(
                                                            SelectedAvatar: SelectedAvatar,
                                                            Users : widget.Users
                                                        ),
                                                      ),
                                                    ))
                                                        : print("Choose Avatar");
                                                  },
                                                  child: Container(

                                                    margin: EdgeInsets.all(5),
                                                    child: CachedNetworkImage(
                                                      imageUrl:  state.GetAvatar!
                                                          .avatars![index].image!,
                                                      fit: BoxFit.fill,
                                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                          CircularProgressIndicator(value: downloadProgress.progress),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                  ));
                                            })
                                    ),
                                  ))
                          : state.isLoading == true
                              ? Container(
                          width: w / 1.1,
                          height: h / 1.319,
                                  child: Center(
                                      child: listLoader(context: context)))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: w / 1.1,
                                        height: h / 1.319,
                                        child: const Text("Error Was Found"),
                                      ),
                                    ),
                                  ],
                                ),
                    ],
                  ),

                  Expanded(
                    child: Container(
                      
                      margin: EdgeInsets.only(top:h/40 ,bottom: h/40),
                      child: InkWell(
                          onTap: () {
                          if ( Selected) {
                            widget.Users!.SetAvatar(AvatarID);
                            WidgetsBinding.instance!
                                .addPostFrameCallback((_) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailAvatar(
                                          SelectedAvatar: SelectedAvatar,
                                          Users : widget.Users
                                        ),
                                  ),
                                ));

                            print(AvatarID);
                          }

                          },
                          child: Container(
                            width: w / 1.3,
                            height: h / 15,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.15000000596046448),
                                    offset: Offset(0, 0),
                                    blurRadius: 6)
                              ],
                              color: Color.fromRGBO(148, 38, 87, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style:
                                _TextTheme.headline1!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  fontSize: 3 *
                                      SizeConfig
                                          .blockSizeVertical!
                                          .toDouble(),
                                ),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }
}
