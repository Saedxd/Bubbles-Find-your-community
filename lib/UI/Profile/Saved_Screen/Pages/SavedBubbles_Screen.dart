import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_Bloc.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_State.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_event.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
class SavedBubbles extends StatefulWidget {
   SavedBubbles({Key? key,this.User_id}) : super(key: key);
  int? User_id;
  @override
  State<SavedBubbles> createState() => _SavedBubblesState();
}

class _SavedBubblesState extends State<SavedBubbles> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  //
  final _SavedBloc = sl<SavedBubblesBloc>();
  late FocusNode FocuseNODE;

  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    _SavedBloc.add(GetSavedBubbles((b) =>b..User_id = widget.User_id));


  }

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc:   _SavedBloc,
        builder: (BuildContext Context, SavedBubblesState state)
    {
      return
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorS.onInverseSurface,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              width: w,
              height: h,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: h / 100),
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
                        Text('Saved Bubbles', textAlign: TextAlign.left,
                          style: _TextTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 23
                          ),),
                        Text(""),
                        Text(""),
                        IconButton(
                            icon: SvgPicture.asset(
                                state.ShapStatus! ?
                                "Assets/images/reshap1.svg"
                                    : "Assets/images/reshap2.svg"
                                , width: w / 18
                            ),
                            onPressed: () async {
                              _SavedBloc.add(ChangeShapStatus());
                            }
                        )
                      ],
                    ),
                  ),



                  state.success! ?
                  state.SavedBubbleList!.length!=0
                      ?  Center(
                      child: Container(
                        width: w/1.1,
                        height: h/1.141,
                        child :
                        ScrollConfiguration(
                            behavior: MyBehavior(),
                            child:
                            GridView.builder(
                                itemCount: state.SavedBubbleList!.length,
                                scrollDirection: Axis.vertical,
                                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
                                state.ShapStatus!? 2:1,
                                  childAspectRatio: (5 / 5),),
                                itemBuilder: (BuildContext context, int index) {

                                  return
                                    state.ShapStatus!
                                        ?Container(
                                      width: w/2.2,
                                      height:  h / 3.5,
                                      margin: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                          bottomRight: Radius.circular(7),
                                        ),
                                        color : Color.fromRGBO(96, 96, 96, 1),
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: w/2.2,
                                                height: h/6.2,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                  child:CachedNetworkImage(
                                                    fit: BoxFit.fitWidth,
                                                    imageUrl:
                                                    state.SavedBubbleList![index].image.toString(),

                                                    placeholder: (context, url) => Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                                      ],
                                                    ),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Transform.rotate(
                                                angle: -179.99999499104388 * (math.pi / 180),
                                                child: Container(
                                                    width: w/2.2,
                                                    height: h/6.2,
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(7),
                                                        topRight: Radius.circular(7),
                                                        bottomLeft: Radius.circular(7),
                                                        bottomRight: Radius.circular(7),
                                                      ),
                                                      gradient : LinearGradient(
                                                          begin: Alignment(5.730259880964636e-14,-2),
                                                          end: Alignment(2,3.9593861611176705e-16),
                                                          colors: [Colors.transparent,Color(state.SavedBubbleList![index].Color!),]
                                                      ),
                                                    )
                                                ),
                                              ),



                                              Container(
                                                width: w/2.2,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    state.SavedBubbleList![index].User_type=="user"
                                                        ? Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 14,
                                                          backgroundColor: Color(state.SavedBubbleList![index].Color!),
                                                          backgroundImage: NetworkImage(state.SavedBubbleList![index].Creator_Avatar!),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Text(state.SavedBubbleList![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 10.477987289428711,
                                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight: FontWeight.w600,
                                                            height: 1
                                                        ),),

                                                      ],
                                                    )
                                                        : Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Red Hat Display',
                                                        fontSize: 10.477987289428711,
                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight: FontWeight.w600,
                                                        height: 1
                                                    ),),
                                                    SizedBox(width: 5,),


                                                    IconButton(
                                                      icon:SvgPicture.asset("Assets/images/BiggerSaved.svg",fit: BoxFit.fitWidth,width: w/4,) ,
                                                      onPressed: (){
                                                        _SavedBloc.add(UnSaveBubble((b) =>
                                                        b..Bubble_id = state.SavedBubbleList![index].id
                                                          ..index = index
                                                        ));
                                                      },
                                                    ),

                                                  ],
                                                ),
                                              )
                                            ],
                                          ),


                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [



                                                Flexible(
                                                  child:
                                                  Container(
                                                    margin: EdgeInsets.only(left: h/50),
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height:
                                                          10,
                                                        ),
                                                        Container(

                                                          child:      Text(
                                                            state.SavedBubbleList![index].Title.toString(),
                                                            textAlign: TextAlign.left,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: _TextTheme.headlineLarge!.copyWith(
                                                              color: Color(state.SavedBubbleList![index].Color!),
                                                              fontSize: 13,
                                                              letterSpacing: 0,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child:  Text(
                                                            "At ${ state.SavedBubbleList![index].location.toString()}",
                                                            textAlign: TextAlign.left,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: _TextTheme.headlineLarge!.copyWith(
                                                              fontSize: 8,
                                                              letterSpacing: 0,
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                          ),
                                                        ),
                                                        Container(
                                                          child:Text(

                                                            "",
//todo : event interest
                                                            textAlign: TextAlign.left,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: _TextTheme.headlineLarge!.copyWith(
                                                              fontSize: 6,
                                                              letterSpacing: 0,
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  "Assets/images/Exclude.svg",
                                                  width: w/13,
                                                  color : Color(state.SavedBubbleList![index].Color!),
                                                ),

                                              ],
                                            ),
                                          )


                                        ],
                                      ),
                                    )
                                        :Center(
                                      child: Container(
                                          width:w/1.15,
                                          height: h/2.1,
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(7.777777194976807),
                                              topRight: Radius.circular(7.777777194976807),
                                              bottomLeft: Radius.circular(7.777777194976807),
                                              bottomRight: Radius.circular(7.777777194976807),
                                            ),
                                            color : Color.fromRGBO(96, 96, 96, 1),
                                          ),
                                          child : Column(
                                            children: [
                                              Stack(
                                                  children: [
                                                    Container(
                                                      width:w/1.15,
                                                      height: h/2.89,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                        child:CachedNetworkImage(
                                                          fit: BoxFit.fill,
                                                          imageUrl:  state.SavedBubbleList![index].image.toString(),
                                                          placeholder: (context, url) => Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                                            ],
                                                          ),
                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    Transform.rotate(
                                                      angle: -179.99999499423683 * (math.pi / 180),
                                                      child: Container(
                                                          width:w/1.15,
                                                          height: h/2.89,
                                                          decoration: BoxDecoration(
                                                            borderRadius : BorderRadius.only(
                                                              topLeft: Radius.circular(7.777777194976807),
                                                              topRight: Radius.circular(7.777777194976807),
                                                              bottomRight: Radius.circular(7.777777194976807),
                                                              bottomLeft: Radius.circular(7.777777194976807),
                                                            ),
                                                            gradient : LinearGradient(
                                                                begin: Alignment(5.730259880964636e-14,-2),
                                                                end: Alignment(2,3.9593861611176705e-16),
                                                                colors: [
                                                                  Colors.transparent,
                                                                  Color(state.SavedBubbleList![index].Color!),
                                                                ]
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                    Container(
                                                      width:w/1.15,
                                                      height: h/9.89,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          state.SavedBubbleList![index].User_type=="user"
                                                              ? Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 17,
                                                                backgroundColor: Color(state.SavedBubbleList![index].Color!),
                                                                backgroundImage: NetworkImage(state.SavedBubbleList![index].Creator_Avatar!),
                                                              ),
                                                              SizedBox(width: 10,),
                                                              Text(state.SavedBubbleList![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Display',
                                                                  fontSize: 10.477987289428711,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1
                                                              ),),

                                                            ],
                                                          )
                                                              : Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                              fontFamily: 'Red Hat Display',
                                                              fontSize: 10.477987289428711,
                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                              fontWeight: FontWeight.w600,
                                                              height: 1
                                                          ),),

                                                          SizedBox(width: 10,),
                                                          IconButton(
                                                            icon: SvgPicture.asset("Assets/images/BiggerSaved.svg"),
                                                            onPressed: (){
                                                              _SavedBloc.add(UnSaveBubble((b) =>
                                                              b..Bubble_id = state.SavedBubbleList![index].id
                                                                ..index = index
                                                              ));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [

                                                  Flexible(
                                                    child:
                                                    Container(
                                                      margin: EdgeInsets.only(left: h/50),
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height:
                                                            10,
                                                          ),
                                                          Container(

                                                            child: Text(
                                                              state.SavedBubbleList![index].Title.toString(),
                                                              textAlign: TextAlign.left,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: _TextTheme.headlineLarge!.copyWith(
                                                                color: Color(state.SavedBubbleList![index].Color!),
                                                                fontSize: 25,
                                                                letterSpacing: 0,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),

                                                          ),
                                                          SizedBox(height: 5,),
                                                          Container(
                                                            child:  Text(
                                                              "At ${ state.SavedBubbleList![index].location.toString()}",
                                                              textAlign: TextAlign.left,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: _TextTheme.headlineLarge!.copyWith(
                                                                fontSize: 17,
                                                                letterSpacing: 0,
                                                                fontWeight: FontWeight.w600,
                                                              ),

                                                            ),
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Text('Music Event', textAlign: TextAlign.left, style: TextStyle(
                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                              fontFamily: 'Red Hat Text',
                                                              fontSize: 12.222221851348877,
                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                              fontWeight: FontWeight.normal,
                                                              height: 1
                                                          ),)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  SvgPicture.asset(
                                                    "Assets/images/Exclude.svg",
                                                    width: w/8,
                                                    color : Color(state.SavedBubbleList![index].Color!),
                                                  ),

                                                ],
                                              )
                                            ],
                                          )

                                      ),
                                    );

                                }
                            )
                        ),
                      )
                  )
                      : Container(
                    width: w/1.1,
                    height: h/1.141,
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            SizedBox(height: h/20,),
                            Container(
                    width: w,
                    height: h/1.8,
                    child: Image.asset("Assets/images/Be_There 2 v2.png",fit: BoxFit.fill,),
                  ),
                            Text('You haven’t saved any Bubbles', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 1),
                                fontFamily: 'Red Hat Display',
                                fontSize: 20.105409622192383,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w400,
                                height: 1
                            ),),
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                  width: w/1.2,
                                  height: h/13,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(20.5),
                                      topRight: Radius.circular(20.5),
                                      bottomLeft: Radius.circular(20.5),
                                      bottomRight: Radius.circular(20.5),
                                    ),
                                    boxShadow : [BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                        offset: Offset(0,0),
                                        blurRadius: 10
                                    )],
                                    color : Color.fromRGBO(207, 109, 56, 1),
                                  ),
                                child: Center(
                                  child:
                                  Text('Browse Bubbles', textAlign: TextAlign.center, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 20,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w400,
                                      height: 1
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                
                      : state.isLoading == true
                      ? Container(
                      width: w,
                      height: h / 1.5,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        children: [
                          Center(
                              child: listLoader(
                                  context:
                                  context)),
                        ],
                      ))
                      : Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: w,
                          height: h / 10,
                          child:
                          const Text("Error"),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
               state.UnSaveIsloading == true
              ? Container(
              width: w,
              height: h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .center,
                  children: [
                  Center(
                  child: listLoader(
                  context:
                  context)),
            ],
            ),
                ],
              )) :Text("")
          ],
            )
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
class BubbleData{
  String? image;
  String? TYPE;
  String? Title;
  String? location;
  String? StartDate;
  String? endDate;
  String? type;
  int? Color;
  int? id;
  String? Creator_Alias;
  String? Creator_Color;
  String? Creator_Avatar;
  String? User_type;

}