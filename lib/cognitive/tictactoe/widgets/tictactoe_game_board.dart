import 'dart:math';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_notifier.dart';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_providers.dart';
import 'package:epsycheart/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:epsycheart/cognitive/tictactoe/widgets/tictactoe_game_board_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicTacToeGameBoard extends HookConsumerWidget {
  const TicTacToeGameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boardDimension = min(constraints.maxWidth, constraints.maxHeight);
        final tileDimension = boardDimension / 3;
        final game = ref.watch(ticTacToeGameProvider);
        final gameNotifier = ref.read(ticTacToeGameProvider.notifier);

        return Stack(
          children: [
            Image.asset('assets/images/tic_tac_toe_board.png'),
            SizedBox(
              width: boardDimension,
              height: boardDimension,
              child: Column(
                  children: List.generate(
                      3,
                      (rowIndex) => Row(
                            children: List.generate(3, (colIndex) {
                              final tileIndex = rowIndex * 3 + colIndex;
                              final tileStatus = game.board[tileIndex];

                              return TicTacToeGameBoardTile(
                                  tileStatus: tileStatus,
                                  onPressed: (gameNotifier.isPlayerTurn() &&
                                          tileStatus ==
                                              TicTacToePlayerType.none)
                                      ? () {
                                          gameNotifier.play(
                                              TicTacToePlayParams(tileIndex));
                                        }
                                      : null,
                                  dimension: tileDimension);
                            }),
                          ))),
            )
          ],
        );
      },
    );
  }
}
