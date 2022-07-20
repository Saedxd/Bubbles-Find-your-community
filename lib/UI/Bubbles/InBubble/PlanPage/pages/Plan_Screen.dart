

import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Plan_Screen extends StatefulWidget {
  Plan_Screen({Key? key,required this.Event_id,required this.Event_name}) : super(key: key);
int Event_id = 0;
String Event_name = "";
  @override
  State<Plan_Screen> createState() => _Plan_ScreenState();
}


class _Plan_ScreenState extends State<Plan_Screen> {
bool selected = false;
final _PlanPage_Bloc = sl<PlanPageBloc>();

@override
  void initState() {
    super.initState();
    socket!.io..disconnect()..connect();
    _PlanPage_Bloc.add(GetDetailedPlan((b) => b
    ..Event_id=widget.Event_id
    ));
    _PlanPage_Bloc.add(GetProfile());
    _PlanPage_Bloc.add(GetWhoSavedBubble((b) =>
    b..Bubble_id = widget.Event_id
    ));
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
    {

      return
      Scaffold(
        body: SafeArea(
          child: Container(
            width: w,
            height: h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      state.success!
                          ?Container(
                        width: w,
                        height: h / 4,
                        margin: EdgeInsets.only(top: h / 50),
                        child: Image.network(state.GetDetailedPlann!.data!.images![0].image.toString(),
                          fit: BoxFit.fill,),
                      )
                          :state.isLoading!
                          ?Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: listLoader(
                                  context:
                                  context)),
                        ],
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
                      Container(
                        width: w,
                        height: h/14,
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
                            Column(
                              children: [
                                Container(
                                  width: w/7,
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        "Assets/images/Frame 11.svg",
                                        width: 30,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: w/1.5,
                              child: Text(
                                widget.Event_name
                                ,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 22,
                                    letterSpacing: 0.2,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                            ),


                            Column(
                              children: [
                                Container(
                                  width: w/7,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.asset(
                                          "Assets/images/SAVE.svg",
                                          width: h / 8,
                                        ),
                                        onPressed: () {
                                          _PlanPage_Bloc.add(ToggleSaveBubble((b) =>
                                          b..Bubble_id = widget.Event_id
                                          ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ),
               
                    ],
                  ),
                
                  state.success!?
                  Column(
                    children: [
                      SizedBox(height: h / 50,),
                      Container(
                          width: w/1.2,
                          child:
                          Text('Icon Music Event', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 13,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                      ),

                      SizedBox(height: h / 50,),

                      Container(
                        width: w/1.2,
                        child: Text("At ${state.GetDetailedPlann!.data!.location.toString()}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(20, 208, 120, 1),
                              fontFamily: 'Red Hat Display',
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w600,
                              height: 1
                          ),),
                      ),

                      SizedBox(height: h / 50,),


                      Container(
                        width: w/1.2,
                        child: Text("${state.GetDetailedPlann!.data!.description.toString()}",
                          textAlign: TextAlign.left,
                          style:TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Sofia Sans',
                              fontSize: 11,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.6363636363636365
                          ),),
                      ),

                      SizedBox(height: h / 50,),
                      state.GetDetailedPlann!.data!.created_by!.type=="user"?
                      Container(
                          width: w,
                          child: Row(
                              children: [
                                Container(
                                    width: w / 2.7,
                                    // color: Colors.black,
                                    margin:EdgeInsets.only(
                                        right: h / 100,left: h/23),
                                    child:
                                    Text(
                                        'Bubble Duration:',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme
                                            .headlineLarge!
                                            .copyWith(
                                          fontFamily: 'Red Hat Display',
                                          fontWeight: FontWeight
                                              .w400,
                                          fontSize: 15,
                                        ))
                                )
                                ,
                                Container(
                                    width: w / 2.7,
                                    margin: EdgeInsets.only(
                                        left: h / 40),
                                    child :
                                    Text('Event Date:',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme
                                            .headlineLarge!
                                            .copyWith(
                                          fontFamily: 'Red Hat Display',
                                          fontWeight: FontWeight
                                              .w400,
                                          fontSize: 15,
                                        ))
                                ),


                              ]
                          )
                      ):Text(""),
                      state.GetDetailedPlann!.data!.created_by!.type=="user"
                          ?    Container(
                        width: w,
                        child: Row(
                          children: [
                            Container(
                              width: w / 2.7,
                              height: h / 5,
                              // color: Colors.black,
                              margin:EdgeInsets.only(
                                  right: h / 100,left: h/23),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: h / 13,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Image.asset(
                                                "Assets/images/Group 229.png"),
                                            Image.asset(
                                                "Assets/images/Group 229.png"),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          ' ${state.GetDetailedPlann!.data!.start_event_date.toString()}\n'
                                              '  To \n'
                                              ' ${state.GetDetailedPlann!.data!.end_event_date.toString()}',
                                          textAlign:
                                          TextAlign.left,
                                          style: _TextTheme
                                              .headline5),
                                    ],
                                  ),


                                ],
                              ),
                            ),

                            Container(
                              width: w / 2.7,
                              height: h / 5,
                              margin: EdgeInsets.only(
                                  left: h / 40,top: h/50),
                              child: ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics:
                                const BouncingScrollPhysics(),
                                scrollDirection:
                                Axis.vertical,
                                itemCount:state.GetDetailedPlann!.data!.dates!.length,
                                itemBuilder:
                                    (BuildContext context,
                                    int index) {
                                  return Row(
                                    children: [
                                      Image.asset(
                                          "Assets/images/Group 229.png"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                            state.GetDetailedPlann!.data!.dates![index].date.toString(),
                                            textAlign:
                                            TextAlign
                                                .left,
                                            style: _TextTheme
                                                .headline5),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context,
                                    int index) {
                                  return const SizedBox(
                                    height: 3,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ):Text(""),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Organizers:', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(20, 208, 120, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w600,
                              height: 1
                          ),),
                          Text('${state.GetWhoSavedBubbles!.data!.length} people saved it:', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(20, 208, 120, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w600,
                              height: 1
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: h/30,),
                          state.GetDetailedPlann!.data!.organizers!.length!=0?
                          Container(
                            width: w/3.5,height: h/15,
                            child: ListView.builder(
                              itemCount: state.GetDetailedPlann!.data!.organizers!.length<3?state.GetDetailedPlann!.data!.organizers!.length:3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                String Value = state.GetDetailedPlann!.data!.organizers![index].background_color.toString();
                                if (Value.contains("#",0)){
                                  Value = Value.substring(1);
                                  Value = "0xff$Value";
                                }
                                var myInt = int.parse(Value);
                                var BackgroundColor= myInt;
                                return    Row(
                                  children: [
                                    index==0
                                        ? SizedBox(width: 5,)
                                        : Container(),
                                    Align(
                                        widthFactor: 0.75,
                                        alignment: Alignment.topCenter,
                                        child:
                                        Container(
                                          child: Column(
                                            children: [
                                              Wrap(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: Color(BackgroundColor),
                                                    //    backgroundImage: NetworkImage(state.GetDetailedPlann!.data!.organizers![index].avatar.toString()),
                                                  )
                                                ],

                                              ),
                                            ],

                                          ),
                                        )
                                    ),
                                  ],
                                );
                              },
                            ),
                          ):Container(    width: w/2.5,height: h/15,child: Center(child: Text("None"))),
                          state.GetDetailedPlann!.data!.organizers!.length!=0?
                          Text("+${state.GetDetailedPlann!.data!.organizers!.length.toString()}"
                            , textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 19,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w500,
                                height: 1
                            ),):Text(""),
                          SizedBox(width: h/30,),
                          Container(
                            width: w/3.5,height: h/15,
                            //  color: Colors.pink,
                            child: ListView.builder(
                              itemCount: state.GetWhoSavedBubbles!.data!.length<3? state.GetWhoSavedBubbles!.data!.length:3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                String Value =  state.GetWhoSavedBubbles!.data![index].background_color.toString();
                                if (Value.contains("#",0)){
                                  Value = Value.substring(1);
                                  Value = "0xff$Value";
                                }
                                var myInt = int.parse(Value);
                                var BackgroundColor= myInt;
                                return    Row(
                                  children: [
                                    index==0
                                        ? SizedBox(width: 5,)
                                        : Container(),
                                    Align(
                                        widthFactor: 0.75,
                                        alignment: Alignment.topCenter,
                                        child:
                                        Container(
                                          child: Column(
                                            children: [
                                              Wrap(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: Color(BackgroundColor),
                                                    backgroundImage: NetworkImage( state.GetWhoSavedBubbles!.data![index].avatar.toString()),
                                                  )
                                                ],

                                              ),
                                            ],

                                          ),
                                        )
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          state.GetWhoSavedBubbles!.data!.length!=0?
                          Text("+${state.GetWhoSavedBubbles!.data!.length}"
                            , textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 19,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w500,
                                height: 1
                            ),):Text("")

                        ],
                      )

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
                  SizedBox(height: h/4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: w / 2.3,
                        height: h / 13,
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
                            if ( state.success!) {
                              WidgetsBinding.instance!
                                  .addPostFrameCallback(
                                      (_) =>
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GroupChat(plan_Title: state
                                                  .GetDetailedPlann!.data!.title
                                                  .toString(),
                                                MY_ID: state.ProfileDate!.user!
                                                    .id!,
                                                bubble_id: widget.Event_id, Plan_Description: state.GetDetailedPlann!.data!.description.toString(),
                                              ),),
                                      ));
                            }
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
                      ),
                    ],
                  ),
                  // Expanded(
                  //   child: CustomScrollView(
                  //       slivers: [
                  //         SliverAppBar(
                  //           automaticallyImplyLeading: true,
                  //           pinned: false,
                  //           floating: false,
                  //           expandedHeight:  h / 1.5,
                  //           flexibleSpace: FlexibleSpaceBar(
                  //             centerTitle: true,
                  //             title:
                  //
                  //           ),
                  //         ),
                  //         SliverList(
                  //
                  //             delegate: SliverChildListDelegate([
                  //
                  //
                  //
                  //             ])),
                  //       ]),
                  // ),
                 
                ],
              ),
            ),
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




