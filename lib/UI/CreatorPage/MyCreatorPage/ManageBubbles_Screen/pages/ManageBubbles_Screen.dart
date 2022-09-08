import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditBubble_Screen/pages/EditBubble_Screen.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_Bloc.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/bloc/ManageBubble_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageBubbles_Screen extends StatefulWidget {
  const ManageBubbles_Screen({Key? key}) : super(key: key);
  @override
  State<ManageBubbles_Screen> createState() => _ManageBubbles_ScreenState();
}

class _ManageBubbles_ScreenState extends State<ManageBubbles_Screen>{
  final _ManageBubbleBloc = sl<ManageBubble_Bloc>();
  List<String> Category_List =["Active","Upcoming","Drafts","Archive"];

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return
      BlocBuilder(
          bloc: _ManageBubbleBloc,
          builder: (BuildContext Context, ManageBubbleState state){
            return
              Scaffold(
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
                                      Text("Manage Bubbles", textAlign: TextAlign.center,
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
                      SizedBox(height: h/30,),
                      Container(
                        height: h/1.27,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  width: w,
                                  height: h/19,
                                  margin: EdgeInsets.only(left: w/20),
                                  child:ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics:  AlwaysScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: Category_List.length,
                                          separatorBuilder: (BuildContext context, int index) {
                                            return const SizedBox(width: 10,);
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return
                                              InkWell(
                                                onTap: (){
                                                  _ManageBubbleBloc.add(Change_Chosen_Category((b) =>
                                                  b..Index = index
                                                  ));

                                                  if (index==0){
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback((_) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditBubble_Screen(),
                                                      ),
                                                    ));
                                                    //todo: call all requests first
                                                    //todo : store each request data in a specific list for each one
                                                    //todo : give all data in a shared List<Bubbledata> then
                                                    //todo : when other category clciked : Clear the Shared list then fill it with new Data which is called.
                                                  }else if (index==1){

                                                  }else if (index==2){

                                                  }else if (index==3){

                                                  }
                                                },
                                                child: Container(
                                                    width: w/5,
                                                    height: h/30,
                                                    decoration: BoxDecoration(
                                                      color:state.Category_Chosen![index] ? Color.fromRGBO(130, 125, 226, 1):Colors.transparent,
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(5.r),
                                                        topRight:  Radius.circular(5.r),
                                                        bottomLeft: Radius.circular(5.r),
                                                        bottomRight: Radius.circular(5.r),
                                                      ),
                                                      border : Border.all(
                                                        color: Color.fromRGBO(130, 125, 226, 1),
                                                        width: 2,
                                                      ),
                                                    ),
                                                  child: Center(
                                                    child:
                                                    Text(Category_List[index], textAlign: TextAlign.center, style: TextStyle(
                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Red Hat Text',
                                                        fontSize: 11.5.sp,
                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1.7
                                                    ),),
                                                  ),
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
                    ],
                  ),
                ),

              );
          }
      );
  }
}
