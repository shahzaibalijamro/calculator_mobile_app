import 'widgets/custom_display_screen.dart';

import 'widgets/custom_btn.dart';

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorScreen> {
  String displayVal = "0";
  String secondDisplayVal = "0";
  String firstNum = "0";
  String secondNum = "0";
  int finalVal = 0;
  String? operand;
  List<String> operationsAvailable = ["%", "/", "*", "-", "+", "="];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            customDisplayScreen(
              displayVal: displayVal,
              secondDisplayVal: secondDisplayVal,
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        customBtn(
                          btnVar: Icons.backspace,
                          onTapFunction: () {
                            buttonPressed("remove");
                          },
                          btnColor: Color(0xFFA6A6A6),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "AC",
                          onTapFunction: () {
                            buttonPressed("AC");
                          },
                          btnColor: Color(0xFFA6A6A6),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: Icons.percent,
                          onTapFunction: () {},
                          btnColor: Color(0xFFA6A6A6),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "÷",
                          onTapFunction: () {},
                          btnColor: Color(0xFFf0a33b),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      children: [
                        customBtn(
                          btnVar: "7",
                          onTapFunction: () {
                            buttonPressed("7");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "8",
                          onTapFunction: () {
                            buttonPressed("8");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "9",
                          onTapFunction: () {
                            buttonPressed("9");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: Icons.close,
                          onTapFunction: () {},
                          btnColor: Color(0xFFf0a33b),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      children: [
                        customBtn(
                          btnVar: "4",
                          onTapFunction: () {
                            buttonPressed("4");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "5",
                          onTapFunction: () {
                            buttonPressed("5");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "6",
                          onTapFunction: () {
                            buttonPressed("6");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: Icons.remove,
                          onTapFunction: () {},
                          btnColor: Color(0xFFf0a33b),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      children: [
                        customBtn(
                          btnVar: "1",
                          onTapFunction: () {
                            buttonPressed("1");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "2",
                          onTapFunction: () {
                            buttonPressed("2");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "3",
                          onTapFunction: () {
                            buttonPressed("3");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: Icons.add,
                          onTapFunction: () {
                            buttonPressed("+");
                          },
                          btnColor: Color(0xFFf0a33b),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      children: [
                        customBtn(
                          isStadium: true,
                          btnVar: "0",
                          onTapFunction: () {},
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: ".",
                          onTapFunction: () {
                            buttonPressed(".");
                          },
                          btnColor: Color(0xFF333333),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: Icons.drag_handle,
                          onTapFunction: () {
                            buttonPressed("=");
                          },
                          btnColor: Color(0xFFf0a33b),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed(String buttonNum) {
    setState(() {
      if (buttonNum == "=") {
        calculate(updateMainDisplayVal: true);
        return;
      }
      if (buttonNum == "AC") {
        displayVal = "0";
        firstNum = "0";
        secondNum = "0";
        return;
      }
      if (displayVal == "0") {
        displayVal = buttonNum;
      } else {
        displayVal += buttonNum;
      }
      if (displayVal.contains("+")) {
        if (buttonNum != "+") {
          if (secondNum == "0") {
            secondNum = buttonNum;
          } else {
            secondNum += buttonNum;
          }
          calculate(updateMainDisplayVal: false);
        }
      } else {
        if (firstNum == "0") {
          firstNum = buttonNum;
        } else {
          firstNum += buttonNum;
        }
      }
    });
    print(displayVal);
    print(firstNum);
    print(secondNum);
    print(secondDisplayVal);
  }

  void calculate({bool updateMainDisplayVal = true}) {
    int firstVal = int.parse(firstNum);
    int secondVal = int.parse(secondNum);
    print(firstVal);
    print(secondVal);
    setState(() {
      if (updateMainDisplayVal) {
        displayVal = "${firstVal + secondVal}";
      } else {
        secondDisplayVal = "${firstVal + secondVal}";
      }
    });
  }
}
