import 'package:flutter/material.dart';

Widget customElevatedBtn(
    String btnlabel, VoidCallback onPressed, Color bgcolor, Color textColor) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5))),
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(btnlabel,
          style: TextStyle(
            fontFamily: "Mooli",
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          )),
    ),
  );
}
