import 'dart:math';
import 'package:epsycheart/cognitive/common/models/base_game_notifier.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_list_notifier.dart';
import 'package:epsycheart/cognitive/tictactoe/models/tictactoe_data_model.dart';
import 'package:epsycheart/cognitive/tictactoe/models/tictactoe_game_model.dart';
import 'package:epsycheart/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:epsycheart/cognitive/tictactoe/utilities/tictactoe_utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const botThinkMinTimeMSecs = 500;
const botThinkTimeMSecs = 500;

class TicTacToeGameNotifier extends BaseGameNotifier<
    TicTacToeGameModel,
    TicTacToeDataModel,
    TicTacToeGameListNotifier,
    TicTacToeResetParams,
    TicTacToePlayParams> {
  TicTacToeGameNotifier(
      Ref<Object?> ref,
      StateNotifierProvider<TicTacToeGameListNotifier, List<TicTacToeDataModel>>
          gameListProvider,
      {TicTacToeGameModel? initialState})
      : super(ref, gameListProvider, initialState ?? TicTacToeGameModel());

  bool isPlayerTurn() => isPlaying() && state.playerTurn == state.player;

  bool isBoardFull() => state.board.every((element) {
        return element != TicTacToePlayerType.none;
      });

  void _setCell(int index, TicTacToePlayerType player) {
    if (state.board[index] == TicTacToePlayerType.none &&
        player != TicTacToePlayerType.none) {
      List<TicTacToePlayerType> temp = [...state.board];
      temp[index] = player;

      state = state.copyWith(board: temp);
    }
  }

  void _switchPlayer() {
    if (!isPlaying()) {
      return;
    }

    if (isPlayerTurn()) {
      startPlayerReponseTimeRecording();
    } else {
      stopPlayerReponseTimeRecording();
    }

    state =
        state.copyWith(playerTurn: getNextTicTacToePlayer(state.playerTurn));
  }

  bool _checkWinningCells(int a, int b, int c) =>
      state.board[a] != TicTacToePlayerType.none &&
      state.board[a] == state.board[b] &&
      state.board[a] == state.board[c];

  void _checkWinner() {
    DateTime endTime = DateTime.now();

    bool winner = (_checkWinningCells(0, 1, 2) ||
        _checkWinningCells(3, 4, 5) ||
        _checkWinningCells(6, 7, 8) ||
        _checkWinningCells(0, 3, 6) ||
        _checkWinningCells(1, 4, 7) ||
        _checkWinningCells(2, 5, 8) ||
        _checkWinningCells(0, 4, 8) ||
        _checkWinningCells(2, 4, 6));

    if (isBoardFull() && !winner) {
      state = state.copyWith(endTime: endTime, status: GameStatusType.draw);
    }

    if (winner) {
      state = state.copyWith(
          endTime: endTime,
          status: isPlayerTurn() ? GameStatusType.won : GameStatusType.lost);
    }
  }

  Future _updateBot() async {
    // fake delay to simulate random humanized response
    int botThinkDelay = botThinkMinTimeMSecs +
        (Random().nextDouble() * botThinkTimeMSecs).toInt();

    await Future.delayed(Duration(milliseconds: botThinkDelay), () {
      List<int> temp = <int>[];

      for (var i = 0; i < state.board.length; i++) {
        if (state.board[i] == TicTacToePlayerType.none) {
          temp.add(i);
        }
      }

      int index = Random().nextInt(temp.length);

      _setCell(temp[index], state.playerTurn);

      _checkWinner();

      _switchPlayer();
    });
  }

  @override
  void cancel() {
    state = state.copyWith(status: GameStatusType.canceled);
  }

  @override
  TicTacToeGameModel initialGameState(TicTacToeResetParams? params) {
    // randomize player tile
    final _player = params != null && params.player != null
        ? params.player!
        : generateTicTacToePlayer();

    // randomize first player
    final _firstPlayer = params != null && params.firstPlayer != null
        ? params.firstPlayer!
        : generateTicTacToePlayer();

    return TicTacToeGameModel(
        status: GameStatusType.playing,
        minResponseTime: state.minResponseTime,
        maxResponseTime: state.maxResponseTime,
        avgResponseTime: state.avgResponseTime,
        player: _player,
        firstPlayer: _firstPlayer,
        playerTurn: _firstPlayer,
        startTime: DateTime.now());
  }

  // @override
  // void startPlayerReponseTimeRecording() {
  //   if (state.startResponseTime != null) {
  //     stopPlayerReponseTimeRecording();
  //   }

  //   state = state.copyWith(startResponseTime: DateTime.now());
  // }

  // @override
  // void stopPlayerReponseTimeRecording() {
  //   if (state.startResponseTime == null) {
  //     return;
  //   }

  //   DateTime endResponseTime = DateTime.now();

  //   final responseTime =
  //       endResponseTime.difference(state.startResponseTime!).inMilliseconds;

  //   double minResp = min(state.minResponseTime ?? 0, responseTime.toDouble());
  //   double maxResp = max(state.maxResponseTime ?? 0, responseTime.toDouble());
  //   double avgResp = (state.avgResponseTime ?? 0 + responseTime.toDouble()) / 2;

  //   state = state.copyWith(
  //       startResponseTime: null,
  //       minResponseTime: minResp,
  //       maxResponseTime: maxResp,
  //       avgResponseTime: avgResp);
  // }

  @override
  Future<GameStatusType> update(TicTacToePlayParams params) async {
    if (isPlayerTurn()) {
      _setCell(params.tileIndex, state.playerTurn);
    } else {
      await _updateBot();
    }

    _checkWinner();

    if (isPlaying()) {
      _switchPlayer();

      if (!isPlayerTurn()) {
        await _updateBot();
      }
    }

    return state.status;
  }

  @override
  void onReset(TicTacToeResetParams? params) {
    // state = initialGameState(params);
    if (!isPlayerTurn()) {
      _updateBot();
    }
  }

  @override
  void setPlayerResponseTimes(double min, double max, double avg) {
    state = state.copyWith(
        minResponseTime: min, maxResponseTime: max, avgResponseTime: avg);
  }

  @override
  DateTime? getPlayerStartResponseTime() => state.startResponseTime;

  @override
  void setPlayerStartResponseTime(DateTime? time) {
    state = state.copyWith(startResponseTime: time);
  }
}

class TicTacToeResetParams {
  final TicTacToePlayerType? player;

  final TicTacToePlayerType? firstPlayer;

  TicTacToeResetParams({this.player, this.firstPlayer});
}

class TicTacToePlayParams {
  final int tileIndex;

  TicTacToePlayParams(this.tileIndex);
}
