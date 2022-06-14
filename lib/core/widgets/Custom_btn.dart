
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class custombtn extends StatelessWidget {
  final VoidCallback? onPressed;//Funtion
  final String? textt;
  final Color? btnColor;
  final Color? TxtColor;
  final Color? outlineColor;
  final bool? IsGoogle;
  final bool? WantImage;
  final bool? WantBig;
  bool? IsLoading = false;

  custombtn({
    required this.WantBig,
    required this.WantImage,
    required this.IsGoogle,
    required this.textt,
    required this.onPressed,
    required this.IsLoading,
    required this.btnColor,
    required this.outlineColor,
    required this.TxtColor
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return InkWell(
      onTap: onPressed!,
      child: Container(

          height: height/13,
          width: width/1.1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TxtColor,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(width: 1.0, color: const Color(0xffdddddd)),
          ),

          child: Stack(
            children: [
              Visibility(
                visible: IsLoading! ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WantImage!?
                    (
                    IsGoogle!
                   ? SvgPicture.asset("Assets/images/icons8_Google_2.svg")
                   : SvgPicture.asset("Assets/images/Icon_Facebook.svg")
                    )
                    :Text(""),
                    SizedBox(width: 10,),
                    Text(
                    textt!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:  WantBig!
                            ?20
                            :14,
                        color: Colors.black
                      //textcolor ? Colors.white : Colors.white,
                    ),

                  )

                  ],

              ),
              ),
              Visibility(
                visible: IsLoading!,
                child: Center(
                  child: SizedBox(
                    width: width/ 15,
                    height: height/ 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
//fix signing up in empty fields
