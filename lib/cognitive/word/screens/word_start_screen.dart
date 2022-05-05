import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/game_instructions_screen_layout.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_notifier.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:epsycheart/cognitive/word/screens/word_game_screen.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordStartScreen extends HookConsumerWidget {
  const WordStartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GameInstructionsScreenLayout(
      title: 'cognitive.gameWord.title'.tr(),
      instructions: 'cognitive.gameWord.instructions'.tr(),
      onPressed: () {
        final words = findWordRandomWords();
        ref.read(findWordGameProvider.notifier).reset(FindWordResetParams(
            words: words,
            defaultLetters: 'cognitive.gameWord.defaultLetters'.tr()));

        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => WordGameScreen())));
      },
    );
  }
}
