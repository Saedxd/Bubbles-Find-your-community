import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/Challenges_Screen/bloc/Challenges_Bloc.dart';
import 'package:bubbles/UI/Profile/Challenges_Screen/bloc/Challenges_Event.dart';
import 'package:bubbles/UI/Profile/Challenges_Screen/bloc/Challenges_State.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Challenges extends StatefulWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  final _ChallengesBloc = sl<ChallengesBloc>();
  bool Diditonce = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _ChallengesBloc.add(GetChallenges());
  }
  CommingSoonPopup(
      BuildContext Context,
      double h,
      double w,
      String Value,
      String buttonValue,
      int FontSize
      ) async {
    return showDialog(
        context: Context,
           barrierDismissible: true,
        builder: (Context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(h/100),
              content:Container(
                width: w/1.4,
                height: h/3,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(8.285714149475098.r),
                    topRight: Radius.circular(8.285714149475098.r),
                    bottomLeft: Radius.circular(8.285714149475098.r),
                    bottomRight: Radius.circular(8.285714149475098.r),
                  ),
                  color: Colors.transparent,
                ),


                child: Stack(
                  children: [

                    Positioned(
                      top: h/12.5,
                      child: Container(
                        width: w/1.4,
                        height: h/4.2,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(8.285714149475098),
                            topRight: Radius.circular(8.285714149475098),
                            bottomLeft: Radius.circular(8.285714149475098),
                            bottomRight: Radius.circular(8.285714149475098),
                          ),
                          color : Color.fromRGBO(47, 47, 47, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),


                            Center(
                              child: Text(Value,
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: FontSize.toDouble(),
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: h/15.5,
                                      width: w/2,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(4.142857074737549.r),
                                          topRight: Radius.circular(4.142857074737549.r),
                                          bottomLeft: Radius.circular(4.142857074737549.r),
                                          bottomRight: Radius.circular(4.142857074737549.r),
                                        ),
                                        boxShadow : [BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(0,0),
                                            blurRadius: 6.628571510314941
                                        )],
                                        color : Color.fromRGBO(168, 48, 99, 1),
                                      ),
                                      child: Center(
                                        child:
                                        Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 14,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w400,
                                            height: 1
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: h/8,
                      bottom: h/5.5,
                      child: SvgPicture.asset(
                        "Assets/images/widget.svg",
                        width: 90,
                      ),
                    ),
                  ],
                ),
              )

          );
        });
  }

  Future<void> OnRefresh() async {
    _ChallengesBloc.add(GetChallenges());
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _ChallengesBloc,
        builder: (BuildContext context, ChallengesState state) {


          if (state.success!&& Diditonce){
            Navigator.pop(context);
            Diditonce = false;
          }

          alreatDialogBuilder(BuildContext Context, double h, double w,
              ChallengesState state, int index) async {
            int NUMBERSWanted = state.GetChallenges!.values![index];

            return showDialog(
                context: Context,
                   barrierDismissible: true,
                builder: (Context) {
                  return AlertDialog(
                    backgroundColor:  Color(0xffC4C4C4),
                    insetPadding: EdgeInsets.all(h / 50),

                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(state.GetChallenges!.challenges![index].image.toString()),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: h / 40, left: h / 30),
                              child: Text(
                                state.GetChallenges!.challenges![index].title
                                    .toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(47, 47, 47, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 3.6 *
                                        SizeConfig.blockSizeVertical!
                                            .toDouble(),
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    content:  Container(
                      width: w/1.4,
                      height: h / 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.285714149475098),
                            topRight: Radius.circular(8.285714149475098),
                            bottomLeft: Radius.circular(8.285714149475098),
                            bottomRight: Radius.circular(8.285714149475098),
                          ),
                          color: Color(0xffC4C4C4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Center(
                              child: Container(
                                width: w / 1.3,
                                margin:
                                EdgeInsets.only(bottom: h / 40),
                                child: Text(
                                  state.GetChallenges!.challenges![index].content.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(47, 47, 47, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 3 * SizeConfig.blockSizeVertical!,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w300,
                                      height: 1.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: h / 30),
                            child: Row(
                              children: [
                                Text(
                                  '$NUMBERSWanted/'
                                      '${state.GetChallenges!.challenges![index].max_number.toString()}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(96, 96, 96, 1),
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 3.5 *
                                          SizeConfig.blockSizeVertical!,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  "Assets/images/BeCoins(1).svg",
                                  width: w / 10,
                                  height: h / 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${state.GetChallenges!.challenges![index].point.toString()} pts',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(168, 48, 99, 1),
                                      fontFamily: 'Red Hat Display',
                                      fontSize:
                                      3 * SizeConfig.blockSizeVertical!,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                         if (     state.GetChallenges!
                             .challengesStatus![index] ==
                             1) {
                           Diditonce = true;
                              _ChallengesBloc.add(GetPoints((b) => b
                              ..ChallengeId = state.GetChallenges!
                                  .challenges![index].id!
                                  .toInt()));
                           _ChallengesBloc.add(GetChallenges());

                              }


                            },
                            child: Container(
                              width: w / 5,
                              height: h / 20,
                              margin: EdgeInsets.only(right: h / 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                color:  state.GetChallenges!
                                    .challengesStatus![index] ==
                                    1
                                    ? Color.fromRGBO(207, 109, 56, 1)
                                    : Color(0xff939393),
                              ),
                              child: Center(
                                child: Text(
                                  'Claim',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                      Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 16,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          }

          return Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
                child: Column(
              children: [
                const Text(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Spacer(),
                    Container(
                        margin: EdgeInsets.only(
                            left: h / 100, right: h / 50),
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "Assets/images/Frame 11.svg",
                              width: 30.w,
                              color: COLOR.surface),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    const Spacer(),
                    Text(
                      'You can earn more points  by completing challenges!',
                      textAlign: TextAlign.left,
                      style: _textthem.headlineLarge!
                          .copyWith(fontWeight: FontWeight.w300, fontSize: 23),
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(""),
                state.success!
                    ? RefreshIndicator(
                        onRefresh: OnRefresh,
                        backgroundColor: Colors.white,
                        color: Colors.blue,
                        child: Container(
                            width: w / 1.1,
                            height: h / 1.2,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.separated(
                                itemCount:
                                    state.GetChallenges!.challenges!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  int NUMBERSWanted = state.GetChallenges!.values![index];
                                  return
                                    Container(
                                      width: w / 1.1,
                                      height: h / 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.4000000059604645),
                                              offset: Offset(0, 0),
                                              blurRadius: 5)
                                        ],
                                        color: Color.fromRGBO(196, 196, 196, 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              leading:    Hero(
                                      tag: "Image${state.GetChallenges!.challenges![index].id}",

                                        child:        Material(
                                          type: MaterialType.transparency,
                                          child : InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                  builder: (context) => HeroImage(path:  state.GetChallenges!.challenges![index].image.toString(),color:  0xff939393,id: state.GetChallenges!
                                                      .challenges![index].id ,),),
                                              );
                                            },
                                            child: CircleAvatar(

                                                backgroundColor:
                                                    Color(0xff939393),
                                                backgroundImage: NetworkImage(state.GetChallenges!.challenges![index].image.toString()),
                                              ),
                                          )
                                        )
                                      ),
                                              title: Text(
                                                state.GetChallenges!
                                                    .challenges![index].title
                                                    .toString(),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        47, 47, 47, 1),
                                                    fontFamily:
                                                        'Red Hat Display',
                                                    fontSize: 20,
                                                    letterSpacing: 0.2,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    "Assets/images/BeCoins(1).svg",
                                                    width: w / 15,
                                                    height: h / 55,
                                                  ),
                                                  SizedBox(width: 3,),
                                                  Text(
                                                    '${state.GetChallenges!.challenges![index].point.toString()} points',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            96, 96, 96, 1),
                                                        fontFamily:
                                                            'Red Hat Display',
                                                        fontSize: 15,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w600,
                                                        height: 1),
                                                  ),
                                                  SizedBox(width: 4,),
                                                  index==2 || index==0
                                                       ?Text("")
                                                      : Text(
                                                    '$NUMBERSWanted/'
                                                        '${state.GetChallenges!.challenges![index].max_number.toString()}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(96, 96, 96, 1),
                                                        fontFamily: 'Red Hat Display',
                                                        fontSize: 2.5 *
                                                            SizeConfig.blockSizeVertical!,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w600,
                                                        height: 1),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: w / 5,
                                            height: h / 20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                topRight: Radius.circular(50),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50),
                                              ),
                                              color:state.GetChallenges!
                                                  .challengesStatus![index] ==
                                                  1
                                                  ? Color.fromRGBO(207, 109, 56, 1)
                                                  : Color(0xff939393),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                print(index);
                                                ( index==2 && state.GetChallenges!.challengesStatus![2]==0)?
                                                state.GetChallenges!.challengesStatus![2]==0?
                                                CommingSoonPopup(context, h, w,"It hasn't been 24 hours Yet", "Ok", 17)
                                                    :
                                                    print("go on")
                                                    :print("nope");



                                                !( index==2 &&  state.GetChallenges!.challengesStatus![2]==0)?
                                                state.GetChallenges!.challengesStatus![index]!=3
                                                    ? alreatDialogBuilder(context,h,w,state,index)
                                                    :  CommingSoonPopup(context, h, w,"You have already done this challenge you can come back later when its available🌹", "Ok", 15)



                                                    :print("nope");
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Claim',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          234, 234, 234, 1),
                                                      fontFamily:
                                                          'Red Hat Text',
                                                      fontSize: 16,
                                                      letterSpacing: 0.2,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ));
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: h / 50,
                                  );
                                },
                              ),
                            )))
                    : state.isLoading!
                        ? Container(
                            width: w,
                            height: h/1.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: listLoader(context: context)),
                              ],
                            ))
                        : Container(
                            width: w,
                            height: h / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: w,
                                    height: h / 10,
                                    child: const Text(""),
                                  ),
                                ),
                              ],
                            ),
                          ),


              ],
            )),
          );
        });
  }

  Widget listLoader({context}) {
    return SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}
class HeroImage extends StatefulWidget {
  HeroImage({Key? key, this.path,this.color,this.id}) : super(key: key);
  int? color;
  String? path;
  int? id;


  @override
  State<HeroImage> createState() => _HeroImageState();
}



class _HeroImageState extends State<HeroImage> {
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          width: w,
          height: h,
          color: Colors.transparent,
          child: Hero(
            tag: "Image${widget.id}",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: widget.path!,
                      errorWidget: (context, url, error) => Center(child: Text("Error")),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: w/2,
                        backgroundImage: imageProvider,
                        backgroundColor:   Color(widget.color!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
