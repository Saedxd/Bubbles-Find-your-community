

import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Plan_Screen extends StatefulWidget {
  Plan_Screen({Key? key,required this.Event_id}) : super(key: key);
int Event_id = 0;
  @override
  State<Plan_Screen> createState() => _Plan_ScreenState();
}

class _Plan_ScreenState extends State<Plan_Screen> {
bool selected = false;
final _PlanPage_Bloc = sl<PlanPageBloc>();

@override
  void initState() {
    super.initState();
    _PlanPage_Bloc.add(GetDetailedPlan((b) => b
    ..Event_id=widget.Event_id
    ));

    _PlanPage_Bloc.add(GetProfile());
}


  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(
        bloc: _PlanPage_Bloc,
        builder: (BuildContext Context, PlanPageState state)
    {return
      Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Stack(
                      children: [
                        Container(
                          width: w,
                          height: h / 2,
                          margin: EdgeInsets.only(top: h / 50),
                          child: Image.asset("Assets/images/Rectangle 136.png",
                            fit: BoxFit.fill,),
                        ),
                        Container(
                          width: w,
                          height: h / 14.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4
                            )
                            ],
                            color: Color.fromRGBO(148, 38, 87, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                    "Assets/images/Frame 11.svg",
                                    width: 30,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),

                              state.success!?
                             Container(
                               child: Text(state.GetDetailedPlann!.data!.title.toString(),
                                 textAlign: TextAlign.left, style: TextStyle(
                                     color: Color.fromRGBO(255, 255, 255, 1),
                                     fontFamily: 'Red Hat Display',
                                     fontSize: 22,
                                     letterSpacing: 0.2,
                                     fontWeight: FontWeight.w600,
                                     height: 1
                                 ),),
                             )
                                  : state.isLoading!
                                    ? Expanded(
                                      child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                  child: listLoader(
                                            context:
                                            context)),
                                        ],
                                      ),
                                    )
                                  :Text(state.error!,
                                textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 22,
                                    letterSpacing: 0.2,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),


                              SizedBox(width: 10,),
                              IconButton(
                                icon: SvgPicture.asset(
                                    "Assets/images/save.svg",
                                    width: h / 50,
                                    color: !selected ? Colors.white : Colors
                                        .orange),
                                onPressed: () {
                                  // setState(() {
                                  //   selected = !selected;
                                  // });
                                  print(selected);
                                },
                              ),
                            ],
                          ),

                        ),
                      ]
                  ),
                ],
              ),

              state.success!?
                  Column(
                children: [
                  SizedBox(height: h / 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("At ${state.GetDetailedPlann!.data!.location.toString()}", textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(20, 208, 120, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 22,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.w600,
                            height: 1
                        ),),
                      Text(""),
                      Text(""),
                    ],
                  ),
                  SizedBox(height: h / 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('10:00am - 04:00am', textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 15.528663635253906,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.w200,
                            height: 1
                        ),),
                      Text(""),
                      Text(""),
                    ],
                  ),
                  SizedBox(height: h / 22,),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                      Container(
                            width: w / 1.2,
                            height: h/5.29,
                            margin: EdgeInsets.only(bottom: h/100),
                            child: Text(
                              state.GetDetailedPlann!.data!.description.toString(),
                              textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Sofia Sans',
                                fontSize: 17,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w300,
                                height: 1.2857142857142858
                            ),),
                          ),
                      ],
                    ),
                  ),
                ],
              )

                  : state.isLoading!
                  ? Center(
                  child: listLoader(
                      context:
                      context))
                  : Text(state.error!,
                textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Red Hat Display',
                    fontSize: 22,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600,
                    height: 1
                ),),

                  Container(
                        width: w / 2.3,
                        height: h / 13,
                        margin: EdgeInsets.only(bottom: h / 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(27),
                            topRight: Radius.circular(27),
                            bottomLeft: Radius.circular(27),
                            bottomRight: Radius.circular(27),
                          ),
                          color: Color.fromRGBO(20, 208, 120, 1),
                        ),
                        child:    InkWell(
                          onTap: () {
                            WidgetsBinding.instance!
                                .addPostFrameCallback(
                                    (_) =>
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GroupChat(Plain_Title: state.GetDetailedPlann!.data!.title.toString(),MY_ID: state.ProfileDate!.user!.id!,),),
                                    ));
                          },
                          child:Center(
                          child:
                          Text('Enter Bubble', textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(47, 47, 47, 1),
                                fontFamily: 'Red Hat Display',
                                fontSize: 19,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                                height: 1
                            ),)
                          ,
                        ),
                      ),
                    )
            ],
          ),
        ),
      );
    }
    );
  }

Widget listLoader({context}) {
  return const SpinKitThreeBounce(
    color: Colors.blue,
    size: 30.0,
  );
}

}



