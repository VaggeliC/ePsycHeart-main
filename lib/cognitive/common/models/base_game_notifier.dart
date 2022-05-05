import 'dart:math';

import 'package:epsycheart/cognitive/common/models/base_game_list_notifier.dart';
import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseGameNotifier<
    TGame extends BaseGameModel,
    TData extends BaseGameModel,
    TGameListNotifier extends BaseGameListNotifier<TData, TGame>,
    TResetParams,
    TPlayParams> extends StateNotifier<TGame> {
  final Ref ref;

  final StateNotifierProvider<TGameListNotifier, List<TData>> gameListProvider;

  BaseGameNotifier(this.ref, this.gameListProvider, TGame initialState)
      : super(initialState);

  bool isPlaying() => state.status == GameStatusType.playing;

  void setPlayerResponseTimes(double min, double max, double avg);

  DateTime? getPlayerStartResponseTime();

  void setPlayerStartResponseTime(DateTime? time);

  bool isGameOver(GameStatusType status) => [
        GameStatusType.draw,
        GameStatusType.lost,
        GameStatusType.won,
        GameStatusType.canceled
      ].contains(status);

  bool isCanceled() => state.status == GameStatusType.canceled;

  TGame initialGameState(TResetParams? params);

  void cancel();

  void startPlayerReponseTimeRecording() {
    if (getPlayerStartResponseTime() != null) {
      return;
    }

    setPlayerStartResponseTime(DateTime.now());
  }

  void stopPlayerReponseTimeRecording() {
    if (getPlayerStartResponseTime() == null) {
      return;
    }

    DateTime endResponseTime = DateTime.now();

    final responseTime = endResponseTime
        .difference(getPlayerStartResponseTime()!)
        .inMilliseconds;

    double minResp =
        min(state.minResponseTime ?? double.maxFinite, responseTime.toDouble());
    double maxResp = max(state.maxResponseTime ?? 0, responseTime.toDouble());
    double
        avgResp; // = (state.avgResponseTime ?? 0 + responseTime.toDouble()) / 2;

    if (state.avgResponseTime == null) {
      avgResp = responseTime.toDouble();
    } else {
      avgResp = (state.avgResponseTime! + responseTime) / 2;
    }

    setPlayerResponseTimes(minResp, maxResp, avgResp);
  }

  void onReset(TResetParams? params);

  Future<GameStatusType> update(TPlayParams params);

  void addGameToList() {
    final listNotifier = ref.read(gameListProvider.notifier);

    listNotifier.add(state);
  }

  void reset(TResetParams? params) {
    if (isPlaying()) {
      stopPlayerReponseTimeRecording();
      cancel();
      addGameToList();
    }

    state = initialGameState(params);

    onReset(params);
  }

  Future play(TPlayParams params) async {
    if (!isPlaying()) {
      return;
    }

    final status = await update(params);

    if (isGameOver(status)) {
      addGameToList();
    }
  }
}
