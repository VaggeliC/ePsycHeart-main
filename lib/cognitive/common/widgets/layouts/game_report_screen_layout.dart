import 'package:epsycheart/cognitive/common/models/base_game_list_notifier.dart';
import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/widgets/buttons/circle_button.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/action_screen_layout.dart';
import 'package:epsycheart/cognitive/common/widgets/panels/key_value_panel.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameReportScreenLayout<
    TGame extends BaseGameModel,
    TData extends BaseGameModel,
    TGamesProvider extends StateNotifierProvider<
        BaseGameListNotifier<TData, TGame>,
        List<TData>>> extends HookConsumerWidget {
  final String title;
  final VoidCallback? onHomePressed;
  final TGamesProvider gameListProvider;
  final String? winsTitle;
  final String? lossesTitle;
  final String? drawsTitle;

  const GameReportScreenLayout(
      {Key? key,
      required this.gameListProvider,
      this.title = '',
      this.winsTitle,
      this.lossesTitle,
      this.drawsTitle,
      this.onHomePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameListNotifier = ref.read(gameListProvider.notifier);

    final Map<String, String> data = {
      if (winsTitle != null)
        '$winsTitle': gameListNotifier.totalWins().toString(),
      if (drawsTitle != null)
        '$drawsTitle': gameListNotifier.totalDraws().toString(),
      if (lossesTitle != null)
        '$lossesTitle': gameListNotifier.totalLosses().toString(),
    };

    return ActionScreenLayout(
      title: title,
      content: [
        Expanded(
            child: KeyValuePanel(
          data: data,
        ))
      ],
      screenActions: [
        CircleButton(
          onPressed: onHomePressed,
          primaryColor: AppTheme.blue,
          icon: Icons.home,
        )
      ],
    );
  }
}
