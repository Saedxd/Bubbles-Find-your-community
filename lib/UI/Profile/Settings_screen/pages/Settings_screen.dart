
import 'package:bubbles/UI/Profile/FreindRequests_screen/pages/FreindRequests_screen.dart';
import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/pages/SuggestedFrineds_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../Profile_Screen/pages/Porfile_Screen.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
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
  Widget build(BuildContext context){
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: h/25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                           right: h / 20),
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "Assets/images/Frame 11.svg",
                            width: 30,
                            color: ColorS.surface),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                  Text('Settings', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                      fontSize: 23
                  ),),
                  Text(""),
                  Text(""),

                ],
              ),
            ),


                Container(
                  width: w/1.4,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          WidgetsBinding.instance!
                              .addPostFrameCallback((_) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const FreindRequests()),
                          ));
                        },
                        child: Container(
                          width: w / 2.7,
                          height: h / 14.5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                            color: Color.fromRGBO(148, 38, 87, 1),
                          ),
                          child: const Center(
                            child: Text(
                              'Friend requests', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'ABeeZee',
                                fontSize: 15,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 10,),
          Container(
            width: w/1.4,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    WidgetsBinding.instance!
                        .addPostFrameCallback((_) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const SuggestedFreinds_Screen()),
                    ));
                  },
                  child: Container(
                    width: w / 2.7,
                    height: h / 14.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                      color: Color.fromRGBO(148, 38, 87, 1),
                    ),
                    child: const Center(
                      child: Text(
                        'Suggested friends', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'ABeeZee',
                            fontSize: 15,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                    ),
                  ),
                ),
                ]
            )
          )

          ],
        ),
      ),
    );
  }
}
