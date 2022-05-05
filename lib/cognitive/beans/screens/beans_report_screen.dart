import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/beans/context/beans_game_providers.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_report_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BeansReportScreen extends HookConsumerWidget {
  const BeansReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameReportScreenLayout(
      title: 'cognitive.gameColorBeans.title'.tr(),
      gameListProvider: beansGameListProvider,
      winsTitle: 'cognitive.gameColorBeans.winsText'.tr(),
      lossesTitle: 'cognitive.gameColorBeans.lossesText'.tr(),
      onHomePressed: () {
        Navigator.popUntil(context, ModalRoute.withName('/cognitive'));
      },
    );
  }
}
