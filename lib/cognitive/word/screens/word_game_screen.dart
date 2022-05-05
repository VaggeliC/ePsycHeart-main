import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_screen_layout.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_notifier.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:epsycheart/cognitive/word/screens/word_report_screen.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_utilities.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_utils.dart';
import 'package:epsycheart/cognitive/word/widgets/find_word_game_board.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordGameScreen extends HookConsumerWidget {
  const WordGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(findWordGameProvider);
    final gameNotifier = ref.read(findWordGameProvider.notifier);

    return GameScreenLayout(
        title: 'cognitive.gameWord.title'.tr(),
        gameListProvider: findWordGameListProvider,
        gameArea: Center(child: FindWordGameBoard()),
        onRestartPressed: () {
          final words = findWordRandomWords();

          gameNotifier.reset(FindWordResetParams(
              words: words,
              defaultLetters: 'cognitive.gameWord.defaultLetters'.tr()));
        },
        onGameCompletedPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => WordReportScreen())));
        },
        winsText: 'cognitive.gameWord.winsText'.tr(),
        lossesText: 'cognitive.gameWord.lossesText'.tr(),
        showDraws: false,
        gameTurnMessage: game.words.isNotEmpty ? game.words[0] : '',
        gameStatusMessage: findWordGetGameStatusText(game.status).tr());
  }
}
