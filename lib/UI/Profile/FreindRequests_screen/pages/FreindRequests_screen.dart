import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/FreindRequests_screen/bloc/FriendRequest_Bloc.dart';
import 'package:bubbles/UI/Profile/FreindRequests_screen/bloc/FriendRequest_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/FriendRequest_event.dart';

class FreindRequests extends StatefulWidget {
  const FreindRequests({Key? key}) : super(key: key);

  @override
  State<FreindRequests> createState() => _FreindRequestsState();
}

class _FreindRequestsState extends State<FreindRequests> {
  final _FriendRequest_Bloc = sl<FriendRequestBloc>();

  @override
  void initState() {
    super.initState();
    _FriendRequest_Bloc.add(FreindsRequests());
  }
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(

        bloc: _FriendRequest_Bloc,
        builder: (BuildContext Context, FreindRequestState state) {

          return  WillPopScope(
            onWillPop: () async =>true,
            child:

            SafeArea(
              child: Scaffold(
                body : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: h/100),
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
                            Text('Friend Requests', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
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
                     state.success!
                          ? Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: h/20,),
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                scrollDirection: Axis.vertical,
                                itemCount: state.FreindRequests!.users!.length,
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 5,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {

                                  var BackgroundColor;
                                  try {
                                    String Value = state.FreindRequests!.users![index].background_color.toString();
                                    var myInt = int.parse(Value);
                                    BackgroundColor = myInt;
                                  }catch(e){
                                    print(e);
                                  }


                                  return   Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: h/30),

                                          width: w / 1.01,
                                          height: h / 10,
                                          decoration: BoxDecoration(
                                            color: ColorS.secondaryContainer,
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(40),
                                              bottomRight: Radius.circular(5),
                                              topLeft: Radius.circular(40),
                                              topRight: Radius.circular(5),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorS.primaryVariant ,
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 5)
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: h/70),
                                                  width: w/6,
                                                  height: h/11.7,


                                                  child:    CachedNetworkImage(
                                                    imageUrl:
                                                    state.FreindRequests!.users![index].avatar!!=null
                                                        ?   state.FreindRequests!.users![index].avatar.toString():  "Assets/images/DefaultAvatar.png",

                                                    errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                    imageBuilder: (context, imageProvider) => CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage: imageProvider,
                                                      backgroundColor:   Color(BackgroundColor),
                                                    ),
                                                  ),
                                              ),


                                              Flexible(
                                                child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        Flexible(
                                                          child: Container(
                                                            margin: EdgeInsets.only(left: h/70),
                                                            child: Text(

                                                              state.FreindRequests!.users![index].alias.toString(),
                                                              textAlign: TextAlign.left,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                  color:
                                                                  ColorS.onSurface,
                                                                  fontFamily: 'Futura',
                                                                  fontSize:24,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.w400,
                                                                  height: 1
                                                              ),

                                                            ),
                                                          ),
                                                        ),
                                                        
                                                        Expanded(
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: (){
                                                                  _FriendRequest_Bloc.add(DenyRequest((b) => b
                                                                  ..friend_id = state.FreindRequests!.users![index].id
                                                                  ));
                                                                  _FriendRequest_Bloc.add(FreindsRequests());
                                                                },
                                                                child: const Text(
                                                                  "Deniy",
                                                                  textAlign: TextAlign.left,
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red,

                                                                      fontFamily: 'Futura',
                                                                      fontSize:18,
                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1
                                                                  ),

                                                                ),
                                                              ),
                                                              const SizedBox(width: 10,),
                                                              InkWell(
                                                                onTap: (){
                                                                  _FriendRequest_Bloc.add(AceeptRequest((b) => b
                                                                    ..friend_id = state.FreindRequests!.users![index].id));
                                                                  _FriendRequest_Bloc.add(FreindsRequests());
                                                                },
                                                                child: const Text(
                                                                  "Accept",
                                                                  textAlign: TextAlign.left,
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.green,
                                                                      fontFamily: 'Futura',
                                                                      fontSize:18,
                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
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
                        ],
                      )
                         : state.isLoading == true
                          ?Container(
                          width: w / 1.1,
                          height: h/1.3,
                          child: Center(child: listLoader(context: context)))
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });



  }
  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }
}
