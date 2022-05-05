import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/cognitive/beans/context/beans_game_providers.dart';
import 'package:epsycheart/cognitive/beans/screens/beans_start_screen.dart';
import 'package:epsycheart/cognitive/common/constants/spacing_constants.dart';
import 'package:epsycheart/cognitive/common/widgets/buttons/card_button.dart';
import 'package:epsycheart/cognitive/common/widgets/grids/card_grid.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/action_screen_layout.dart';
import 'package:epsycheart/cognitive/common/widgets/panels/section_key_value_panel.dart';
import 'package:epsycheart/cognitive/drawing/context/drawing_game_providers.dart';
import 'package:epsycheart/cognitive/drawing/screens/drawing_start_screen.dart';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_providers.dart';
import 'package:epsycheart/cognitive/tictactoe/screens/tictactoe_start_screen.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:epsycheart/cognitive/word/screens/word_start_screen.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CognitiveMenuScreen extends HookConsumerWidget {
  const CognitiveMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(findWordGameListProvider);
    ref.watch(ticTacToeGameListProvider);
    ref.watch(beansGameListProvider);
    ref.watch(drawingGameListProvider);

    final gameWordListNotifier = ref.read(findWordGameListProvider.notifier);
    final gameTicTacToeListNotifier =
        ref.read(ticTacToeGameListProvider.notifier);
    final gameBeansListNotifier = ref.read(beansGameListProvider.notifier);
    final gameDrawingListNotifier = ref.read(drawingGameListProvider.notifier);

    final sectionWord =
        SectionKeyValuePanelItem(title: 'cognitive.gameWord.title'.tr(), data: {
      'cognitive.menu.totalWinsText'.tr():
          gameWordListNotifier.totalWins().toString(),
      'cognitive.menu.totalLossesText'.tr():
          gameWordListNotifier.totalLosses().toString(),
    });

    final sectionTicTacToe = SectionKeyValuePanelItem(
        title: 'cognitive.gameTicTacToe.title'.tr(),
        data: {
          'cognitive.menu.totalWinsText'.tr():
              gameTicTacToeListNotifier.totalWins().toString(),
          'cognitive.menu.totalDrawsText'.tr():
              gameTicTacToeListNotifier.totalDraws().toString(),
          'cognitive.menu.totalLossesText'.tr():
              gameTicTacToeListNotifier.totalLosses().toString(),
        });

    final sectionBeans = SectionKeyValuePanelItem(
        title: 'cognitive.gameColorBeans.title'.tr(),
        data: {
          'cognitive.menu.totalWinsText'.tr():
              gameBeansListNotifier.totalWins().toString(),
          'cognitive.menu.totalLossesText'.tr():
              gameBeansListNotifier.totalLosses().toString(),
        });

    final sectionDrawing = SectionKeyValuePanelItem(
        title: 'cognitive.gameDrawing.title'.tr(),
        data: {
          'cognitive.menu.totalWinsText'.tr():
              gameDrawingListNotifier.totalWins().toString(),
          'cognitive.menu.totalLossesText'.tr():
              gameDrawingListNotifier.totalLosses().toString(),
        });

    return ActionScreenLayout(
      title: 'cognitive.menu.title'.tr(),
      flexContentArea: 60,
      flexActionsArea: 40,
      verticalAreaSpacing: SpacingConstants.spacingXXL,
      content: [
        Expanded(
          child: SectionKeyValuePanel(
              title: 'cognitive.menu.statsTitle'.tr(),
              dataSections: [
                sectionWord,
                sectionTicTacToe,
                sectionBeans,
                sectionDrawing
              ]),
        ),
      ],
      screenActions: [
        Expanded(
            child: CardGrid(
          children: [
            CardButton(
              maxLines: 2,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WordStartScreen())));
              },
              icon: Icons.grid_on,
              label: 'cognitive.gameWord.title'.tr(),
              primaryColor: AppTheme.blue,
            ),
            CardButton(
              maxLines: 2,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => TicTacToeStartScreen())));
              },
              icon: Icons.tag,
              label: 'cognitive.gameTicTacToe.title'.tr(),
              primaryColor: AppTheme.green,
            ),
            CardButton(
              maxLines: 2,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => BeansStartScreen())));
              },
              icon: Icons.group_work_outlined,
              label: 'cognitive.gameColorBeans.title'.tr(),
              primaryColor: AppTheme.red,
            ),
            CardButton(
              maxLines: 2,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DrawingStartScreen())));
              },
              icon: Icons.brush_outlined,
              label: 'cognitive.gameDrawing.title'.tr(),
              primaryColor: AppTheme.purple,
            ),
          ],
        ))
      ],
    );
  }
}
