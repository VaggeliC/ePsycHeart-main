import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/beans/context/beans_game_providers.dart';
import 'package:epsycheart/cognitive/beans/screens/beans_game_screen.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_instructions_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BeansStartScreen extends HookConsumerWidget {
  const BeansStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameInstructionsScreenLayout(
        title: 'cognitive.gameColorBeans.title'.tr(),
        instructions: 'cognitive.gameColorBeans.instructions'.tr(),
        onPressed: () {
          ref.read(beansGameProvider.notifier).reset(null);

          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => BeansGameScreen())));
        });
  }
}
