
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_bloc.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_event.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeAvatarScreen extends StatefulWidget {
  const ChangeAvatarScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAvatarScreen> createState() => _ChangeAvatarScreenState();
}

class _ChangeAvatarScreenState extends State<ChangeAvatarScreen> {
  final _ProfileBloc = sl<ProfileBloc>();
  @override
  void initState() {
    super.initState();
    _ProfileBloc.add(GetAvatars());
  }
  bool diditonce = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocBuilder(
        bloc: _ProfileBloc,
        builder: (BuildContext context, profileState state) {
          if ( state.successAvatar==true &&diditonce==true){
            WidgetsBinding.instance!.addPostFrameCallback((_){
              Navigator.pop(context);
            });
            diditonce = false;
          }
          return Scaffold(
            body: SafeArea(
              child:
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: h/100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                            margin: EdgeInsets.only(
                                right: h / 35),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  "Assets/images/Frame 11.svg",
                                  width: 30,
                                  color: ColorS.surface),
                              onPressed:(){
                                Navigator.pop(context);
                              },
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: h / 100),
                          child: Text('Change Avatar', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 23

                          ),),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Stack(
                    children: [
                      (state.success == true)
                          ? Container(
                        width: w/1.33,
                        height: h/1.19,
                        child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child:  GridView.builder(
                            cacheExtent : 500,
                            shrinkWrap: true,
                            itemCount: state.GetAvatar!.avatars!.length,
                            //  physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: (5 / 4.7),
                            ),
                            itemBuilder: (context, index) {
                              return  InkWell(
                                onTap: (){
                                  Future.delayed(Duration.zero, () async {
                                    _ProfileBloc.add(ChangeAvatar((b) =>b
                                      ..AvatarId = state.GetAvatar!.avatars![index].id
                                    ));
                                    diditonce =true;
                                  });
                                },
                                child: Container(
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
                                    //   imageUrl:  state.GetAvatar!
                                    //       .avatars![index].image!,
                                    //   fit: BoxFit.fill,
                                    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    //       CircularProgressIndicator(value: downloadProgress.progress),
                                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                                    // ),
                                  )
                                ),
                              );
                            }
                        )),
                    )
                          : state.isLoading == true
                          ? Container(
                          width: w/1.33,
                          height: h/1.19,
                          child: Center(child: listLoader(context: context)))
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: w/1.33,
                              height: h/1.19,
                              child: const Text("Error Was Found"),
                            ),
                          ),
                        ],
                      ),


                   state.isLoadingAvatar == true
                    ? Container(
                       width: w/1.33,
                       height: h/1.19,
                       child: Center(child: listLoader(context: context)))
                      :SizedBox(),
                    ],
                  ),

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
