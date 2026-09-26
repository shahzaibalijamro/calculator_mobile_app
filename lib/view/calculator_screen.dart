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
  List<String> operationsAvailable = ["%", "/", "*", "-", "+"];

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
                          onTapFunction: () {
                            buttonPressed("%");
                          },
                          btnColor: Color(0xFFA6A6A6),
                        ),
                        Spacer(),
                        customBtn(
                          btnVar: "÷",
                          onTapFunction: () {
                            buttonPressed("/");
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
                          onTapFunction: () {
                            buttonPressed("*");
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
                          onTapFunction: () {
                            buttonPressed("-");
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
                          onTapFunction: () {
                            buttonPressed("0");
                          },
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
      //check if it's the second operation button pressed without pressing equals to
      if (operationsAvailable.contains(buttonNum)) {
        // already pressed an operator in the previous button press
        if (operationsAvailable.contains(lastCharacterOf(displayVal))) {
          return;
        }
        // if already has an operator, we calculate the previous one before adding new
        if (operatorPresentInCalc()) {
          calculate(updateMainDisplayVal: false);
          firstNum = secondDisplayVal;
          secondNum = "0";
          displayVal += buttonNum;
          return;
        }
      }
      if (buttonNum == "remove") {
        // if last character, then just clear all
        if (isLastCharacter()) {
          clearAll();
          return;
        }
        if (lastCharacterOf(displayVal) == "+") {
          displayVal = removeLastCharacterFrom(displayVal);
          return;
        } else {
          displayVal = removeLastCharacterFrom(displayVal);
        }
        if (displayVal.contains("+")) {
          if (secondNum != "0") {
            if (secondNum.length > 1) {
              secondNum = removeLastCharacterFrom(secondNum);
            } else {
              secondNum = "0";
            }
          }
        } else {
          if (firstNum != "0") {
            firstNum = removeLastCharacterFrom(firstNum);
          }
        }
        calculate(updateMainDisplayVal: false);
        return;
      }
      if (buttonNum == "=") {
        calculate(updateMainDisplayVal: true);
        return;
      }
      if (buttonNum == "AC") {
        clearAll();
        return;
      }
      if (displayVal == "0") {
        if (operationsAvailable.contains(buttonNum)) {
          return;
        }
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

  void clearAll() {
    displayVal = "0";
    secondDisplayVal = "0";
    firstNum = "0";
    secondNum = "0";
  }

  void calculate({bool updateMainDisplayVal = true}) {
    num firstVal = num.parse(firstNum);
    num secondVal = num.parse(secondNum);
    print(firstVal);
    print(secondVal);
    setState(() {
      if (updateMainDisplayVal) {
        displayVal = "${firstVal + secondVal}";
        secondDisplayVal = "${firstVal + secondVal}";
        firstNum = displayVal;
        secondNum = "0";
      } else {
        secondDisplayVal = "${firstVal + secondVal}";
      }
    });
  }

  bool isLastCharacter() {
    return displayVal.length == 1 && firstNum.length == 1 ? true : false;
  }

  bool operatorPresentInCalc() {
    for (var operator in operationsAvailable) {
      if (displayVal.contains(operator)) {
        return true;
      }
    }
    return false;
  }

  String lastCharacterOf(String text) {
    return text.length > 1
        ? text[text.length - 1]
        : text.length == 1
        ? text
        : "";
  }

  String removeLastCharacterFrom(String text) {
    return text.length > 1
        ? text.substring(0, text.length - 1)
        : text.length == 1
        ? text
        : "";
  }
}
