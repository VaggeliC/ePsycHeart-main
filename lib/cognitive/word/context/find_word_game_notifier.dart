import 'dart:math';
import 'dart:ui';
import 'package:epsycheart/cognitive/common/models/base_game_notifier.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_list_notifier.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_providers.dart';
import 'package:epsycheart/cognitive/word/models/find_word_game_data_model.dart';
import 'package:epsycheart/cognitive/word/models/find_word_game_model.dart';
import 'package:epsycheart/cognitive/word/types/find_word_types.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_constants.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_engine.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_location.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_settings.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindWordGameNotifier extends BaseGameNotifier<
    FindWordGameModel,
    FindWordGameDataModel,
    FindWordGameListNotifier,
    FindWordResetParams,
    void> {
  final FindWordEngine _engine;

  FindWordGameNotifier(
      Ref<Object?> ref,
      StateNotifierProvider<FindWordGameListNotifier,
              List<FindWordGameDataModel>>
          gameListProvider,
      {FindWordGameModel? initialState})
      : _engine = FindWordEngine(),
        super(ref, gameListProvider, initialState ?? FindWordGameModel());

  void setSelectedStartTile(Point<int> tile) {
    state = state.copyWith(selectedStartTile: tile);
  }

  void setSelectedEndTile(Point<int> tile) {
    Future.microtask(() async {
      state = state.copyWith(selectedEndTile: tile);

      await play(null);
    });
  }

  void setDragStart(Offset position) {
    state = state.copyWith(dragStart: position);
  }

  void setDragEnd(Offset position) {
    state = state.copyWith(dragEnd: position);
  }

  void resetDragPositions() {
    state = state.copyWith(dragStart: null, dragEnd: null);
  }

  @override
  void cancel() {
    state = state.copyWith(status: GameStatusType.canceled);
  }

  @override
  FindWordGameModel initialGameState(FindWordResetParams? params) {
    final settings = FindWordSettings(
        width: params!.columns,
        height: params.rows,
        orientations: [FindWordOrientation.verticalUp]);

    final newPuzzle = _engine.newPuzzle(params.words, settings,
        defaultLetters: params.defaultLetters);

    final solution = _engine.solvePuzzle(newPuzzle.puzzle, params.words);

    startPlayerReponseTimeRecording();

    return FindWordGameModel(
      status: GameStatusType.playing,
      startTime: DateTime.now(),
      rows: params.rows,
      columns: params.columns,
      words: params.words,
      puzzle: newPuzzle,
      solution: solution,
      minResponseTime: state.minResponseTime,
      maxResponseTime: state.maxResponseTime,
      avgResponseTime: state.avgResponseTime,
      startResponseTime: DateTime.now(),
    );
  }

  @override
  Future<GameStatusType> update(void params) async {
    stopPlayerReponseTimeRecording();

    FindWordLocation loc = state.solution!.found.first;

    int startIndex = point2DTo1DIndex(Point(loc.x, loc.y), state.columns);
    int endIndex = point2DTo1DIndex(Point(loc.endX, loc.endY), state.columns);
    int selectedStartIndex =
        point2DTo1DIndex(state.selectedStartTile!, state.columns);
    int selectedEndIndex =
        point2DTo1DIndex(state.selectedEndTile!, state.columns);

    var status = state.status;

    DateTime? endTime;

    if (startIndex == selectedStartIndex && endIndex == selectedEndIndex) {
      status = GameStatusType.won;
      endTime = DateTime.now();
    } else {
      ref
          .read(findWordGameListProvider.notifier)
          .add(state.copyWith(status: GameStatusType.lost));
    }

    state = state.copyWith(status: status, endTime: endTime);

    return state.status;
  }

  @override
  void onReset(FindWordResetParams? params) {
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

class FindWordResetParams {
  final List<String> words;
  final String defaultLetters;
  final int rows;
  final int columns;

  const FindWordResetParams(
      {this.words = const [],
      this.defaultLetters = findWordDefaultLetters,
      this.rows = findWordDefaultRows,
      this.columns = findWordDefaultColumns});
}
