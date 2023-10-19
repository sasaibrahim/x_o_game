import 'package:flutter/material.dart';

class BoardBtn extends StatelessWidget {
  String text;
  Function onBtnclick;
  int index;

  BoardBtn(this.text, this.onBtnclick, this.index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onBtnclick(index);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )));
  }
}
