import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/ChooseAvatar_screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/ResponsiveText.dart';

class slider extends StatefulWidget {
  UsersData? Users;
  slider({this.Users});

  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int dot = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: sliderBack,
      body: SafeArea(
        child: Stack(
            children: [
              Container(
                width: w,
                height: h,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        dot = index;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(""),
                                Text(""),

                                    Stack(
                                        children:[
                                          Container(
                                            margin: EdgeInsets.only(right: h / 4,top: h/100,left: h/20),
                                            child: RichText(
                                              text: TextSpan(

                                                children: <TextSpan>[
                                                  (index == 0)
                                                      ? TextSpan(
                                                      text: "Be ",
                                                      style: _TextTheme.headline1!.copyWith(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 22,
                                                          color: Color(0xff606060)),
                                                    children: [
                                                      TextSpan(
                                                          text: "There",
                                                          style: _TextTheme.headline1!
                                                              .copyWith(
                                                              fontWeight: FontWeight
                                                                  .w700,
                                                              fontSize: 22,
                                                              color:
                                                              Color(0xff606060))
                                                      )
                                                    ],
                                                    )
                                                      : (index != 1)
                                                      ? TextSpan(

                                                      text: "#BeMore",
                                                      style: _TextTheme.headline1!
                                                          .copyWith(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 22,
                                                          color: Color(
                                                              0xff606060),

                                                      ),
                                                  )
                                                      : TextSpan(
                                                    text: "Be ",
                                                    style: _TextTheme.headline1!.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 22,
                                                        color: Color(0xff606060)),
                                                    children: [
                                                      TextSpan(
                                                          text: "Bubbly",
                                                          style: _TextTheme.headline1!
                                                              .copyWith(
                                                              fontWeight:
                                                              FontWeight.w700,
                                                              fontSize: 22,
                                                              color: Color(
                                                                  0xff606060))
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),Container(

                                            height: h/1.79,
                                            width: w,
                                            child: Image.asset((index == 0)
                                                ? "Assets/images/Be_There 1.png"
                                                : (index != 1)
                                                ? "Assets/images/Be_There 2.png"
                                                : "Assets/images/Be_Bubbly 1.png"
                                              ,fit: BoxFit.fill,
                                            ),
                                          ),
                                        ]
                                    ),

                             Column(
                               children: [
                                 Container(
                                     width: w / 1.5,
                                     child: Text(
                                       (index == 0)
                                           ? """Find your favorite bubble, and get there!"""
                                           : (index == 1)
                                           ? "Meet with people on the spot, and babble."
                                           : "And if you’re shy, don’t sweat it! Use your avatar and #bemore",
                                       textAlign: TextAlign.left,
                                       style: const TextStyle(
                                           color: Color.fromRGBO(96, 96, 96, 1),
                                           fontFamily: 'Red Hat Text',
                                           fontSize: 18,
                                           letterSpacing: 0,
                                           fontWeight: FontWeight.w400,
                                           height: 1),
                                     )),
                                 (index != 2)
                                     ?
                                     Container(
                                       width: w / 1.5,
                                       height: h / 17,
                                       margin: EdgeInsets.only(top: h/20),
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
                                       child:  InkWell(
                                         onTap: () {
                                           if (dot < 3 && dot > -1) dot += 1;
                                           if (_pageController.hasClients) {
                                             _pageController.animateToPage(
                                               dot,
                                               duration: const Duration(milliseconds: 700),
                                               curve: Curves.easeInOut,
                                             );
                                           }
                                         },
                                         child:Center(
                                         child: Text(
                                           'Got it',
                                           textAlign: TextAlign.center,
                                           style :
                                           _TextTheme.headline1!.copyWith(
                                             fontWeight: FontWeight.w600,
                                             fontSize: 3 *
                                                 SizeConfig
                                                     .blockSizeVertical!
                                                     .toDouble(),
                                           ),
                                         ),
                                       ),
                                     ))
                                     :Container(
                                       width: w / 1.5,
                                       height: h / 17,
                                       margin: EdgeInsets.only(top: h/20),
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
                                       child: InkWell(
                                         onTap: () {
                                           WidgetsBinding.instance!.addPostFrameCallback(
                                                   (_) => Navigator.pushReplacement(
                                                 context,
                                                 MaterialPageRoute(
                                                     builder: (context) => ChooseAvatar(
                                                       Users: widget.Users,
                                                     )),
                                               ));
                                         },
                                         child:Center(
                                         child: Text(
                                           'Create Persona',
                                           textAlign: TextAlign.center,
                                           style:      _TextTheme.headline1!.copyWith(
                                             fontWeight: FontWeight.w600,
                                             fontSize: 3 *

                                                 SizeConfig
                                                     .blockSizeVertical!
                                                     .toDouble(),
                                           ),
                                         ),
                                       ),
                                     )),
                               ],
                             )


                              ]));
                    }),
              ),

            ],
          ),

      ),
    );
  }
}
