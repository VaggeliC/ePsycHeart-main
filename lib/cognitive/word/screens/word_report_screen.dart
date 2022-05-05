import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_report_screen_layout.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordReportScreen extends HookConsumerWidget {
  const WordReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameReportScreenLayout(
      title: 'cognitive.gameWord.title'.tr(),
      gameListProvider: findWordGameListProvider,
      winsTitle: 'cognitive.gameWord.winsText'.tr(),
      lossesTitle: 'cognitive.gameWord.lossesText'.tr(),
      onHomePressed: () {
        Navigator.popUntil(context, ModalRoute.withName('/cognitive'));
      },
    );
  }
}
