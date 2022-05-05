import 'package:epsycheart/cognitive/beans/context/beans_game_providers.dart';
import 'package:epsycheart/cognitive/beans/widgets/bean.dart';
import 'package:epsycheart/cognitive/beans/widgets/beans_drop_target.dart';
import 'package:epsycheart/cognitive/common/widgets/grids/card_grid.dart';
import 'package:epsycheart/cognitive/common/widgets/responsive/responsive_sized_box.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BeansGameBoard extends HookConsumerWidget {
  const BeansGameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(beansGameProvider);
    final gameNotifier = ref.read(beansGameProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 20,
          child: Center(
              child: BeansDropTarget(
            targetColor: game.selectedColor,
          )),
        ),
        ResponsiveSizedBox(
          width: 10,
          height: 20,
        ),
        Expanded(
            flex: 80,
            child: Center(
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: game.targetColor!, width: 40),
                          color: AppTheme.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppTheme.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 3)),
                          ],
                          shape: BoxShape.circle),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(
                                child: CardGrid(
                              landscapeCells: 2,
                              portraitCells: 2,
                              children: game.boardColors
                                  .map((e) => Draggable(
                                      data: gameNotifier.isPlaying() ? e : null,
                                      onDragStarted: gameNotifier.isPlaying()
                                          ? () {
                                              gameNotifier.startDragging(e);
                                            }
                                          : null,
                                      onDragEnd: gameNotifier.isPlaying()
                                          ? (details) {
                                              gameNotifier.setSelectedColor(e);
                                              gameNotifier.stopDragging();
                                            }
                                          : null,
                                      child: (game.draggedColor == e ||
                                              game.selectedColor == e)
                                          ? Container()
                                          : Bean(
                                              color: e,
                                            ),
                                      feedback: gameNotifier.isPlaying()
                                          ? Bean(
                                              color: e,
                                            )
                                          : Container()))
                                  .toList(),
                            )),
                          ))),
                ],
              ),
            ))
      ],
    );
  }
}
