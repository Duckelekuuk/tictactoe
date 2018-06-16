import 'package:tictactoe/board.dart';
import 'package:tictactoe/teams.dart';
import 'package:tictactoe/exceptions.dart';
import 'dart:io';

main(List<String> args) {
  Board board = new Board(new Team("x"), new Team("o"));

  while(board.getWinner == null && !board.isCompletelyFilled()) {
    print("Please ${board.getOnTurn.getIcon} tell us your master move!");
    try {
      int placement = int.parse(stdin.readLineSync());

      if(placement >= 0 && placement < 9) {
        board.doMove(board.getOnTurn, placement ~/ 3, placement % 3);
        print(board.toString());
      } else {
        print("This is not a valid field");
      }
    } on FormatException {
      print("Please, enter a valid number");
    } on FieldAlreadyFilledException {
      print("This field is already filled");
    } on InvalidFieldException {
      print("This is not a valid field");
    }
  }

  if(board.getWinner == null) {
     print("Well, this looks like a tie!");
  } else {
    print("Congratz: ${board.getWinner.getIcon} you've won the game!");
  }
}