
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
            const Text(""),
            const Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    //
                    WidgetsBinding.instance!
                        .addPostFrameCallback((_) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const FreindRequests()),
                    ));
                  },
                  child: Container(
                    width: w/3,
                    height: h/12,
                    color: Colors.grey,
                    child: Center(child: Text("Frined Requests")),
                  ),
                ),
                Text(""),
                Text(""),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    //
                    WidgetsBinding.instance!
                        .addPostFrameCallback((_) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const SuggestedFreinds_Screen()),
                    ));
                  },
                  child: Container(
                    width: w/3,
                    height: h/12,
                    color: Colors.grey,
                    child: Center(child: Text("Suggested Freinds")),
                  ),
                ),
                Text(""),
                Text(""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
