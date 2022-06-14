
import 'package:bubbles/App/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';


import '../../Profile_Screen/pages/Porfile_Screen.dart';
class Followed extends StatefulWidget {
  const Followed({Key? key}) : super(key: key);

  @override
  State<Followed> createState() => _FollowedState();
}

class _FollowedState extends State<Followed>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //
  late FocusNode FocuseNODE;

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
      body:
      ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: h/25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: h / 100, right: h / 50),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                "Assets/images/Frame 11.svg",
                                width: 30,
                                color: COLOR.surface),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                      Text('Followed', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 23
                      ),),
                      Text(""),
                      Text(""),

                    ],
                  ),
                ),
                Text(""),
                Text(""),
                Column(
                  children: [
                    Container(
                      child :
                      ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 5,);  },
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap:(){},
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: h/40,left: h/40),
                                    width: w/1.01,
                                    height: h/10,
                                    decoration:  BoxDecoration(
                                      color: COLOR.background,
                                      //  color:
                                      // status?  0xff606060: Color(0xffEAEAEA),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(5),
                                        topLeft: Radius.circular(40),
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
                                                  radius: 28,
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
                                                      fontSize: 20,
                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight: FontWeight.normal,
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
