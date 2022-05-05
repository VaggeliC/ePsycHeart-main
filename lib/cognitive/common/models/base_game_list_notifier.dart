import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/models/base_game_model_extensions.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseGameListNotifier<TDataModel extends BaseGameModel,
    TGameModel extends BaseGameModel> extends StateNotifier<List<TDataModel>> {
  BaseGameListNotifier(List<TDataModel>? initialState)
      : super(initialState ?? []);

  TDataModel mapGameModelToDataModel(TGameModel model);

  void add(TGameModel gameModel) {
    final dataModel = mapGameModelToDataModel(gameModel);

    state = [...state, dataModel];
  }

  void clear() {
    state = [];
  }

  TDataModel latest() => state.last;

  int totalGameTime() =>
      state.fold(0, (sum, game) => sum + game.gameTimeInMSecs());

  int totalWins() =>
      state.where((game) => game.status == GameStatusType.won).length;

  int totalDraws() =>
      state.where((game) => game.status == GameStatusType.draw).length;

  int totalLosses() =>
      state.where((game) => game.status == GameStatusType.lost).length;

  int totalCancels() =>
      state.where((game) => game.status == GameStatusType.canceled).length;

  double totalMinResponseTimeInMSecs() =>
      state.fold(0, (sum, game) => (sum + (game.minResponseTime ?? 0)) / 2);

  double totalMaxResponseTimeInMSecs() =>
      state.fold(0, (sum, game) => (sum + (game.maxResponseTime ?? 0)) / 2);

  double totalAvgResponseTimeInMSecs() =>
      state.fold(0, (sum, game) => (sum + (game.avgResponseTime ?? 0)) / 2);

  double totalPlayTimeInMSecs() =>
      state.fold(0, (sum, game) => sum + game.gameTimeInMSecs());
}
