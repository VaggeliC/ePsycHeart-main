import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_screen_layout.dart';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_providers.dart';
import 'package:epsycheart/cognitive/tictactoe/screens/tictactoe_report_screen.dart';
import 'package:epsycheart/cognitive/tictactoe/utilities/tictactoe_utilities.dart';
import 'package:epsycheart/cognitive/tictactoe/widgets/tictactoe_game_board.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicTacToeGameScreen extends HookConsumerWidget {
  const TicTacToeGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(ticTacToeGameProvider);
    final gameNotifier = ref.read(ticTacToeGameProvider.notifier);

    return GameScreenLayout(
      title: 'cognitive.gameTicTacToe.title'.tr(),
      gameListProvider: ticTacToeGameListProvider,
      gameArea: Center(child: TicTacToeGameBoard()),
      onRestartPressed: () {
        gameNotifier.reset(null);
      },
      onGameCompletedPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => TicTacToeReportScreen())));
      },
      winsText: 'cognitive.gameTicTacToe.winsText'.tr(),
      drawsText: 'cognitive.gameTicTacToe.drawsText'.tr(),
      lossesText: 'cognitive.gameTicTacToe.lossesText'.tr(),
      gameTurnMessage: gameNotifier.isPlaying()
          ? gameNotifier.isPlayerTurn()
              ? 'cognitive.gameTicTacToe.playerTurn'.tr()
              : 'cognitive.gameTicTacToe.opponentTurn'.tr()
          : 'cognitive.gameTicTacToe.gameOver'.tr(),
      gameStatusMessage: getTicTacToeGetGameStatusText(game.status).tr(),
    );
  }
}
