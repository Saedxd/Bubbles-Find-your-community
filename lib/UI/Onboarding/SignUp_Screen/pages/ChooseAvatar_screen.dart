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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Scaffold(
            resizeToAvoidBottomInset : false,
            backgroundColor: ChooseAvatarBack,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      Container(
                        margin: EdgeInsets.only(top: h/30,bottom: h/40),
                        child: Center(
                          child: Text(
                            'Choose your avatar',
                            textAlign: TextAlign.left,
                              style:_TextTheme.headlineLarge!.copyWith(
                                  letterSpacing: 0.5,
                                  fontSize: 20.sp,
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
                              width: w / 1.32,
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
                                              childAspectRatio: (5 / 4.7),
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
                                                        ? WidgetsBinding.instance
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
                                                    child: ClipOval(
                                                        child: SizedBox.fromSize(
                                                          size: Size.fromRadius(48), // Image radius
                                                          child :CachedNetworkImage(
                                                            imageUrl: state.GetAvatar!
                                                                .avatars![index].image!,
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                CircularProgressIndicator(value: downloadProgress.progress),
                                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                                          ),
                                                        ))


                                                    // CachedNetworkImage(
                                                    //   imageUrl:
                                                    //   fit: BoxFit.fill,
                                                    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                    //       CircularProgressIndicator(value: downloadProgress.progress),
                                                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                                                    // ),
                                                  ));
                                            })
                                    ),
                                  ))
                          : state.isLoading == true
                              ? Container(
                          width: w / 1.32,
                          height: h / 1.319,
                                  child: Center(
                                      child: listLoader(context: context)))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: w / 1.32,
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
                            WidgetsBinding.instance
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
                            width: w / 1.45,
                            height: h / 15,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular( h/90.5),
                                topRight:Radius.circular( h/90.5),
                                bottomLeft: Radius.circular( h/90.5),
                                bottomRight:Radius.circular( h/90.5),
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
                                  fontSize: 17.sp,
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
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}
