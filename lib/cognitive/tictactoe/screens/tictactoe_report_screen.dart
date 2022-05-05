import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_report_screen_layout.dart';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicTacToeReportScreen extends HookConsumerWidget {
  const TicTacToeReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameReportScreenLayout(
      title: 'cognitive.gameTicTacToe.title'.tr(),
      gameListProvider: ticTacToeGameListProvider,
      winsTitle: 'cognitive.gameTicTacToe.winsText'.tr(),
      drawsTitle: 'cognitive.gameTicTacToe.drawsText'.tr(),
      lossesTitle: 'cognitive.gameTicTacToe.lossesText'.tr(),
      onHomePressed: () {
        Navigator.popUntil(context, ModalRoute.withName('/cognitive'));
      },
    );
  }
}
