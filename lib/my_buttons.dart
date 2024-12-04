import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final Color textColor;
  final Color btnColor;
  final String btntext;
  final void Function() buttonTapped;

  const MyButtons(
    this.btntext,
    this.textColor,
    this.btnColor,
    this.buttonTapped, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: btnColor,
          ),
          child: Center(
            child: Text(
              btntext,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
