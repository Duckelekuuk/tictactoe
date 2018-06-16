import 'exceptions.dart';
import 'teams.dart';

class Board {

  final List<List<Team>> _board = new List<List<Team>>();
  final Team _playerOne;
  final Team _playerTwo;

  Team _winner = null;
  Team _onTurn;

  Board(this._playerOne, this._playerTwo) {
    this._onTurn = _playerOne;

    for(int i = 0; i < 3; i++) {
      _board.add(new List<Team>());
      _board[i].length = 3;
    }
  }

  bool doMove(Team team, int column, int row) {
    if(column >= 0 && column < 3 && row >= 0 && row < 3) {
      if(_board[column][row] == null) {
        _board[column][row] = team;
        _onTurn = _onTurn == _playerOne ? _playerTwo : _playerOne;
        return _scanWinner() != null;
      } else throw new FieldAlreadyFilledException("The field $column : $row is already filled");
    } else {
      throw new FieldAlreadyFilledException();
    }
  }

  Team _scanWinner() {
    if(_winner == null) {
      for(int i = 0; i < 3; i++) {
        if(_areEqualAndNotNull([_board[i][0], _board[i][1], _board[i][2]])) {
          _winner = _board[i][0];
          return _winner;
        }

        if(_areEqualAndNotNull([_board[0][i], _board[1][i], _board[2][i]])) {
          _winner = _board[0][i];
          return _winner;
        }
      }

      if(_areEqualAndNotNull([_board[0][0], _board[1][1], _board[2][2]]) || _areEqualAndNotNull([_board[2][0], _board[1][1], _board[0][2]])) {
        _winner = _board[1][1];
        return _winner;
      }
    }
    return _winner;
  }

  bool isCompletelyFilled() {
    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 3; j++) {
        if(_board[i][j] == null) return false;
      }
    }
    return true;
  }

  bool _areEqualAndNotNull(List<Object> objects) {
    Object last = null;
    for(Object object in objects) {
      if(last == null) last = object;

      if(object == null || object != last) {
        return false;
      }
    }
    return true;
  }

  Team get getOnTurn => this._onTurn;

  Team get getWinner => this._winner;

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.writeln("");
    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 3; j++) {
        buffer.write("|${_board[i][j] == null ? "-" : _board[i][j].getIcon}");
        if(j == 2) buffer.write("|");
      }
      buffer.writeln("");
    }
    return buffer.toString();
  }
}