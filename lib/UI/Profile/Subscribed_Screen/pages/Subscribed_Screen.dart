
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/Subscribed_Screen/bloc/Subscribed_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';


import '../../Profile_Screen/pages/Porfile_Screen.dart';
class Subscribed extends StatefulWidget {
  const Subscribed({Key? key}) : super(key: key);

  @override
  State<Subscribed> createState() => _SubscribedState();
}

class _SubscribedState extends State<Subscribed>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //
  late FocusNode FocuseNODE;
  final _SubscribedBloc = sl<SubscribedBloc>();
  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: h/25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 15.w),
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "Assets/images/Frame 11.svg",
                              width: 30.w,
                              color: COLOR.surface),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: Text('Subscribed', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 23.sp
                      ),),
                    ),
                  ],
                ),
              ),

              Column(
                children: [

                  Row(
                    children: [
                      Container(

                        margin: EdgeInsets.only(top: 23.h,left: 22.w,bottom: 18.h),
                        child: Text('Suggestions', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 20.sp,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                            height: 1
                        ),),
                      ),
                    ],
                  ),
                  Container(
                    width: w,
                    height: 112.h,
                    margin: EdgeInsets.only(left: 21.w),
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child:
                ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 5.w );
                      },
                       itemBuilder: (BuildContext context, int index) {

                      return
                        Row(
                          children: [
                            Container(
                                width: 107.w,
                                height: 112.h,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    topRight: Radius.circular(5.r),
                                    bottomLeft: Radius.circular(5.r),
                                    bottomRight: Radius.circular(5.r),
                                  ),
                                  color : Color.fromRGBO(96, 96, 96, 1),
                                ),
                              child: Stack(
                                children: [

                                      Container(
                                          width: 107.w,
                                          height: 38.h,

                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                  borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(5.r),
                                      topRight: Radius.circular(5.r),
                                      bottomLeft: Radius.circular(5.r),
                                      bottomRight: Radius.circular(5.r),
                                    ),),
                                      ),
                                      Positioned(
                                        right: 0,
                                        left: 0,
                                        top: 7.17.h,
                                        child: CircleAvatar(
                                          radius: 22.w,
                                        ),
                                      ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    top: 55.h,
                                    child: Column(
                                      children: [
                                        Text('Username', textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Display',
                                            fontSize: 10.582676887512207.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w600,
                                            height: 1
                                        ),),
                                        Text('Creator/Organiser', textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 8.818897247314453.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                            height: 1.700000021627972
                                        ),),
                                        Container(
                                            width: 95.24409484863281.w,
                                            height: 18.519685745239258.h,
                                            margin: EdgeInsets.only(top: 9.h),
                                            decoration: BoxDecoration(
                                              borderRadius : BorderRadius.only(
                                                topLeft: Radius.circular(44.094486236572266.r),
                                                topRight: Radius.circular(44.094486236572266.r),
                                                bottomLeft: Radius.circular(44.094486236572266.r),
                                                bottomRight: Radius.circular(44.094486236572266.r),
                                              ),
                                              color : Color.fromRGBO(130, 125, 226, 1),
                                            ),
                                          child: Center(
                                            child:
                                            Text('Subscribe', textAlign: TextAlign.center, style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 8.818896293640137.sp,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w900,
                                                height: 1
                                            ),),
                                          ),
                                        )
                                      ],
                                    ),
                                  )



                                ],
                              ),
                            ),
                          ],
                        );
                }
                ),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 34.h,bottom: 10.h,left: 22.w),
                        child: Text('Subscribed Pages:', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 20.sp,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                            height: 1
                        ),),
                      ),
                    ],
                  ),

                  Container(
                    width: w,
                    height: h/1.7,
                    child :
                    ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 7.h,);  },
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap:(){},
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: h/40,left: h/40),
                                  width: w/1.01,
                                  height: h/12,
                                  decoration:  BoxDecoration(
                                    color: COLOR.background,
                                    //  color:
                                    // status?  0xff606060: Color(0xffEAEAEA),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40.r),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(40.r),
                                      topRight: Radius.circular(5),
                                    ),
                                    boxShadow: [
                                      BoxShadow(

                                          color: COLOR.primaryVariant,
                                          offset: Offset(0, 0),
                                          blurRadius: 5)
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("  "),
                                              CircleAvatar(
                                                radius: 22.w,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(""),
                                            Row(
                                              children: [
                                                Text("    "),
                                                Text('My_Friend_Pedro', textAlign: TextAlign.left, style: TextStyle(
                                                    color: COLOR.onBackground,
                                                    fontFamily: 'Sofia Pro',
                                                    fontSize: 20.sp,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1
                                                ),),
                                              ],
                                            ),
                                            Text(""),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),),

    );
  }
}
