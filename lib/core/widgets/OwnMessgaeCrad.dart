import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  // const OwnMessageCard({Key? key, required this.message, required this.time}) : super(key: key);
  // final String message;
  // final String time;

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width
        ),

          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: h/50),
                child: Row(
                  children: [
                    CircleAvatar(radius: 23,),
                    SizedBox(width: h/100,),
                    Container(
                      width: w/1.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('DORRiTo\$', textAlign: TextAlign.left, style: TextStyle(
                                  color: COLOR.onTertiaryContainer,
                                  fontFamily: 'Sofia Pro',
                                  fontSize: 20,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                              Text('2 min ago', textAlign: TextAlign.right, style: TextStyle(
                                  color: COLOR.onTertiaryContainer,
                                  fontFamily: 'Sofia Pro',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),)
                            ],
                          ),
                           SizedBox(height: 7,),
                           Text('Hello! all good, nice to meet you too!'
                'Let’s get to know each other better'
                'Let’s get to know each other better', textAlign: TextAlign.left, style: TextStyle(
                color: COLOR.surfaceVariant,
          fontFamily: 'Sofia Pro',
          fontSize: 17,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1
      ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  }
}
