import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  static String id = 'tic_tac_toe_screen';
  String p1, p2;
  TicTacToeScreen(this.p1, this.p2, {Key? key}) : super(key: key);
  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late String _p1Name = widget.p1;
  late String _p2Name = widget.p2;

  int _p1score = 0;
  int _p2score = 0;
  bool _p1Turn = true;
  int _filledBoxes = 0;
  List<bool?> _p1Orp2 = List.filled(9, null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TIC TAC TOE!"),
          actions: [
            IconButton(
                onPressed: () => resetBoard(), icon: const Icon(Icons.refresh)),
          ],
        ),
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "PLAYER 1: $_p1Name",
                      ),
                      Text("Score: ${_p1score}"),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "PLAYER 2: $_p2Name",
                      ),
                      Text("Score: $_p2score"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              //Tic-Tac-Toe Board
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Text(
                          _boxValue(_p1Orp2[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text("${(_p1Turn) ?_p1Name:_p2Name}'s turn", style: TextStyle(fontSize: 40, letterSpacing: 1.2),),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _boxValue(bool? b) {
    if (b == null) {
      return '';
    } else if (b) {
      return 'X';
    } else {
      return 'O';
    }
  }

  void _tapped(int index) {
    if (_p1Orp2[index] == null) {
      setState(() {
        _p1Orp2[index] = _p1Turn;
      });
      _filledBoxes++;
      _checkWinner();
    }
  }

  void _checkWinner() {
    if (_p1Orp2[0] != null &&
        _p1Orp2[0] == _p1Orp2[1] &&
        _p1Orp2[0] == _p1Orp2[2]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[3] != null &&
        _p1Orp2[3] == _p1Orp2[4] &&
        _p1Orp2[3] == _p1Orp2[5]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[6] != null &&
        _p1Orp2[6] == _p1Orp2[7] &&
        _p1Orp2[6] == _p1Orp2[8]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[0] != null &&
        _p1Orp2[0] == _p1Orp2[3] &&
        _p1Orp2[0] == _p1Orp2[6]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[1] != null &&
        _p1Orp2[1] == _p1Orp2[4] &&
        _p1Orp2[1] == _p1Orp2[7]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[2] != null &&
        _p1Orp2[2] == _p1Orp2[5] &&
        _p1Orp2[2] == _p1Orp2[8]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[0] != null &&
        _p1Orp2[0] == _p1Orp2[4] &&
        _p1Orp2[0] == _p1Orp2[8]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_p1Orp2[2] != null &&
        _p1Orp2[2] == _p1Orp2[4] &&
        _p1Orp2[2] == _p1Orp2[6]) {
      _showResults("${(_p1Turn ? _p1Name : _p2Name)} wins!");
      incrementScore();
      return;
    }
    if (_filledBoxes == 9) {
      _showResults("It's a draw!");
      resetBoard();
      return;
    }
    _p1Turn = !_p1Turn;
  }

  void incrementScore() {
    if (_p1Turn) {
      _p1score++;
    } else {
      _p2score++;
    }
    resetBoard();
  }

  void _showResults(String s) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Game : $s", style: Theme.of(context).textTheme.bodyText2,),
        content: TextButton(
          child: Text("OK!", style: Theme.of(context).textTheme.bodyText1,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void resetBoard() {
    setState(() {
      for (int i = 0; i < _p1Orp2.length; i++) {
        _p1Orp2[i] = null;
      }
      _filledBoxes = 0;
      _p1Turn = true;
    });
  }
}
