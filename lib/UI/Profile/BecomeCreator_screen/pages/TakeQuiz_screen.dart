import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_Event.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_State.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_Bloc.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/pages/BecomeCreatorEnd_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:conditional_questions/conditional_questions.dart';
class TakeQuiz_Screen extends StatefulWidget {
  const TakeQuiz_Screen({Key? key}) : super(key: key);

  @override
  State<TakeQuiz_Screen> createState() => _TakeQuiz_ScreenState();
}

class _TakeQuiz_ScreenState extends State<TakeQuiz_Screen> {
  final _key = GlobalKey<QuestionFormState>();
  final _CreatorBloc = sl<CreatorBloc>();
  List<Question> questions=[
  ];
  @override
  void initState() {
    super.initState();
    _CreatorBloc.add(GetQuestions());
  }
  bool diditonce = true;
  bool done = false;
  List<String> Answers= [];
  List<int> QuestionID= [];
  List<int> AnswerID= [];
  List<String> AnswerString= [];

   @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme
        .of(context)
        .textTheme;
    ColorScheme COLOR = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder(
        bloc: _CreatorBloc,
        builder: (BuildContext context, CreatorState state) {

          if (state.success!&&diditonce ==true){

            for(int i =0;i<state.Questions!.questions!.length;i++){

              print("Entered");

               for (int k=0;k<state.Questions!.questions![i].answers!.length;k++){
                 Answers.add("${state.Questions!.questions![i].answers![k].title!}");
               }


              questions.add(PolarQuestion(
                question: "${state.Questions!.questions![i].id}: ${state.Questions!.questions![i].title.toString()}",
                answers: Answers.toList(),
               // isMandatory: true,
              ));

              Answers.clear();
            }

            diditonce =false;
            done = true;
          }

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
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
                                    color: COLOR.surface),
                                onPressed:(){

                                  Navigator.pop(context);
                                },
                              )),
                          Text('Become a Creator', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 23
                          ),),
                          Text(""),
                          Text(""),

                        ],
                      ),
                    ),
                    state.success!
                  ? Container(
                      width: w,
                      height: h/1.1,
                      child:  ConditionalQuestions(
                          key: _key,
                          children: questions,
                          trailing: [
                            MaterialButton(
                              color: Color.fromRGBO(207, 109, 56, 1),
                              splashColor: Colors.orangeAccent,
                              onPressed: () async {
                                AnswerString.clear();
                                AnswerID.clear();
                                QuestionID.clear();

                                var questionAndAnswers = _key.currentState!.toMap();

                                for (var key in questionAndAnswers.keys) {

                                  String Questionid = key.toString().substring(0,1);
                                  var myInt = int.parse(Questionid);
                                  QuestionID.add(myInt);
                                  //  print(QuestionID);
                                }
                                for (var key in questionAndAnswers.values) {
                                  String AnswerId = key.toString();
                                  AnswerString.add(AnswerId);
                                }

                                for(int i=0;i<state.Questions!.questions!.length;i++){
                                  for(int j=0;j<state.Questions!.questions![i].answers!.length;j++){
                                    if (state.Questions!.questions![i].answers![j].title==AnswerString[i]){
                                      print(AnswerString[i]);
                                      AnswerID.add(state.Questions!.questions![i].answers![j].id!);
                                    }
                                  }
                                }
                                print(AnswerID);
                                print(QuestionID);
                        if (state.Questions!.questions!.length==AnswerID.length)
                          _CreatorBloc.add(SubmitAnswers((b) => b
                            ..AnswerID=AnswerID
                            ..QuestionId=QuestionID
                          ));
                                Navigator.pop(context);
                                WidgetsBinding.instance!
                                    .addPostFrameCallback((_) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreatorScreenEnd()),
                                ));
                                // alreatDialogBuilder2(
                                //     context,
                                //     "Quiz Message",
                                //     "Are you sure you want to"
                                //         " continue with these answers becuase you won't be able"
                                //         " to come back to this page",
                                //     "Continue",
                                //     "Back",
                                //     h,
                                //     w, () {});
                              },
                              child: Text("Submit"),
                            )
                          ],
                        ),
                    )
                   : state.isLoading == true
                        ? Container(
                        width: w,
                        height: h/1.2,child: Center(child: listLoader(context: context)))
                        : SizedBox(),

                    // InkWell(
                    //   onTap: () {
                    //  //    AnswerString.clear();
                    //  //    AnswerID.clear();
                    //  //    QuestionID.clear();
                    //  //
                    //  // var questionAndAnswers = _key.currentState!.toMap();
                    //  //
                    //  //   for (var key in questionAndAnswers.keys) {
                    //  //
                    //  //     String Questionid = key.toString().substring(0,1);
                    //  //     var myInt = int.parse(Questionid);
                    //  //     QuestionID.add(myInt);
                    //  //   //  print(QuestionID);
                    //  //   }
                    //  // for (var key in questionAndAnswers.values) {
                    //  //   String AnswerId = key.toString();
                    //  //   AnswerString.add(AnswerId);
                    //  // }
                    //  //
                    //  // for(int i=0;i<state.Questions!.questions!.length;i++){
                    //  //     for(int j=0;j<state.Questions!.questions![i].answers!.length;j++){
                    //  //       if (state.Questions!.questions![i].answers![j].title==AnswerString[i]){
                    //  //         print(AnswerString[i]);
                    //  //         AnswerID.add(state.Questions!.questions![i].answers![j].id!);
                    //  //         }
                    //  //     }
                    //  // }
                    //  // print(AnswerID);
                    //  // print(QuestionID);
                    //  //
                    //  //
                    //  //    alreatDialogBuilder2(
                    //  //        context,
                    //  //        "Quiz Message",
                    //  //        "Are you sure you want to"
                    //  //            " continue with these answers becuase you won't be able"
                    //  //            " to come back to this page",
                    //  //        "Continue",
                    //  //        "Back",
                    //  //        h,
                    //  //        w, () {});
                    //   },
                    //   child: Container(
                    //       width: w / 1.6,
                    //       height: h / 17,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(5),
                    //           topRight: Radius.circular(5),
                    //           bottomLeft: Radius.circular(5),
                    //           bottomRight: Radius.circular(5),
                    //         ),
                    //         boxShadow: [BoxShadow(
                    //             color: Color.fromRGBO(
                    //                 0, 0, 0, 0.15000000596046448),
                    //             offset: Offset(0, 0),
                    //             blurRadius: 6
                    //         )
                    //         ],
                    //         color: Color.fromRGBO(207, 109, 56, 1),
                    //       ),
                    //       child: Center(
                    //         child: Text('Continue!',
                    //           textAlign: TextAlign.center, style: TextStyle(
                    //               color: Color.fromRGBO(234, 234, 234, 1),
                    //               fontFamily: 'Sofia Pro',
                    //               fontSize: 20,
                    //               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    //               fontWeight: FontWeight.normal,
                    //               height: 1
                    //           ),),
                    //       )
                    //
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  alreatDialogBuilder2(BuildContext Context,
      String Title,
      String body,
      String BottonTxt,
      String BottonTxt2,
      double height,
      double Width,
      Function onpressed) async {
    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
            backgroundColor: const Color(0xff303030),
            content: Container(
              width: Width / 2,
              height: height / 6.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.285714149475098),
                  topRight: Radius.circular(8.285714149475098),
                  bottomLeft: Radius.circular(8.285714149475098),
                  bottomRight: Radius.circular(8.285714149475098),
                ),
                color: Color.fromRGBO(47, 47, 47, 1),
              ),
              child: Row(
                children: [
                  InkWell(
                    child: Container(

                      width: Width / 1.4,
                      height: height / 4,
                      //  color: Colors.blue,
                      child: Text(body,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400),),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {

                },
                child: Center(
                  child: Container(
                    width: Width / 3,
                    height: height / 20,
                    margin: EdgeInsets.only(right: height / 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.142857074737549),
                        topRight: Radius.circular(4.142857074737549),
                        bottomLeft: Radius.circular(4.142857074737549),
                        bottomRight: Radius.circular(4.142857074737549),
                      ),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 0),
                          blurRadius: 6.628571510314941
                      )
                      ],
                      color: Color.fromRGBO(168, 48, 99, 1),
                    ),
                    child: Center(
                        child:
                        Text(BottonTxt, textAlign: TextAlign.center,
                          style: const TextStyle(
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
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(Context);
                },
                child: Center(
                  child: Container(
                    width: Width / 3,
                    height: height / 20,
                    margin: EdgeInsets.only(right: height / 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.142857074737549),
                        topRight: Radius.circular(4.142857074737549),
                        bottomLeft: Radius.circular(4.142857074737549),
                        bottomRight: Radius.circular(4.142857074737549),
                      ),
                      boxShadow: [BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 0),
                          blurRadius: 6.628571510314941
                      )
                      ],
                      color: Color.fromRGBO(168, 48, 99, 1),
                    ),
                    child: Center(
                        child:
                        Text(BottonTxt2, textAlign: TextAlign.center,
                          style: const TextStyle(
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
              ),

            ],
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