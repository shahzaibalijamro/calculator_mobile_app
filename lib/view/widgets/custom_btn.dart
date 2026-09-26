import 'package:flutter/material.dart';

Widget customBtn({
  bool isStadium = false,
  required dynamic btnVar,
  Color btnColor = Colors.orange,
  Color txtColor = Colors.white,
  required VoidCallback onTapFunction,
}) {
  dynamic renderBtn() {
    btnVar.runtimeType;
    if (btnVar is String) {
      String btnText = btnVar;
      return btnText;
    }
    if (btnVar is IconData) {
      IconData btnIcon = btnVar;
      return btnIcon;
    }
    return null;
  }

  return Expanded(
    flex: isStadium ? 9 : 4,
    child: InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: renderBtn().runtimeType == String
              ? Text(
                  renderBtn(),
                  style: TextStyle(color: txtColor, fontSize: 27),
                )
              : Icon(renderBtn(), color: Colors.white, size: 27),
        ),
      ),
    ),
  );
}
