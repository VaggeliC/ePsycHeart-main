import 'dart:math';
import 'dart:ui';

import 'package:epsycheart/cognitive/beans/context/beans_game_list_notifier.dart';
import 'package:epsycheart/cognitive/beans/models/beans_data_model.dart';
import 'package:epsycheart/cognitive/beans/models/beans_game_model.dart';
import 'package:epsycheart/cognitive/beans/utilities/bean_utilities.dart';
import 'package:epsycheart/cognitive/common/models/base_game_notifier.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BeansGameNotifier extends BaseGameNotifier<BeansGameModel, BeansDataModel,
    BeansGameListNotifier, void, void> {
  BeansGameNotifier(
      Ref<Object?> ref,
      StateNotifierProvider<BeansGameListNotifier, List<BeansDataModel>>
          gameListProvider,
      {BeansGameModel? initialState})
      : super(ref, gameListProvider, initialState ?? BeansGameModel());

  void setSelectedColor(Color color) async {
    state = state.copyWith(selectedColor: color);

    await play(null);
  }

  void startDragging(Color color) {
    state = state.copyWith(draggedColor: color);
  }

  void stopDragging() {
    state = state.copyWith(draggedColor: null);
  }

  @override
  void cancel() {
    state = state.copyWith(status: GameStatusType.canceled);
  }

  @override
  BeansGameModel initialGameState(void params) {
    final targetColor = beansGenerateTargetColor();
    final colors =
        beansGenerateRandomColors(targetColor: targetColor, count: 4);

    return BeansGameModel(
        status: GameStatusType.playing,
        minResponseTime: state.minResponseTime,
        maxResponseTime: state.maxResponseTime,
        avgResponseTime: state.avgResponseTime,
        targetColor: targetColor,
        boardColors: [...colors]);
  }

  // @override
  // void startPlayerReponseTimeRecording() {
  //   if (state.startResponseTime != null) {
  //     stopPlayerReponseTimeRecording();
  //   }

  //   state = state.copyWith(startResponseTime: DateTime.now());
  // }

  // @override
  // void stopPlayerReponseTimeRecording() {
  //   if (state.startResponseTime == null) {
  //     return;
  //   }

  //   DateTime endResponseTime = DateTime.now();

  //   final responseTime =
  //       endResponseTime.difference(state.startResponseTime!).inMilliseconds;

  //   double minResp = min(state.minResponseTime ?? 0, responseTime.toDouble());
  //   double maxResp = max(state.maxResponseTime ?? 0, responseTime.toDouble());
  //   double avgResp = (state.avgResponseTime ?? 0 + responseTime.toDouble()) / 2;

  //   state = state.copyWith(
  //       startResponseTime: null,
  //       minResponseTime: minResp,
  //       maxResponseTime: maxResp,
  //       avgResponseTime: avgResp);
  // }

  @override
  Future<GameStatusType> update(void params) async {
    if (state.targetColor != null && state.selectedColor != null) {
      state = state.copyWith(
          status: state.selectedColor == state.targetColor
              ? GameStatusType.won
              : GameStatusType.lost);
    }

    return state.status;
  }

  @override
  void onReset(void params) {}

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
