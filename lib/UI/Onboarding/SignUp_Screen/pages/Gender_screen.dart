import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/Interset_screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/Sliderr.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'Birthday_screen.dart';
import 'WhichGender_Screen.dart';

class Gender_Screen extends StatefulWidget {
  UsersData? Users;
  Gender_Screen({this.Users});



  @override
  State<Gender_Screen> createState() => _Gender_ScreenState();
}



class _Gender_ScreenState extends State<Gender_Screen> {
  final _SignUpBloc = sl<SignUpBloc>();
  bool Selected = false;
  int? dot;
  List? array2;
  String StringSelected ="";
 // int? GenderID= 1000;
  int? SelectedGenderId= 1000;
  @override
  void initState() {
    super.initState();
   _SignUpBloc.add(GetGender());
    dot = 0;
    array2 = List.filled(
        10,
        1);
        //state.GetGender!.genders!.length

  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc: _SignUpBloc,
        builder: (BuildContext context, SignUpState state) {
          // if (state.success == true &&
          //     _formkey1.currentState!.validate() &&
          //     DiDitOnce == true) {
          //   if (state.data!.msg == "success") {
          //
          //     pref.saveUser(
          //       state.data as UserData,
          //       state.data!.user!.token!,
          //       true,
          //     );
          //
          //     WidgetsBinding.instance!.addPostFrameCallback(
          //             (_) { Navigator.of(context).push(
          //           CupertinoPageRoute(
          //             builder: (BuildContext context) {
          //               return NavigatorTopBar();
          //             },
          //           ),
          //         );
          //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //         }
          //     );
          //     DiDitOnce = false;
          //
          //   }
          //   else if (state.data!.msg == "Email or password incorrect") {
          //
          //
          //     Future.delayed(Duration.zero, () {
          //       Page2().method(_scaffoldKey.currentContext!, "Error",
          //           state.data!.msg!, "Back");
          //     });
          //     DiDitOnce = false;
          //   }
          // }
          return Scaffold(
            backgroundColor: AppColor,
            body: SafeArea(
              child: Stack(children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: w/1.2,
                      margin: EdgeInsets.only(top: h/40),
                      child: InkWell(
                        onTap: (){
                          WidgetsBinding.instance.addPostFrameCallback((_) =>
                              Navigator.of(context).pop()
                          );
                        },
                        child: Text('< Back',
                            textAlign: TextAlign.left,style: _TextTheme.headline1!.copyWith(
                                fontSize: 20.sp,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.w300,
                                height: 1
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: h/30),
                      child: Text(
                        'How do you identify?',
                        textAlign: TextAlign.left,
                          style:_TextTheme.headlineLarge!.copyWith(
                              letterSpacing: 1,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          )
                      ),
                    ),

                    Center(
                      child: Stack(
                        children: [
                          (state.success == true)
                          ? Container(
                          width: w / 1.32,
                          height: h/2.23,
                            margin: EdgeInsets.only(),
                          child:  ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: Container(
                                  child: GridView.builder(
                                      cacheExtent : 500,
                                      shrinkWrap: true,
                                       physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: (6 / 6.1),
                                      ),
                                      itemCount:
                                      state.GetGender!.genders!.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        //print(state.GetGender!.genders![index].image!.image.toString());
                                        return InkWell(
                                          onTap: () {
                                            array2 = List.filled(
                                                state.GetGender!.genders!.length,
                                                0);
                                            Selected = true;
                                            array2![dot!] = 0;
                                            dot = index;
                                            array2![index] = 1;
                                            print(array2);
                                            setState(() {});
                                            StringSelected = state.GetGender!.genders![index].title!;
                                            SelectedGenderId =state.GetGender!.genders![index].id;
                                            print(SelectedGenderId);

                                            if (state.GetGender!.genders![index].title=="Others"){
                                              WidgetsBinding.instance.addPostFrameCallback(
                                                      (_) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => WhichGender(
                                                            Users : widget.Users
                                                        ), )));

                                            }
                                          },
                                          child: Container(
                                            width: w / 2.7,
                                            height: h / 5,
                                            margin: EdgeInsets.all(6.r),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5.r),
                                                topRight: Radius.circular(5.r),
                                                bottomLeft: Radius.circular(5.r),
                                                bottomRight: Radius.circular(5.r),
                                              ),
                                              color: array2![index] == 1
                                                  ? Colors.white
                                                  : UnSelectedCard,
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(""),
                                                Container(
                                                  width: w/5,
                                                  height: h/10,
                                                  child: SvgPicture.network(
                                                    "${state.GetGender!.genders![index].image!.toString()}",
                                                    width: h/14,
                                                    color:array2![index]!=1?Color(0xff606060):null,
                                                    placeholderBuilder: (BuildContext Context){
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),),
                                                 Text(
                                                    state.GetGender!.genders![index].title!,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Red Hat Text',
                                                        fontSize: 20.sp,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.h),
                                                  ),

                                              
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                              )),)
                          : state.isLoading == true
                          ? Container(
                              width: w / 1.32,
                          height: h/2.01,
                          child: Center(child: listLoader(context: context)))
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: w / 1.32,
                              height: h/2.01,
                              child: const Text("Error Was Found"),
                            ),
                          ),
                        ],
                      ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: w / 1.36,
                              height: h / 13.9,
                              margin: EdgeInsets.only(bottom: h/7,top: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.15000000596046448),
                                      offset: Offset(0, 0),
                                      blurRadius: 6)
                                ],
                                color:
                                !Selected
                                    ? Color(0xff939393)
                                    : Color.fromRGBO(207, 109, 56, 1),
                              ),
                              child:  InkWell(
                                  onTap: () {
                                    print(SelectedGenderId);
                                    if (StringSelected=="Others"){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => slider(
                                              Users : widget.Users
                                          ),
                                        ),
                                      );

                                    }else
                                      if (SelectedGenderId!=1000
                                    ){
                                      print(SelectedGenderId);
                                      widget.Users!.SetGender(SelectedGenderId!);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => slider(
                                              Users : widget.Users
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Center(
                                child: Text(
                                  'Next',
                                  textAlign: TextAlign.center,
                                  style:
                                  _TextTheme.headline1!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    fontSize: 18.sp
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),


                  ],
                )

              ]),
            ),
          );
        });
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}
//             if ( FirstSelected[0]==1){
//                         Gender ="Women";
//                       }else if ( FirstSelected[1]==1){
//                         Gender ="Man";
//                       }else if ( FirstSelected[2]==1){
//                         Gender ="Non-Binary";
//                       }else if (   FirstSelected[3]==1){
//                         Gender ="Other";
//                       }
//
//
//
//
//                       if (FirstSelected.sum != 4) {
//                         (FirstSelected[3] == 1)
//                             ? WidgetsBinding.instance!.addPostFrameCallback(
//                                 (_) => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => WhichGender(
// //
//                                 ),
//                               ),
//                             ))
//                             : print("");
//
//                         FirstSelected[0] == 1 ||
//                             FirstSelected[1] == 1 ||
//                             FirstSelected[2] == 1
//                             ? WidgetsBinding.instance!.addPostFrameCallback(
//                                 (_) => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Intersets_screen(
//                                     BirthDay: widget.BirthDay,
//                                     Email: widget.Email,
//                                     Pass: widget.Pass,
//                                     ConfirmPass: widget.ConfirmPass,
//                                     FirstName: widget.FirstName,
//                                     LastName: widget.LastName,
//                                     Gender: Gender!
//                                 ),
//                               ),
//                             ))
//                             : print("");
//                       } else {
//                         print("");
//                       }
//     Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             onTap: () {
//
//                               FirstSelected = List.filled(4, 0);
//                               FirstSelected[0] = 1;
//                               setState(() {});
//                             },
//                             child: Container(
//                               width: w / 2.7,
//                               height: h / 5,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(5),
//                                   topRight: Radius.circular(5),
//                                   bottomLeft: Radius.circular(5),
//                                   bottomRight: Radius.circular(5),
//                                 ),
//                                 color: FirstSelected[0] != 0
//                                     ? Color.fromRGBO(255, 255, 255, 1)
//                                     : UnSelectedCard,
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset("Assets/images/Frame2.svg",width: h/14, color: FirstSelected[0] == 0?Color(0xff606060):null,),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Woman',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(0, 0, 0, 1),
//                                         fontFamily: 'Sofia Pro',
//                                         fontSize: 20,
//                                         letterSpacing:
//                                         0 ,
//                                         fontWeight: FontWeight.normal,
//                                         height: 1),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               FirstSelected = List.filled(4, 0);
//                               FirstSelected[1] = 1;
//                               setState(() {});
//                             },
//                             child: Container(
//                               width: w / 2.7,
//                               height: h / 5,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(5),
//                                   topRight: Radius.circular(5),
//                                   bottomLeft: Radius.circular(5),
//                                   bottomRight: Radius.circular(5),
//                                 ),
//                                 color: FirstSelected[1] != 0
//                                     ? Color.fromRGBO(255, 255, 255, 1)
//                                     : UnSelectedCard,
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset("Assets/images/Frame.svg",width: h/11,  color: FirstSelected[1] == 0?Color(0xff606060):null),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Man',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(0, 0, 0, 1),
//                                         fontFamily: 'Sofia Pro',
//                                         fontSize: 20,
//                                         letterSpacing:
//                                         0.4 ,
//                                         fontWeight: FontWeight.normal,
//                                         height: 1),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               FirstSelected = List.filled(4, 0);
//                               FirstSelected[2] = 1;
//                               setState(() {});
//                             },
//                             child: Container(
//                               width: w / 2.7,
//                               height: h / 5,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(5),
//                                     topRight: Radius.circular(5),
//                                     bottomLeft: Radius.circular(5),
//                                     bottomRight: Radius.circular(5),
//                                   ),
//                                   color: (FirstSelected[2] != 0
//                                       ? Color.fromRGBO(255, 255, 255, 1)
//                                       : UnSelectedCard)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   //       SvgPicture.asset("Assets/images/Frame2.svg"),
//                                   SvgPicture.asset("Assets/images/Frame3.svg",width: h/17, color: FirstSelected[2] == 0?Color(0xff606060):null),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Non-Binary',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(0, 0, 0, 1),
//                                         fontFamily: 'Sofia Pro',
//                                         fontSize: 20,
//                                         letterSpacing:
//                                         0.3 ,
//                                         fontWeight: FontWeight.normal,
//                                         height: 1),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               FirstSelected = List.filled(4, 0);
//                               FirstSelected[3] = 1;
//                               setState(() {});
//                             },
//                             child: Container(
//                               width: w / 2.7,
//                               height: h / 5,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(5),
//                                   topRight: Radius.circular(5),
//                                   bottomLeft: Radius.circular(5),
//                                   bottomRight: Radius.circular(5),
//                                 ),
//                                 color: FirstSelected[3] != 0
//                                     ? Color.fromRGBO(255, 255, 255, 1)
//                                     : UnSelectedCard,
//                                 //
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   //       SvgPicture.asset("Assets/images/Frame2.svg"),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(""),
//                                   SvgPicture.asset("Assets/images/Frame4.svg",width: h/14, color: FirstSelected[3] == 0?Color(0xff606060):null),
//
//                                   Column(
//                                     children: [
//                                       Text(""),
//                                       Text(""),
//                                       Text(
//                                         'Other',
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                             color: Color.fromRGBO(0, 0, 0, 1),
//                                             fontFamily: 'Sofia Pro',
//                                             fontSize: 20,
//                                             letterSpacing:
//                                             0 ,
//                                             fontWeight: FontWeight.normal,
//                                             height: 1),
//                                       ),
//                                       Text(""),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
