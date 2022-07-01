import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  
  int _p1score = 0;
  int _p2score = 0;
  bool _p1Turn = true;
  int _filledBoxes = 0;
  List<bool> _p1Orp2 = List.filled(9, false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TIC TAC TOE!"),
          actions: [
            IconButton(onPressed: () => print("board Cleared"), icon: Icon(Icons.refresh)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              //Players Name And Scores
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("PLAYER 1"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Score: "),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("PLAYER 2"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Score: "),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              //Tic-Tac-Toe Board
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => print("$index"),
                    child: Container(
                      child: Center(
                        child: Text(
                          "X/O",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              // Clear Board Button
              child: Container(
                child: Center(
                  child: Text("Player 1's turn"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
