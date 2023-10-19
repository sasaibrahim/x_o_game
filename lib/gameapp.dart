import 'package:flutter/material.dart';
import 'package:xogame_app/board_btn.dart';
import 'package:xogame_app/playermodel.dart';

class GameApp extends StatefulWidget {
  static const String routeName = 'game';

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  // const GameApp({Key? key}) : super(key: key);
  List<String> boardstate = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int player1 = 0;
  int player2 = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as PlayerModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'X_O',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${args.name1}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$player1',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${args.name2}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$player2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(boardstate[0], onBtnclick, 0),
                BoardBtn(boardstate[1], onBtnclick, 1),
                BoardBtn(boardstate[2], onBtnclick, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(boardstate[3], onBtnclick, 3),
                BoardBtn(boardstate[4], onBtnclick, 4),
                BoardBtn(boardstate[5], onBtnclick, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(boardstate[6], onBtnclick, 6),
                BoardBtn(boardstate[7], onBtnclick, 7),
                BoardBtn(boardstate[8], onBtnclick, 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void resetboard() {
    boardstate = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
  }

  bool cheackwinner(String symbol) {
    for (int i = 0; i < 3; i++) {
      if (boardstate[i] == symbol &&
          boardstate[i + 3] == symbol &&
          boardstate[i + 6] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 9; i += 3) {
      if (boardstate[i] == symbol &&
          boardstate[i + 1] == symbol &&
          boardstate[i + 2] == symbol) {
        return true;
      }
    }
    if (boardstate[0] == symbol &&
        boardstate[4] == symbol &&
        boardstate[8] == symbol) {
      return true;
    }
    if (boardstate[2] == symbol &&
        boardstate[4] == symbol &&
        boardstate[6] == symbol) {
      return true;
    }
    return false;
  }

  void onBtnclick(index) {
    if (boardstate[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardstate[index] = 'X';
      bool win = cheackwinner('X');
      if (win) {
        player1 += 1;
        resetboard();
      }
    } else {
      boardstate[index] = 'O';
      bool win = cheackwinner('O');
      if (win) {
        player2 += 1;
        resetboard();
      }
    }
    counter++;
    if (counter == 9) {
      resetboard();
      player2 = 0;
      player1 = 0;
    }
    setState(() {});
  }
}
