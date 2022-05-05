import 'dart:math';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:flutter/material.dart';

const ticTacToeDefaultBoard = [
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
  TicTacToePlayerType.none,
];

TicTacToePlayerType generateTicTacToePlayer() =>
    Random().nextBool() == true ? TicTacToePlayerType.x : TicTacToePlayerType.o;

TicTacToePlayerType getNextTicTacToePlayer(TicTacToePlayerType current) {
  switch (current) {
    case TicTacToePlayerType.x:
      return TicTacToePlayerType.o;
    case TicTacToePlayerType.o:
      return TicTacToePlayerType.x;
    default:
      return TicTacToePlayerType.none;
  }
}

Image? getTicTacToeStatusImage(TicTacToePlayerType status) {
  switch (status) {
    case TicTacToePlayerType.x:
      return Image.asset('assets/images/tic_tac_toe_x.png');
    case TicTacToePlayerType.o:
      return Image.asset('assets/images/tic_tac_toe_o.png');
    default:
      return null;
  }
}

String getTicTacToeGetGameStatusText(GameStatusType status) {
  switch (status) {
    case GameStatusType.won:
      return 'cognitive.gameTicTacToe.winText';
    case GameStatusType.draw:
      return 'cognitive.gameTicTacToe.drawText';
    case GameStatusType.lost:
      return 'cognitive.gameTicTacToe.lostText';
    default:
      return '';
  }
}
