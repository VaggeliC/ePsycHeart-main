import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/beans/context/beans_game_providers.dart';
import 'package:epsycheart/cognitive/beans/screens/beans_report_screen.dart';
import 'package:epsycheart/cognitive/beans/widgets/beans_game_board.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BeansGameScreen extends HookConsumerWidget {
  const BeansGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(beansGameProvider);
    final gameNotifier = ref.read(beansGameProvider.notifier);

    return GameScreenLayout(
        title: 'cognitive.gameColorBeans.title'.tr(),
        gameListProvider: beansGameListProvider,
        gameArea: Center(child: BeansGameBoard()),
        onRestartPressed: () {
          gameNotifier.reset(null);
        },
        onGameCompletedPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => BeansReportScreen())));
        },
        winsText: 'cognitive.gameWord.winsText'.tr(),
        lossesText: 'cognitive.gameWord.lossesText'.tr(),
        showDraws: false,
        gameTurnMessage: gameNotifier.isPlaying()
            ? 'drop bean to box above'
            : gameNotifier.isGameOver(game.status)
                ? 'game ended'
                : '',
        gameStatusMessage: ''); // findWordGetGameStatusText(game.status).tr());
  }
}
