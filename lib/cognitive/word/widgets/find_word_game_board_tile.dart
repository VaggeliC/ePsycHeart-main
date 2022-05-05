import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:epsycheart/cognitive/common/constants/font_constants.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_utils.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindWordGameBoardTile extends HookConsumerWidget {
  final String letter;
  final Point<int> tileData;

  const FindWordGameBoardTile({
    Key? key,
    required this.letter,
    required this.tileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(findWordGameProvider);
    final gameNotifier = ref.read(findWordGameProvider.notifier);

    return Draggable(
        data: tileData,
        feedback: Container(),
        child: DragTarget<Point<int>>(onAccept: (data) {
          if (!gameNotifier.isPlaying()) {
            return;
          }

          gameNotifier.setSelectedStartTile(data);
          gameNotifier.setSelectedEndTile(tileData);
        }, builder: ((context, candidateData, rejectedData) {
          final tileFound = game.status == GameStatusType.won &&
              isPointOnLine(
                  game.selectedStartTile, game.selectedEndTile, tileData);
          return DecoratedBox(
              decoration: BoxDecoration(
                  color: tileFound ? AppTheme.blue : AppTheme.white,
                  border: Border.all(color: AppTheme.black, width: 0.1)),
              child: Center(
                  child: AutoSizeText(
                letter,
                style: TextStyle(
                    fontSize: FontConstants.fontSizeXL,
                    color: tileFound ? AppTheme.white : AppTheme.black),
                minFontSize: FontConstants.fontSizeS,
                maxFontSize: FontConstants.fontSizeL,
                maxLines: 1,
                textAlign: TextAlign.center,
              )));
        })));
  }
}
