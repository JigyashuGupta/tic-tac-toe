import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/tic_tac_toe_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _player1 = "", _player2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIC TAC TOE!"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('Player 1: ',style:  Theme.of(context).textTheme.bodyText1),
                    ),
                    Expanded(
                      child: TextField(
                        style: kTextFieldStyle,
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (value) => _player1 = value,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('Player 2: ',style:  Theme.of(context).textTheme.bodyText1),
                    ),
                    Expanded(
                      child: TextField(
                        style: kTextFieldStyle,
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (value) => _player2 = value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: MaterialButton(
                  textColor: Colors.amber,
                    child: Text('Play Game', style: Theme.of(context).textTheme.bodyText1,),
                    onPressed: () {
                      if (_player1 == "" ||
                          _player2 == "" ||
                          (_player1 == _player2)) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                                "Players names cannot be empty or same!", style: Theme.of(context).textTheme.bodyText2,),
                            content: TextButton(
                              child: Text("OK", style: Theme.of(context).textTheme.bodyText1,),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        );
                      }
                      else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TicTacToeScreen(_player1, _player2),
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
