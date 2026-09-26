import 'package:flutter/material.dart';

Widget customDisplayScreen({
  required String displayVal,
  required String secondDisplayVal,
}) {
  return Expanded(
    flex: 2,
    child: Container(
      color: Colors.black,
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              secondDisplayVal == "0" ? "" : secondDisplayVal,
              maxLines: 1,
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              displayVal,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 46),
            ),
          ),
        ],
      ),
    ),
  );
}
