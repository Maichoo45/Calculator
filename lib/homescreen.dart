import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'dart:math';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userInput='';
  var result='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                      child: Text(userInput.toString(),style: TextStyle(fontSize: 50,color: Colors.white)),
                    ),
                    Text(result.toString(),style: TextStyle(fontSize: 50,color: Colors.white)),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Mybutton(title: 'DEL',color: Color(0xFF616161),onPress: (){
                              userInput= userInput.substring(0,userInput.length - 1);
                              setState(() {

                              });
                            },),
                            Mybutton(title: 'AC',color: Color(0xff616161),onPress: (){
                              userInput='';
                              result='';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '%',color: Color(0xFF616161),onPress: (){
                              userInput=userInput+'%';
                              setState(() {

                              });

                            }),
                            Mybutton(title: '÷',color: Color(0xfffb8c00),onPress: (){
                              userInput=userInput+'÷';
                              setState(() {

                              });

                            }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Mybutton(title: '7',onPress: (){
                              userInput=userInput+'7';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '8',onPress: (){
                              userInput=userInput+'8';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '9',onPress: (){
                              userInput=userInput+'9';
                              setState(() {

                              });
                            }),
                            Mybutton(title: 'X',color: Color(0xfffb8c00),onPress: (){
                              userInput=userInput+'x';
                              setState(() {

                              });

                            }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Mybutton(title: '4',onPress: (){
                              userInput=userInput+'4';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '5',onPress: (){
                              userInput=userInput+'5';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '6',onPress: (){
                              userInput=userInput+'6';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '-',color: Color(0xfffb8c00),onPress: (){
                              userInput=userInput+'-';
                              setState(() {

                              });

                            }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Mybutton(title: '1',onPress: (){
                              userInput=userInput+'1';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '2',onPress: (){
                              userInput=userInput+'2';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '3',onPress: (){
                              userInput=userInput+'3';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '+',color: Color(0xfffb8c00),onPress: (){
                              userInput=userInput+'+';
                              setState(() {

                              });

                            }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Mybutton(
                              title: '+/-',
                              onPress: () {
                                setState(() {
                                  if (userInput.isNotEmpty) {
                                    if (userInput.startsWith('-')) {
                                      userInput = userInput.substring(1);
                                    } else {
                                      userInput = '-$userInput';
                                    }
                                  }
                                });

                              },
                            ),
                            Mybutton(title: '0',onPress: (){
                              userInput=userInput+'0';
                              setState(() {

                              });
                            }),
                            Mybutton(title: '.',onPress: (){
                              userInput=userInput+'.';
                              setState(() {

                              });

                            }),
                            Mybutton(title: '=',color: Color(0xfffb8c00),onPress: (){
                              equalPress();
                              setState(() {
                              });

                            }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput=userInput.replaceAll('x', '*');
    finalUserInput=userInput.replaceAll('÷', '/');
    Parser p= Parser();

    Expression expression= p.parse(finalUserInput);
    ContextModel contextmodel= ContextModel();
    double eval=expression.evaluate(EvaluationType.REAL, contextmodel);
    result=eval.toString();




  }
}
class Mybutton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const Mybutton({super.key,required this.title,
    this.color= const Color(0xff303030),
    required this.onPress,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: color,

              shape: BoxShape.circle,


            ),
            child: Center (child:Text(title,style: TextStyle(fontSize: 24,color: Colors.white ),)),




          ),
        ),

    );
  }
}

