// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


/////////////////////////////////////////////////////////////////////////////////////////////////////////////


const AppColor = Color(0xff942657);
const ChooseAvatarBack = Color(0xff303030);
const sliderBack = Color(0xFFEAEAEA);
const PermissionScreen = Color(0xFFCF6D38);
const UnSelectedCard = Color(0xFFC4C4C4);
const TimelineDotCOlor = Color(0xFFDDDDDD);
const CardColors = Color(0xff606060);








class Page2 extends StatefulWidget {
 method(
     BuildContext Context,
     String Title,
     String body,
     String BottonTxt) => createState().alreatDialogBuilder(
                                                         Context,
                                                          Title,
                                                          body,
                                                          BottonTxt
                                                     );
 method2(
     BuildContext Context,
     String Title,
     String body,
     String BottonTxt,
     double Width,
     double height,
     Function onpressed

     ) => createState().alreatDialogBuilder2(
     Context,
     Title,
     body,
     BottonTxt,
     Width,
     height,
     onpressed
 );

 @override
 _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  alreatDialogBuilder(

      BuildContext Context,
      String Title,
      String body,
      String BottonTxt,

      ) async {
    TextTheme _textthem = Theme.of(Context).textTheme;


    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
            title: Text(Title),
            content: Container(
              child: Text(body,    style: _textthem.headlineLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17
              ),),
            ),
            actions: [
              RaisedButton(
                child: Text(BottonTxt),
                onPressed: () {

                  Navigator.pop(Context);

                },
              ),

            ],
          );
        });
  }

  alreatDialogBuilder2(
      BuildContext Context,
      String Title,
      String body,
      String BottonTxt,
      double height,
      double Width,
      Function onpressed
      ) async {


    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
            backgroundColor: const Color(0xff303030),
            content: Container(
              width: Width/2,
              height: height/6.5,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(8.285714149475098),
                      topRight: Radius.circular(8.285714149475098),
                      bottomLeft: Radius.circular(8.285714149475098),
                      bottomRight: Radius.circular(8.285714149475098),
                    ),
                    color : Color.fromRGBO(47, 47, 47, 1),
                  ),
              child: Row(
                children: [
                  Container(

                    width: Width/2.3,
                  height: height/4,
                  //  color: Colors.blue,
                    child: Text(body,
                      maxLines: 10,
                      style:const TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w400) ,),
                  ),
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: (){
                  Navigator.pop(Context);
                onpressed();
                },
                child: Center(
                  child: Container(
                    width: Width/2,
                    height: height/20,
                      margin: EdgeInsets.only(right: height/40),
                      decoration: const BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(4.142857074737549),
                          topRight: Radius.circular(4.142857074737549),
                          bottomLeft: Radius.circular(4.142857074737549),
                          bottomRight:  Radius.circular(4.142857074737549),
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
                      Text(BottonTxt, textAlign: TextAlign.center, style: const TextStyle(
                          color: Color.fromRGBO(234, 234, 234, 1),
                          fontFamily: 'Sofia Pro',
                          fontSize: 16.571428298950195,
                          letterSpacing: 0.4 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                    ),
                  ),
                ),
              )

            ],
          );
        });
  }

 @override
 Widget build(BuildContext context) {
   var h = MediaQuery.of(context).size.height;
   var w = MediaQuery.of(context).size.width;

  return Container();
 }
}

// raise the [showDialog] widget
