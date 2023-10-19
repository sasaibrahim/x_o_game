import 'package:flutter/material.dart';
import 'package:xogame_app/gameapp.dart';
import 'package:xogame_app/playermodel.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login';
  var playeroneController = TextEditingController();
  var playertweController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 12,
          shadowColor: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: playeroneController,
                  decoration: InputDecoration(
                    label: Text('player one '),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: playertweController,
                  decoration: InputDecoration(
                    label: Text('player two '),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, GameApp.routeName,
                          arguments: PlayerModel(playeroneController.text,
                              playertweController.text));
                    },
                    child: Text('go!'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
