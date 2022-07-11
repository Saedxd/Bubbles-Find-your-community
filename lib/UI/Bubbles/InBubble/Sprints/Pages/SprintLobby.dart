import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/Pages/SprintMatch.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
class SprintLobby extends StatefulWidget{

   SprintLobby({Key? key,required this.plan_title,required this.Bubble_id,required this.my_id})
       : super(key: key);
String? plan_title;
int Bubble_id;
int my_id;
  @override
  State<SprintLobby> createState() => _SprintLobbyState();
}

class _SprintLobbyState extends State<SprintLobby> {
  final _SprintsChatBloc = sl<SprintsBloc>();

  @override
  void initState(){
    super.initState();
    _SprintsChatBloc.add(GetUsersInsideBubble((b) =>b
    ..Bubble_id = widget.Bubble_id
        ..MY_id = widget.my_id
    ));
    _SprintsChatBloc.add(Get_MYAlias((b) => b..My_ID = widget.my_id));
  }

bool Diditonce = true;
  int? Choosen_ID;
  String? Choosen_Avatar;
  String? Choosen_Alias;
  int? Choosen_Color;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _SprintsChatBloc,
        builder: (BuildContext Context, SprintsState state) {


          void GetRandomUser(int length){
            Random random =  Random();
            int randomNumber = random.nextInt(length);
            Choosen_ID= state.InsideBubbleUsers![randomNumber].id!;
            Choosen_Avatar = state.InsideBubbleUsers![randomNumber].Avatar;
            Choosen_Color = int.parse(state.InsideBubbleUsers![randomNumber].Background_Color!);
            Choosen_Alias = state.InsideBubbleUsers![randomNumber].Alias.toString();
            print(randomNumber);

            Future.delayed(const Duration(milliseconds: 5000), () {

                WidgetsBinding.instance!
                    .addPostFrameCallback((_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SprintMatch(Image1: state.GetAliasMinee!.friend!.avatar.toString(), BackgroundColor1:  int.parse( state.GetAliasMinee!.friend!.background_color!), BackgroundColor2: Choosen_Color!, Image2: Choosen_Avatar!, His_Alias:Choosen_Alias!, MY_ID: widget.my_id, His_ID: Choosen_ID! ,)),
                ));


            });
          }

          if (state.GetInsideUsersSuccess! && Diditonce && state.AliasISsuccess!){
            GetRandomUser(state.InsideBubbleUsers!.length,);
            Diditonce = false;
          }

      return
      Scaffold(
      backgroundColor: Color(0xff303030),
      body: SafeArea(
        child: Container(
          width: w,
          height: h,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                      children: [

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
                            color: Color(0xff15D078)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                             Flexible(
                               child: Row(
                                 children: [
                                   SizedBox(width: h/40,),
                                   IconButton(
                                     icon: SvgPicture.asset(
                                         "Assets/images/Frame 11.svg",
                                         width: 33,
                                         color: Colors.white),
                                     onPressed: () {
                                       Navigator.pop(context);
                                     },
                                   ),
                                  SizedBox(width: h/20,),
                                  Container(
                                         child: Text(widget.plan_title!,
                                           textAlign: TextAlign.left,
                                           overflow: TextOverflow.ellipsis,
                                           style: TextStyle(
                                               color: Color.fromRGBO(255, 255, 255, 1),
                                               fontFamily: 'Red Hat Display',
                                               fontSize: 22,
                                               letterSpacing: 0.2,
                                               fontWeight: FontWeight.w600,
                                               height: 1
                                           ),),
                                       ),
                                 ],
                               ),
                             ),
                              Text(""),
                              Text(""),
                            ],
                          ),

                        ),
                      ]
                  ),
                  SizedBox(height: h/10,),
                  Text('Matchmaking...', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Red Hat Display',
                      fontSize: 19.729999542236328,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1
                  ),),
                  SizedBox(height: h/8,),
                  Container(
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:state.GetInsideUsersSuccess!?state.GetUsersInsideBubble!.users!.length.toString():"0",
                            style: TextStyle(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 25,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w900,
                                height: 1
                            ),
                            children: [
                              TextSpan(
                                text: " users in Lobby",
                                style: TextStyle(
                                    color: Color(0xff15D078),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 25,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w900,
                                    height: 1
                                ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h/20,),

                  state.GetInsideUsersSuccess!
                      ? Container(
                    width: w/1.05,
                    height: h/1.8,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: state.InsideBubbleUsers!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {

                          var myInt = int.parse(state.InsideBubbleUsers![index].Background_Color.toString());
                          var BackgroundColor= myInt;


                          return

                          Column(
                                children: [
                                  Container(
                                    width: w / 1.1,
                                    height: h / 10,
                                    decoration: BoxDecoration(
                                      color: ColorS.secondaryContainer,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(5),
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(5),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorS.primaryVariant ,
                                            offset: Offset(0, 0),
                                            blurRadius: 2)
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            //FrinedsStatus
                                            Stack(
                                                children:[
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text("  "),
                                                      Container(
                                                        width: w/6,
                                                        height: h / 12,
                                                        child:   CachedNetworkImage(
                                                          imageUrl:
                                                          state.InsideBubbleUsers![index].Avatar!,
                                                          errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                          imageBuilder: (context, imageProvider) => CircleAvatar(
                                                            radius: 30,
                                                            backgroundImage: imageProvider,
                                                            backgroundColor:   Color(BackgroundColor),
                                                          ),
                                                        ),

                                                      ),

                                                    ],
                                                  ),
                                                  // state.ChangeStateSuccess!?
                                                  // FrinedsStatus[index]==1?
                                                  // Positioned(
                                                  //   bottom: 0,
                                                  //   right: 0,
                                                  //   child:
                                                  //   CircleAvatar(
                                                  //       backgroundColor:ColorS.secondaryContainer,
                                                  //       radius: 10,
                                                  //       child:  CircleAvatar(backgroundColor: Color(0xff34A853),radius: 8,)),
                                                  // )
                                                  //     :Text("")
                                                  //     :Text("")

                                                  //: Center(
                                                  //                                                   child:SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)
                                                  //                                               ),       SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)
                                                ]
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10,),

                                        Text(
                                            state.InsideBubbleUsers![index].Alias!,
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.headline3!.copyWith(
                                                fontFamily: 'Red Hat Display',
                                                fontWeight: FontWeight.w400
                                                ,fontSize: 24
                                            )

                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              );




                        },
                      ),
                    ),
                  )
                      : state.GetInsideUsersISloading!
                          ? Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: listLoader(
                                          context: context)),
                                ],
                              )
                          : Text("Error"),
                ],
              ),
            ],
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