import 'package:epsycheart/cognitive/common/models/base_game_notifier.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/drawing/context/drawing_game_list_notifier.dart';
import 'package:epsycheart/cognitive/drawing/models/drawing_data_model.dart';
import 'package:epsycheart/cognitive/drawing/models/drawing_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawingGameNotifier extends BaseGameNotifier<DrawingGameModel,
    DrawingDataModel, DrawingGameListNotifier, void, void> {
  DrawingGameNotifier(
      Ref ref,
      StateNotifierProvider<DrawingGameListNotifier, List<DrawingDataModel>>
          gameListProvider,
      {DrawingGameModel? initialState})
      : super(ref, gameListProvider, initialState ?? DrawingGameModel());

  @override
  void cancel() {
    // TODO: implement cancel
  }

  @override
  DrawingGameModel initialGameState(void params) {
    // TODO: implement initialGameState
    throw UnimplementedError();
  }

  @override
  Future<GameStatusType> update(void params) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void onReset(void params) {
    state = initialGameState(params);
  }

  @override
  void setPlayerResponseTimes(double min, double max, double avg) {
    state = state.copyWith(
        minResponseTime: min, maxResponseTime: max, avgResponseTime: avg);
  }

  @override
  DateTime? getPlayerStartResponseTime() => state.startResponseTime;

  @override
  void setPlayerStartResponseTime(DateTime? time) {
    state = state.copyWith(startResponseTime: time);
  }
}
