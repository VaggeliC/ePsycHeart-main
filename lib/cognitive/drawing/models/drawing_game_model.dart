import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawing_game_model.freezed.dart';

@freezed
class DrawingGameModel with BaseGameModel, _$DrawingGameModel {
  @Implements<BaseGameModel>()
  const factory DrawingGameModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      DateTime? startResponseTime}) = _DrawingGameModel;
}
