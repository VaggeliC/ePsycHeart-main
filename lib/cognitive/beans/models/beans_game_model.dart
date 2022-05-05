import 'dart:ui';

import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beans_game_model.freezed.dart';

@freezed
class BeansGameModel with BaseGameModel, _$BeansGameModel {
  @Implements<BaseGameModel>()
  const factory BeansGameModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      Color? targetColor,
      Color? selectedColor,
      @Default([]) List<Color> boardColors,
      Color? draggedColor,
      DateTime? startResponseTime}) = _BeansGameModel;
}
