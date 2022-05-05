import 'dart:math';
import 'dart:ui';

import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_constants.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_new_puzzle.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_solved.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_word_game_model.freezed.dart';

@freezed
class FindWordGameModel with BaseGameModel, _$FindWordGameModel {
  @Implements<BaseGameModel>()
  const factory FindWordGameModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      @Default(findWordDefaultRows) int rows,
      @Default(findWordDefaultColumns) int columns,
      @Default([]) List<String> words,
      FindWordNewPuzzle? puzzle,
      FindWordSolved? solution,
      Point<int>? selectedStartTile,
      Point<int>? selectedEndTile,
      Offset? dragStart,
      Offset? dragEnd,
      DateTime? startResponseTime}) = _FindWordGameModel;
}
