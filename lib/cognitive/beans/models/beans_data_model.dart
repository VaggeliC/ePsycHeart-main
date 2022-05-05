import 'dart:ui';

import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beans_data_model.freezed.dart';

@freezed
class BeansDataModel with BaseGameModel, _$BeansDataModel {
  @Implements<BaseGameModel>()
  const factory BeansDataModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      Color? targetColor,
      Color? selectedColor}) = _BeansDataModel;
}
