import 'package:tictactoe/board.dart';
import 'package:tictactoe/teams.dart';
import 'dart:io';

main(List<String> args) {
  Team playerOne = new Team("x");
  Team playerTwo = new Team("o");

  Board board = new Board(playerOne, playerTwo);

  while(board.getWinner == null && !board.isCompletelyFilled()) {
    print("Please ${board.getOnTurn.getIcon} tell us your master move!");
    int placement = int.parse(stdin.readLineSync());
    board.doMove(board.getOnTurn, placement ~/ 3, placement % 3);

    print(board.toString());
  }

  if(board.getWinner == null) {
     print("Well, this looks like a tie!");
  } else {
    print("Congratz: ${board.getWinner.getIcon} you've won the game!");
  }
}