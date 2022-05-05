import 'dart:math';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:epsycheart/cognitive/word/widgets/find_word_game_board_tile.dart';
import 'package:epsycheart/cognitive/word/widgets/line_painter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindWordGameBoard extends HookConsumerWidget {
  const FindWordGameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(findWordGameProvider);
    final gameNotifier = ref.read(findWordGameProvider.notifier);

    return AspectRatio(
        aspectRatio: 1,
        child: Listener(
            behavior: HitTestBehavior.deferToChild,
            onPointerDown: (event) {
              if (!gameNotifier.isPlaying()) {
                return;
              }

              gameNotifier.setDragStart(event.localPosition);
            },
            onPointerMove: (event) {
              if (!gameNotifier.isPlaying()) {
                return;
              }
              gameNotifier.setDragEnd(event.localPosition);
            },
            onPointerUp: (event) {
              if (!gameNotifier.isPlaying()) {
                return;
              }
              gameNotifier.resetDragPositions();
            },
            child: Stack(children: [
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                      game.rows,
                      (row) => Expanded(
                              child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(game.columns, (column) {
                              final letter = game.puzzle?.puzzle[row][column]
                                      .toUpperCase() ??
                                  '';

                              return Expanded(
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: FindWordGameBoardTile(
                                        letter: letter,
                                        tileData: Point<int>(column, row),
                                      )));
                            }),
                          )))),
              if (gameNotifier.isPlaying())
                IgnorePointer(
                    child: CustomPaint(
                        painter: LinePainter(
                            strokeWidth: 15,
                            start: game.dragStart,
                            end: game.dragEnd)))
            ])));
  }
}
