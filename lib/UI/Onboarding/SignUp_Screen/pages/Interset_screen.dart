import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/ChooseAvatar_screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/Sliderr.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Intersets_screen extends StatefulWidget {
  UsersData? Users;
  Intersets_screen({this.Users});

  @override
  State<Intersets_screen> createState() => _Intersets_screenState();
}

class _Intersets_screenState extends State<Intersets_screen> {
  List<int> IntersetID=[];
  List<int>? array2;
 final bloc2 = sl<SignUpBloc>();
   late int sum;
 @override
  void initState() {
    super.initState();
    array2 = List.filled(
        50,
        0);


bloc2.add(GetInterests());
  }
  // List<int> Array=[0];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return  BlocBuilder(
        bloc: bloc2,
        builder: (BuildContext context, SignUpState state) {
           return Scaffold(
             resizeToAvoidBottomInset: false,

        backgroundColor: Color(0xff303030),
        body: SafeArea(
          child: Column(
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
                  margin: EdgeInsets.only(top: h/17,bottom: h/35),
                  child: Text('What are your interests?', textAlign: TextAlign.left,
                    style:_TextTheme.headlineLarge!.copyWith(
                      letterSpacing: 0.5,
                        fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )),
                ),

                Container(
                  width: w,
                  child: Center(
                    child: Stack(
                      children: [
                        (state.success == true)
                            ? Container(
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular( 5.r),
                            topRight:Radius.circular( 5.r),
                            bottomLeft: Radius.circular( 5.r),
                            bottomRight:Radius.circular( 5.r),
                          ),
                          color : Color(0xff606060)
                        ),
                        width: w/1.32,
                        height: h/2,
                        child:  Center(
                          child: Container(
                              child:  GridView.builder(
                                  cacheExtent : 500,
                                  shrinkWrap: true,
                                  itemCount: state.GetInterests!.interests!.length,
                                  gridDelegate:

                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: (5 / 5.5),
                                  ),
                                  itemBuilder: (context, index) {

                                    return
                                      InkWell(
                                        onTap: (){
                                          sum = array2!.sum;
                                          if (array2![index]==1){
                                            array2![index]=0;
                                            IntersetID.remove(state.GetInterests!.interests![index].id!);
                                          }else{
                                            if (sum<5) {
                                              array2![index] = 1;
                                              IntersetID.add(state.GetInterests!.interests![index].id!);
                                            }
                                          }
                                          sum = array2!.sum;
                                          print(IntersetID);
                                          setState(() { });
                                          bloc2.add(ChangeSelected((b) => b..status=  true));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(7),
                                          width: w/8,
                                          height: h/15,
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular( 5.r),
                                              topRight:Radius.circular( 5.r),
                                              bottomLeft: Radius.circular( 5.r),
                                              bottomRight:Radius.circular( 5.r),
                                            ),
                                            color : Colors.white
                                          ),
                                          child:

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                             Column(

                                                children: [
                                                  1 < (state.GetInterests!.interests![index].title!.split(" ").length)
                                                      ?  SizedBox(height: h/150,)
                                                  :SizedBox(height: h/60,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [

                                                       Container(
                                                         width: w/10,
                                                          child :
                                                          AspectRatio(
                                                            aspectRatio: 2/1.9,
                                                            child:  Image.network("${state.GetInterests!.interests![index].image!}",
                                                              fit: BoxFit.fill,
                                                              color: array2![index]==1? Color(0xffBA474D): null,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  1 < (state.GetInterests!.interests![index].title!.split(" ").length)
                                                  ?
                                                  SizedBox(height: 10.h,): SizedBox(height: 17.h,),
                                                ],
                                              ),
                                              1 < (state.GetInterests!.interests![index].title!.split(" ").length)
                                              ?  Expanded(
                                                child: FittedBox(
                                                  child: Container(
                                                  height: h/20,
                                                    width: 1 < (state.GetInterests!.interests![index].title!.split(" ").length)? w/6:w/5,
                                                    child: Text(state.GetInterests!.interests![index].title.toString(),
                                                      textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(0, 0, 0, 1),
                                                            fontFamily: 'Sofia Pro',
                                                            fontSize: 13.sp,
                                                            letterSpacing: 0,
                                                            fontWeight: FontWeight.w500,
                                                            height: 0.8.h
                                                        ),),
                                                    ),
                                                    ),
                                              )
                                                  :  Container(
                                    width: 1 < (state.GetInterests!.interests![index].title!.split(" ").length)? w/6:w/4.5,
                                    child: Text(state.GetInterests!.interests![index].title.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Sofia Pro',
                                    fontSize: 12.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    height: 0.5.h
                                    ),),
                                    ) ,
                                            



                                            ],
                                          ),
                                        ),
                                      );
                                  }
                              )
                          ),
                        )
                    )
                            : state.isLoading == true
                            ? Container(
                            width: w/1.32,
                            height: h/1.6,
                            child: Center(child: listLoader(context: context)))
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                width: w/1.32,
                                height: h/2.01,
                                child: const Text("Error Was Found"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('Select Up to 5', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(234, 234, 234, 1),
                    fontFamily: 'Sofia Pro',
                    fontSize: 10.sp,
                    letterSpacing: 0 ,
                    fontWeight: FontWeight.w300,
                    height: 1.3636363636363635.h
                ),),

                Container(
                    margin: EdgeInsets.only(top: h/30),
                      width: w/1.32,
                      height: h/13.9,
                      decoration:  BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular( 5.r),
                          topRight:Radius.circular( 5.r),
                          bottomLeft: Radius.circular( 5.r),
                          bottomRight:Radius.circular( 5.r),
                        ),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                            offset: Offset(0,0),
                            blurRadius: 6.r
                        )],
                        color :state.ChangeSelectedd! && (sum!=0)  ?


                        Color.fromRGBO(207, 109, 56, 1)
                            : Color(0xff939393),
                      ),
                      child: InkWell(
                          onTap: (){
                            sum = array2!.sum;
                            if (sum!=0) {
                              widget.Users!.SetInterests(IntersetID);
                              // WidgetsBinding.instance!.addPostFrameCallback((_) =>
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(builder: (context) =>
                              //           slider(
                              //             Users:widget.Users ,
                              //
                              //           )),)
                            //  );
                              //ChooseAvatar


                              WidgetsBinding.instance.addPostFrameCallback((_) =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        ChooseAvatar(
                                          Users:widget.Users ,
                                        )),)
                               );

                            }
                          },
                          child:
                       Center(
                        child: Text('Next', textAlign: TextAlign.center,        style:
                        _TextTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),),
                      ))

                  ),

              ],
            ),
         
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
