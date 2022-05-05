import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawing_data_model.freezed.dart';

@freezed
class DrawingDataModel with BaseGameModel, _$DrawingDataModel {
  @Implements<BaseGameModel>()
  const factory DrawingDataModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime}) = _DrawingDataModel;
}
