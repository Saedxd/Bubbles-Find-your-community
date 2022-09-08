import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_Bloc.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/bloc/PageAdmins_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageAdmins_Screen extends StatefulWidget {
  const PageAdmins_Screen({Key? key}) : super(key: key);

  @override
  State<PageAdmins_Screen> createState() => _PageAdmins_ScreenState();
}

class _PageAdmins_ScreenState extends State<PageAdmins_Screen> {
  final TextEditingController _SearchController = TextEditingController();
  final _PageAdminsBloc = sl<PageAdminsBloc>();
  List<String> BackGroundColorTOAvatars = [];
  final _formkey1 = GlobalKey<FormState>();
  List<String> AvatarsSelected = [];
  late FocusNode FocuseNODE;
  List<int> AdminsId = [];
  List<int> Array2 = [];
  bool DiditONCE = false;

  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
    FocuseNODE.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _PageAdminsBloc,
        builder: (BuildContext Context, PageAdminsState state)
        {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: w / 10.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: w / 50),
                                        child: IconButton(
                                          icon: SvgPicture.asset(
                                              "Assets/images/Frame 11.svg",
                                              width: 30.w,
                                              color: ColorS.surface),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )),


                                  ],
                                ),
                              ),
                              Container(
                                width: w/2,
                                child: Center(
                                  child:
                                  Text('Admins Deck', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 22.sp,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800,
                                        height: 1
                                    ),)
                                  ,
                                ),
                              ),
                              Text("")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: h/1.27,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            width: w/1.4,
                            child: Text('Page Admins:', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                fontFamily: 'Red Hat Display',
                                fontSize: 24.sp,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w400,
                                height: 1
                            ),),
                          ),
                          SizedBox(height: h/20,),
                          Container(
                              width: w/1.35,
                              height: h/1.5,
                              child:ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 4+1,
                                      separatorBuilder: (BuildContext context, int index) {
                                        return const SizedBox(height: 10,);
                                      },
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return
                                          index==4
                                              ?
                                          Row(
                                              children: [

                                                Container(
                                                  child: CircleAvatar(
                                                    radius:22.w,
                                                    backgroundColor:
                                                    const Color(0xffCF6D38),
                                                    child: IconButton(
                                                        icon: SvgPicture.asset(
                                                          "Assets/images/Vector(4).svg",
                                                          width: h / 38,
                                                        ),
                                                        onPressed: () {
                                                          _PageAdminsBloc.add(GetFreinds());
                                                          FreindDilog();
                                                          //  DiditONCE = true;
                                                        }),
                                                  ),
                                                )])
                                              :

                                          Container(
                                            child: Row(
                                              children: [
                                                CircleAvatar(radius: 22.w,),
                                                SizedBox(width: w/20,),
                                                Text('My_Friend_Pedro', textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                    fontFamily: 'Red Hat Display',
                                                    fontSize: 18.352381706237793.sp,
                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1
                                                ),),
                                                SizedBox(width: w/10,),
                                                Image.asset("Assets/images/Delete.png")
                                              ],
                                            ),
                                          );
                                      }
                                  )
                              )
                          ),


                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child:
                            Container(
                              width: w/3,
                              height: h/15,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(7.r),
                                  topRight:  Radius.circular(7.r),
                                  bottomLeft: Radius.circular(7.r),
                                  bottomRight:  Radius.circular(7.r),
                                ),
                                color : Color.fromRGBO(168, 48, 99, 1),
                              ),
                              child: Center(
                                child:
                                Text('Save', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 20.sp,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                              ),
                            ),
                          ),
                        ],
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

  Future<void> FreindDilog() {
    TextTheme _textthem = Theme
        .of(context)
        .textTheme;
    ColorScheme COLOR = Theme
        .of(context)
        .colorScheme;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        shape:  RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0.r),
          ),
        ),
        builder: (BuildContext context) {

          return  StatefulBuilder(
              builder:(BuildContext context,
                  void Function(void Function()) SetState){
                return BlocBuilder(
                    bloc: _PageAdminsBloc,
                    builder: (BuildContext Context, PageAdminsState state) {


                      return
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery
                                    .of(context)
                                    .viewInsets
                                    .bottom),
                            child :
                            FractionallySizedBox(
                                heightFactor: h / 1100,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: h / 20),
                                          decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.r),
                                              bottomRight: Radius.circular(15.r),
                                              topLeft: Radius.circular(15.r),
                                              topRight:Radius.circular(15.r),
                                            ),
                                          ),
                                          width: w / 1.1,
                                          height: h / 15,
                                          child: Form(
                                            key: _formkey1,
                                            child: TextFormField(
                                              textInputAction: TextInputAction.search,
                                              controller: _SearchController,
                                              focusNode: FocuseNODE,
                                              cursorColor: Colors.grey,
                                              cursorHeight: 20,
                                              onChanged: (Keyword){
                                                _PageAdminsBloc.add(SearchFreinds((b) => b
                                                  ..Keyword = Keyword
                                                ));
                                              },
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(30.0.r),
                                                    borderSide:  BorderSide(
                                                        color: Color(0xff939393),
                                                        width: 10.w),
                                                  ),
                                                  focusedBorder:  OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(30.0.r)),
                                                    borderSide: BorderSide(
                                                        color: Color(0xff939393), width: 2),
                                                  ),
                                                  enabledBorder:  OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(30.0.r)),
                                                    borderSide: BorderSide(
                                                        color: Color(0xff939393), width: 2),
                                                  ),
                                                  prefixIcon: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'Assets/images/Vector(1).svg',
                                                        width: w / 20,
                                                      ),
                                                      onPressed: null //do something,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.transparent,
                                                  contentPadding:
                                                   EdgeInsets.symmetric(
                                                      horizontal: 12.w, vertical: 20.h),
                                                  hintText: "Search User",
                                                  hintStyle: _textthem.headline6!
                                                      .copyWith(fontSize: 15.sp)),
                                              keyboardType: TextInputType.text,
                                            ),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: h / 30, right: h / 5, bottom: h / 30),
                                        child: Text(
                                          'Friend list',
                                          textAlign: TextAlign.left,
                                          style: _textthem.headlineLarge!.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22.sp,
                                              letterSpacing: .5),
                                        ),
                                      ),
                                      state.success!
                                          ? state.FilteredFriendlist!.length != 0
                                          ? Expanded(
                                        child: Container(
                                          height: h / 1.49,
                                          margin: EdgeInsets.only(
                                            right: h / 20,
                                          ),
                                          child: ScrollConfiguration(
                                            behavior: MyBehavior(),
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics:
                                              const BouncingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: state
                                                  .FilteredFriendlist!.length,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                  int index) {
                                                return const SizedBox(
                                                  height: 5,
                                                );
                                              },
                                              itemBuilder: (BuildContext context,
                                                  int index) {

                                                //state.FilteredFriendlist![index].backgroundColor!;

                                                return InkWell(
                                                  onTap: () {
                                                    if (state.Chosen_Frineds![index]==1){
                                                      _PageAdminsBloc.add(Change_Chosen_frineds((b) => b
                                                        ..Status=0
                                                          ..Index = index
                                                      ));


                                                      AdminsId.remove(state.FilteredFriendlist![index].id);
                                                      AvatarsSelected.remove(state.FilteredFriendlist![index].Avatar.toString());
                                                      BackGroundColorTOAvatars.remove(state.FilteredFriendlist![index].backgroundColor.toString());
                                                    }else{
                                                      _PageAdminsBloc.add(Change_Chosen_frineds((b) => b
                                                        ..Status=1
                                                        ..Index = index
                                                      ));


                                                      AdminsId.add(state.FilteredFriendlist![index].id!);
                                                      AvatarsSelected.add(state.FilteredFriendlist![index].Avatar.toString());
                                                      BackGroundColorTOAvatars.add(state.FilteredFriendlist![index].backgroundColor.toString());
                                                    }


                                                  },
                                                  child:  Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: h / 30),
                                                        width: w / 1.01,
                                                        height: h / 10,
                                                        decoration:

                                                        BoxDecoration(
                                                          color: !state.ChooseFrined_isLoading!?
                                                          state.Chosen_Frineds![index]==1
                                                              ?Colors.greenAccent:
                                                          COLOR.secondaryContainer
                                                          :Colors.transparent,

                                                          borderRadius:
                                                           BorderRadius
                                                              .only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                40.r),
                                                            bottomRight:
                                                            Radius.circular(
                                                                5.r),
                                                            topLeft:
                                                            Radius.circular(
                                                                40.r),
                                                            topRight:
                                                            Radius.circular(
                                                                5.r),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: COLOR
                                                                    .primaryContainer,
                                                                offset:
                                                                const Offset(
                                                                    0, 0),
                                                                blurRadius: 1)
                                                          ],
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    Text("  "),
                                                                    CircleAvatar(
                                                                      backgroundColor: Color(state.FilteredFriendlist![index].backgroundColor!),
                                                                      radius:
                                                                      28.w,
                                                                      backgroundImage: NetworkImage(
                                                                          state
                                                                              .FilteredFriendlist!
                                                                          [
                                                                          index]
                                                                              .Avatar
                                                                              .toString()),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                const Text(""),
                                                                Row(
                                                                  children: [
                                                                    const Text(
                                                                        "    "),
                                                                    Text(
                                                                        state
                                                                            .FilteredFriendlist!
                                                                        [index].alias
                                                                            .toString(),
                                                                        textAlign: TextAlign.left,
                                                                        style: _textthem.headline3!.copyWith(
                                                                            fontWeight: FontWeight.w400
                                                                            ,fontSize: 20.sp
                                                                        )
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Text(""),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                          : Text(
                                          "You have no Freinds with that name ")
                                          : state.isLoading!
                                          ? Expanded(
                                          flex: 1,
                                          child: Container(
                                              width: w,
                                              height: h / 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: listLoader(
                                                          context: context)),
                                                ],
                                              )))
                                          : Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: w,
                                              height: h / 10,
                                              child: const Text("Error"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))  );
                    });

              });





        }).whenComplete(() {
      setState(() {
      });
      // //   _CreateBubbleBloc.add(SearchFreinds((b) => b..Keyword=""));
      // _PageAdminsBloc.add(ChangeDone3((b) => b..ChangeDone33 = true));
    }

    );
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }

}
